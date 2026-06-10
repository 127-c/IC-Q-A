//=============================================================
// Q07_练习：UVM Factory 工厂机制 (三步: 注册→创建→覆盖)
// 难度: ⭐⭐ | 目标: 掌握factory的注册、创建、覆盖
//=============================================================

`include "uvm_macros.svh"
import uvm_pkg::*;

//----------------------------------------------------------
// TODO 1: 定义基类 bird, 注册到factory表
//   注册宏: `uvm_object_utils
//----------------------------------------------------------
class bird extends uvm_object;
  // TODO: 填写注册宏
  // 【参考答案】`uvm_object_utils(bird)

  function new(string name = "bird");
    super.new(name);
  endfunction

  virtual function void sing();
    $display("Bird: chirp chirp~");
  endfunction
endclass


//----------------------------------------------------------
// TODO 2: 定义扩展类 parrot, 注册, 重写sing()
//----------------------------------------------------------
class parrot extends bird;
  // TODO: 填写注册宏
  // 【参考答案】`uvm_object_utils(parrot)

  function new(string name = "parrot");
    super.new(name);
  endfunction

  // TODO: 重写sing() → "Parrot: Hello World!"
  // 【参考答案】
  // virtual function void sing();
  //   $display("Parrot: Hello World!");
  // endfunction
endclass


//----------------------------------------------------------
// TODO 3: 测试factory覆盖
//----------------------------------------------------------
module tb_q07_factory;
  initial begin
    bird b;

    // 情况1: 用 type_id::create 创建bird → 输出?
    b = bird::type_id::create("b1");
    b.sing();

    // 情况2: 用 set_type_override 将 bird→parrot → 输出?
    // TODO: 在此处写你的代码
    // 【参考答案】bird::type_id::set_type_override(parrot::get_type());
    b = bird::type_id::create("b2");
    b.sing();

    // 情况3: 直接 new → factory覆盖生效吗?
    b = new("b3");
    b.sing();
    // 【参考答案】不生效! new()绕过factory
  end
endmodule
