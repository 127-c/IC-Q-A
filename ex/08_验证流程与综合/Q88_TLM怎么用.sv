//=============================================================
// Q88_练习：TLM 端口连接
// 难度: ⭐⭐ | 目标: 掌握port/export/imp三种端口
//=============================================================

`include "uvm_macros.svh"
import uvm_pkg::*;

class my_item extends uvm_sequence_item;
  `uvm_object_utils(my_item)
  rand int val;
  function new(string name="my_item"); super.new(name); endfunction
endclass


//----------------------------------------------------------
// TODO 1: Producer — 用 blocking_put_port 发送
//----------------------------------------------------------
class producer extends uvm_component;
  `uvm_component_utils(producer)
  uvm_blocking_put_port #(my_item) put_port;  // initiator端口

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    put_port = new("put_port", this);
  endfunction

  task run_phase(uvm_phase phase);
    my_item item = my_item::type_id::create("item");
    item.val = 42;
    // TODO: 用 put_port.put() 发送
    put_port.put(item);
    $display("[PROD] Sent item with val=%0d", item.val);
  endtask
endclass


//----------------------------------------------------------
// TODO 2: Consumer — 用 blocking_put_imp 接收
//   imp 作为最终接收端, 必须实现 put() 方法
//----------------------------------------------------------
class consumer extends uvm_component;
  `uvm_component_utils(consumer)
  uvm_blocking_put_imp #(my_item, consumer) put_imp;  // target端口

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    put_imp = new("put_imp", this);
  endfunction

  // TODO: 实现 put() — 参数(T t, IMP imp)中的T和IMP
  task put(my_item t);
    $display("[CONS] Received item val=%0d", t.val);
  endtask
endclass


//----------------------------------------------------------
// TODO 3: Env — 在connect_phase中连接
//----------------------------------------------------------
class my_env extends uvm_env;
  `uvm_component_utils(my_env)
  producer prod;
  consumer cons;

  function void build_phase(uvm_phase phase);
    prod = producer::type_id::create("prod", this);
    cons = consumer::type_id::create("cons", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    // TODO: 连接 port → imp
    prod.put_port.connect(cons.put_imp);
  endfunction
endclass

// =============================================================
// 三种端口总结:
//   port   → initiator端(发起者), 如 put_port, get_port
//   export → 中间端口(转发),   如 put_export
//   imp    → target端(终点),    如 put_imp, 必须实现对应方法
//
// 连接方向: port → export → imp (只能单向)
//   port可以连多个export/imp, 但不能反过来
// =============================================================
