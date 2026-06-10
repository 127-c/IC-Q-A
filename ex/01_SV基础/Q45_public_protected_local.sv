//=============================================================
// Q45_练习：类的 public / protected / local 访问控制
// 难度: ⭐ | 目标: 掌握三种访问权限的区别
//=============================================================

module tb_q45_access;

  class Base;
    // TODO 1: public — 子类和外部均可访问 (默认)
    int public_val = 1;

    // TODO 2: protected — 只有本类和子类可访问
    protected int prot_val = 2;

    // TODO 3: local — 只有本类可访问
    local int local_val = 3;

    function void show();
      $display("Base: public=%0d prot=%0d local=%0d",
               public_val, prot_val, local_val);
    endfunction
  endclass


  class Derived extends Base;
    function void show_derived();
      $display("Derived: public=%0d prot=%0d", public_val, prot_val);
      // $display("local=%0d", local_val);  // ❌ 编译错误! local不可访问
    endfunction
  endclass


  initial begin
    Derived d = new();
    d.public_val = 10;      // ✅ OK
    // d.prot_val = 20;     // ❌ 编译错误! 外部不能访问protected
    // d.local_val = 30;    // ❌ 编译错误! 外部不能访问local
    d.show();
    d.show_derived();
  end

endmodule
