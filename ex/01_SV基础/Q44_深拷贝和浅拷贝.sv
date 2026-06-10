//=============================================================
// Q44_练习：深拷贝和浅拷贝
// 难度: ⭐⭐ | 目标: 理解引用拷贝和值拷贝的区别
//=============================================================

module tb_q44_copy;

  class Item;
    int  val;
    int  arr[];

    // TODO 1: 浅拷贝 — 共享引用
    function Item shallow_copy();
      shallow_copy = new();
      shallow_copy.val = this.val;
      shallow_copy.arr = this.arr;    // ⚠️ 共享同一个数组!
    endfunction

    // TODO 2: 深拷贝 — 完全独立的副本
    function Item deep_copy();
      deep_copy = new();
      deep_copy.val = this.val;
      deep_copy.arr = new[this.arr.size()];  // 重新分配!
      foreach (this.arr[i])
        deep_copy.arr[i] = this.arr[i];       // 逐个拷贝
    endfunction
  endclass


  initial begin
    Item a = new();
    a.val = 10;
    a.arr = '{1, 2, 3};

    $display("Original a: val=%0d arr=%p", a.val, a.arr);

    // --- 浅拷贝测试 ---
    Item b = a.shallow_copy();
    b.arr[0] = 99;  // 修改b
    $display("After shallow copy b.arr[0]=99:");
    $display("  a.arr[0] = %0d (should be 99, affected!!)", a.arr[0]);
    $display("  b.arr[0] = %0d", b.arr[0]);

    // --- 深拷贝测试 ---
    a.arr = '{1, 2, 3};  // 恢复
    Item c = a.deep_copy();
    c.arr[0] = 77;
    $display("After deep copy c.arr[0]=77:");
    $display("  a.arr[0] = %0d (should be 1, unaffected!)", a.arr[0]);
    $display("  c.arr[0] = %0d", c.arr[0]);
  end

endmodule
