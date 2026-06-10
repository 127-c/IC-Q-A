//=============================================================
// Q88_练习：TLM 端口连接 port / export / imp
// 难度: ⭐⭐ | 目标: 掌握三种TLM端口类型
//   port   → initiator端(发起者)
//   export → 中间转发端口
//   imp    → target端(终点), 必须实现对应方法
//
// 连接方向: port → export → imp (单向)
//=============================================================

`include "uvm_macros.svh"
import uvm_pkg::*;

class my_item extends uvm_sequence_item;
  `uvm_object_utils(my_item)
  rand int val;
  function new(string name="my_item"); super.new(name); endfunction
endclass

//----------------------------------------------------------
// TODO 1: Producer — port 发送
//----------------------------------------------------------
class producer extends uvm_component;
  `uvm_component_utils(producer)
  // TODO: 声明 put_port
  // 【参考答案】uvm_blocking_put_port #(my_item) put_port;

  function void build_phase(uvm_phase phase);
    put_port = new("put_port", this);
  endfunction

  task run_phase(uvm_phase phase);
    my_item item = my_item::type_id::create("item");
    item.val = 42;
    // TODO: 用 put_port 发送 item
    // 【参考答案】put_port.put(item);
    $display("[PROD] Sent item val=%0d", item.val);
  endtask
endclass

//----------------------------------------------------------
// TODO 2: Consumer — imp 接收, 必须实现 put()
//----------------------------------------------------------
class consumer extends uvm_component;
  `uvm_component_utils(consumer)
  // TODO: 声明 put_imp (注意: imp需要两个参数 <T, IMP>)
  // 【参考答案】uvm_blocking_put_imp #(my_item, consumer) put_imp;

  function void build_phase(uvm_phase phase);
    put_imp = new("put_imp", this);
  endfunction

  // TODO: 实现 put(task) — imp 必须实现通信方法!
  // 【参考答案】
  // task put(my_item t);
  //   $display("[CONS] Received item val=%0d", t.val);
  // endtask
endclass

//----------------------------------------------------------
// TODO 3: Env — 在 connect_phase 中连接 port → imp
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
    // TODO: 连接 prod 的 port 到 cons 的 imp
    // 【参考答案】prod.put_port.connect(cons.put_imp);
  endfunction
endclass
