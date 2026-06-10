//=============================================================
// Q18_练习：sequence → sequencer → driver TLM握手全流程
// 难度: ⭐⭐⭐ | 目标: 掌握 start_item→randomize→finish_item→get_next_item→item_done
//=============================================================

`include "uvm_macros.svh"
import uvm_pkg::*;

class my_item extends uvm_sequence_item;
  `uvm_object_utils(my_item)
  rand bit [7:0] addr, data;
  function new(string name="my_item"); super.new(name); endfunction
endclass

//----------------------------------------------------------
// TODO 1: sequence — 在body()中生成5个item
//   三步: start_item → randomize → finish_item
//----------------------------------------------------------
class my_sequence extends uvm_sequence #(my_item);
  `uvm_object_utils(my_sequence)
  task body();
    my_item item;
    repeat(5) begin
      item = my_item::type_id::create("item");
      // TODO: start_item(item);
      // 【参考答案】start_item(item);
      // TODO: item.randomize();
      // 【参考答案】item.randomize();
      $display("[SEQ] addr=%0h data=%0h", item.addr, item.data);
      // TODO: finish_item(item);
      // 【参考答案】finish_item(item);
    end
  endtask
endclass

//----------------------------------------------------------
// TODO 2: driver — get_next_item → 驱动 → item_done
//----------------------------------------------------------
class my_driver extends uvm_driver #(my_item);
  `uvm_component_utils(my_driver)
  function new(string name, uvm_component parent); super.new(name, parent); endfunction
  task run_phase(uvm_phase phase);
    forever begin
      // TODO: 获取item
      // 【参考答案】seq_item_port.get_next_item(req);
      $display("[DRV] Driving: addr=%0h data=%0h", req.addr, req.data);
      #10;
      // TODO: 通知完成
      // 【参考答案】seq_item_port.item_done();
    end
  endtask
endclass

class my_sequencer extends uvm_sequencer #(my_item);
  `uvm_component_utils(my_sequencer)
  function new(string name, uvm_component parent); super.new(name, parent); endfunction
endclass

class my_agent extends uvm_agent;
  `uvm_component_utils(my_agent)
  my_driver drv; my_sequencer sqr;
  function void build_phase(uvm_phase phase);
    drv = my_driver::type_id::create("drv", this);
    sqr = my_sequencer::type_id::create("sqr", this);
  endfunction
  function void connect_phase(uvm_phase phase);
    drv.seq_item_port.connect(sqr.seq_item_export);
  endfunction
endclass

class my_env extends uvm_env;
  `uvm_component_utils(my_env)
  my_agent agt;
  function void build_phase(uvm_phase phase);
    agt = my_agent::type_id::create("agt", this);
  endfunction
endclass

class my_test extends uvm_test;
  `uvm_component_utils(my_test)
  my_env env;
  function void build_phase(uvm_phase phase);
    env = my_env::type_id::create("env", this);
  endfunction
  task run_phase(uvm_phase phase);
    my_sequence seq;
    phase.raise_objection(this);
    seq = my_sequence::type_id::create("seq");
    // TODO: 启动sequence并绑定sequencer
    // 【参考答案】seq.start(env.agt.sqr);
    phase.drop_objection(this);
  endtask
endclass
