//=============================================================
// Q56_练习：Sequencer 仲裁机制 + lock/grab 锁定
// 难度: ⭐⭐⭐ | 目标: 掌握sequencer的优先级仲裁和资源锁定
//=============================================================

`include "uvm_macros.svh"
import uvm_pkg::*;

class my_item extends uvm_sequence_item;
  `uvm_object_utils(my_item)
  rand int id;
  function new(string name="my_item"); super.new(name); endfunction
endclass

//----------------------------------------------------------
// TODO 1: 设置 sequencer 仲裁模式
//   可选: FIFO / WEIGHTED / RANDOM / STRICT_FIFO / STRICT_RANDOM / USER
//----------------------------------------------------------
class my_sequencer extends uvm_sequencer #(my_item);
  `uvm_component_utils(my_sequencer)
  function new(string name, uvm_component parent); super.new(name, parent); endfunction
  function void build_phase(uvm_phase phase);
    // TODO: 设置仲裁模式为 STRICT_FIFO (优先级+FIFO)
    // 【参考答案】set_arbitration(UVM_SEQ_ARB_STRICT_FIFO);
  endfunction
endclass

//----------------------------------------------------------
// TODO 2: lock() vs grab() 的区别
//   lock(): 先排队得授权 → 锁定 → unlock
//   grab():  无条件抢下一次授权 → ungrab
//----------------------------------------------------------
class high_priority_seq extends uvm_sequence #(my_item);
  `uvm_object_utils(high_priority_seq)
  task body();
    // TODO: 用 lock() 锁定sequencer, 发送3个item, 然后 unlock()
    // 【参考答案】lock();
    $display("[LOCK] High priority seq got lock");
    repeat(3) begin
      my_item item = my_item::type_id::create("item");
      start_item(item); item.id = 999; finish_item(item);
    end
    // 【参考答案】unlock();
  endtask
endclass

class urgent_seq extends uvm_sequence #(my_item);
  `uvm_object_utils(urgent_seq)
  task body();
    // TODO: 用 grab() 抢占sequencer, 发送2个item, 然后 ungrab()
    // 【参考答案】grab();
    $display("[GRAB] Urgent seq grabbed sequencer");
    repeat(2) begin
      my_item item = my_item::type_id::create("item");
      start_item(item); item.id = -1; finish_item(item);
    end
    // 【参考答案】ungrab();
  endtask
endclass
