//=============================================================
// Q16_练习：UVM 验证环境组成 (agent/driver/monitor/sequencer/env)
// 难度: ⭐⭐ | 目标: 搭建一个完整的UVM环境骨架
//=============================================================

`include "uvm_macros.svh"
import uvm_pkg::*;

// --- transaction ---
class my_item extends uvm_sequence_item;
  `uvm_object_utils(my_item)
  rand bit [7:0] data;
  function new(string name="my_item"); super.new(name); endfunction
endclass

// --- driver ---
class my_driver extends uvm_driver #(my_item);
  `uvm_component_utils(my_driver)
  function new(string name, uvm_component parent); super.new(name, parent); endfunction
  task run_phase(uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(req);
      `uvm_info("DRV", $sformatf("driving data=%0h", req.data), UVM_MEDIUM)
      #10;
      seq_item_port.item_done();
    end
  endtask
endclass

// --- monitor ---
class my_monitor extends uvm_monitor;
  `uvm_component_utils(my_monitor)
  uvm_analysis_port #(my_item) ap;
  function new(string name, uvm_component parent); super.new(name, parent); endfunction
  function void build_phase(uvm_phase phase);
    ap = new("ap", this);
  endfunction
  task run_phase(uvm_phase phase);
    my_item item;
    forever begin
      #5;
      item = my_item::type_id::create("item");
      item.data = $random;
      ap.write(item);
    end
  endtask
endclass

// --- sequencer ---
class my_sequencer extends uvm_sequencer #(my_item);
  `uvm_component_utils(my_sequencer)
  function new(string name, uvm_component parent); super.new(name, parent); endfunction
endclass

// --- agent ---
class my_agent extends uvm_agent;
  `uvm_component_utils(my_agent)
  my_driver    drv;
  my_monitor   mon;
  my_sequencer sqr;
  function new(string name, uvm_component parent); super.new(name, parent); endfunction

  function void build_phase(uvm_phase phase);
    // TODO: 创建 driver, monitor, sequencer
    drv = my_driver::type_id::create("drv", this);
    mon = my_monitor::type_id::create("mon", this);
    sqr = my_sequencer::type_id::create("sqr", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    // TODO: 连接 driver 的 seq_item_port 到 sequencer 的 seq_item_export
    drv.seq_item_port.connect(sqr.seq_item_export);
  endfunction
endclass

// --- env ---
class my_env extends uvm_env;
  `uvm_component_utils(my_env)
  my_agent agt;
  function new(string name, uvm_component parent); super.new(name, parent); endfunction
  function void build_phase(uvm_phase phase);
    agt = my_agent::type_id::create("agt", this);
  endfunction
endclass
