//=============================================================
// Q07_练习：UVM Factory 工厂机制 (三步: 注册-创建-覆盖)
// 难度: ⭐⭐ | 目标: 掌握factory机制的使用方式
//=============================================================

`include "uvm_macros.svh"
import uvm_pkg::*;

//----------------------------------------------------------
// TODO 1: 定义基类 bird, 并注册到 factory 表中
//----------------------------------------------------------
class bird extends uvm_object;
  // TODO: 用 `uvm_object_utils 注册
  `uvm_object_utils(bird)

  function new(string name = "bird");
    super.new(name);
  endfunction

  virtual function void sing();
    $display("Bird: chirp chirp~");
  endfunction
endclass


//----------------------------------------------------------
// TODO 2: 定义扩展类 parrot, 并注册
//----------------------------------------------------------
class parrot extends bird;
  // TODO: 注册
  `uvm_object_utils(parrot)

  function new(string name = "parrot");
    super.new(name);
  endfunction

  // TODO: 重写 sing()
  virtual function void sing();
    $display("Parrot: Hello World!");
  endfunction
endclass


//----------------------------------------------------------
// TODO 3: 测试 factory 覆盖
//----------------------------------------------------------
module tb_q07_factory;
  initial begin
    bird b;

    // 情况1: 使用 create 创建 bird
    b = bird::type_id::create("b1");
    b.sing();  // 输出: ?

    // 情况2: 用 factory 将 bird 替换为 parrot
    // TODO: 用 set_type_override 完成覆盖
    bird::type_id::set_type_override(parrot::get_type());
    b = bird::type_id::create("b2");
    b.sing();  // 输出: ?

    // 情况3: 直接用 new (绕过factory, 不会被覆盖)
    b = new("b3");
    b.sing();  // 输出: ?
  end
endmodule
