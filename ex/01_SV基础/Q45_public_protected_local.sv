//=============================================================
// Q45_练习：类的 public / protected / local 访问控制
// 难度: ⭐ | 目标: 掌握三种访问权限
//=============================================================

module tb_q45_access;
  class Base;
    int public_val = 1;       // public:  外部+子类均可访问(默认)
    protected int prot_val = 2; // protected: 只有本类+子类可访问
    local int local_val = 3;    // local:    只有本类可访问

    function void show();
      $display("Base: public=%0d prot=%0d local=%0d", public_val, prot_val, local_val);
    endfunction
  endclass

  class Derived extends Base;
    function void show_derived();
      // 填写: 哪些可以访问? 哪些会编译错误?
      // TODO: 在此处写你的代码
      // 【参考答案】$display("Derived: public=%0d prot=%0d", public_val, prot_val);
      // 【参考答案】// $display("local=%0d", local_val);  // ❌ 编译错误!
    endfunction
  endclass

  initial begin
    Derived d = new();
    d.public_val = 10;    // ✅ OK
    // d.prot_val = 20;   // ❌ 编译错误! 外部不能访问protected
    // d.local_val = 30;  // ❌ 编译错误! 外部不能访问local
    d.show();
    d.show_derived();
  end
endmodule
