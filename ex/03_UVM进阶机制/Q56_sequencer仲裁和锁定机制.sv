//=============================================================
// Q56_练习：Sequencer 仲裁机制 + lock/grab 锁定
// 难度: ⭐⭐⭐ | 目标: 掌握sequencer优先级和资源锁定
//=============================================================

`include "uvm_macros.svh"
import uvm_pkg::*;

class my_item extends uvm_sequence_item;
  `uvm_object_utils(my_item)
  rand int id;
  function new(string name="my_item"); super.new(name); endfunction
endclass


//----------------------------------------------------------
// TODO 1: 设置 sequencer 的仲裁模式
//----------------------------------------------------------
class my_sequencer extends uvm_sequencer #(my_item);
  `uvm_component_utils(my_sequencer)
  function new(string name, uvm_component parent); super.new(name, parent); endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // TODO: 从以下6种模式中选择设置
    // UVM_SEQ_ARB_FIFO          - FIFO顺序
    // UVM_SEQ_ARB_WEIGHTED      - 权重随机
    // UVM_SEQ_ARB_RANDOM        - 随机
    // UVM_SEQ_ARB_STRICT_FIFO   - 优先级 + FIFO
    // UVM_SEQ_ARB_STRICT_RANDOM - 优先级 + 随机
    // UVM_SEQ_ARB_USER          - 用户自定义
    set_arbitration(UVM_SEQ_ARB_STRICT_FIFO);
  endfunction
endclass


//----------------------------------------------------------
// TODO 2: sequence 中使用 lock() 和 grab()
//----------------------------------------------------------
class high_priority_seq extends uvm_sequence #(my_item);
  `uvm_object_utils(high_priority_seq)

  task body();
    // lock(): 先排队获得授权 → 锁定sequencer → 独占访问
    lock();
    $display("[LOCK] High priority seq got lock");
    repeat(3) begin
      my_item item = my_item::type_id::create("item");
      start_item(item);
      item.id = 999;
      finish_item(item);
    end
    unlock();
    $display("[LOCK] Released lock");
  endtask
endclass


class urgent_seq extends uvm_sequence #(my_item);
  `uvm_object_utils(urgent_seq)

  task body();
    // grab(): 无视排队 → 下一次授权周期立即获得 → 独占
    grab();
    $display("[GRAB] Urgent seq grabbed sequencer");
    repeat(2) begin
      my_item item = my_item::type_id::create("item");
      start_item(item);
      item.id = -1;
      finish_item(item);
    end
    ungrab();
    $display("[GRAB] Released grab");
  endtask
endclass
