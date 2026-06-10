//=============================================================
// Q44_练习：深拷贝 vs 浅拷贝
// 难度: ⭐⭐ | 目标: 理解引用共享 vs 完全独立
//=============================================================

module tb_q44_copy;
  class Item;
    int  val;
    int  arr[];

    //----------------------------------------------------------
    // TODO 1: 浅拷贝 — arr共享同一个引用(危险!)
    //----------------------------------------------------------
    function Item shallow_copy();
      shallow_copy = new();
      shallow_copy.val = this.val;
      // TODO: 填写 — arr如何处理?
      // 【参考答案】shallow_copy.arr = this.arr;  // 共享引用!
    endfunction

    //----------------------------------------------------------
    // TODO 2: 深拷贝 — arr完全独立的新副本
    //----------------------------------------------------------
    function Item deep_copy();
      deep_copy = new();
      deep_copy.val = this.val;
      // TODO: 填写 — 如何创建独立的arr?
      // 【参考答案】deep_copy.arr = new[this.arr.size()];
      // 【参考答案】foreach(this.arr[i]) deep_copy.arr[i] = this.arr[i];
    endfunction
  endclass

  initial begin
    Item a = new(); a.val = 10; a.arr = '{1,2,3};
    $display("Original a: val=%0d arr=%p", a.val, a.arr);

    // 浅拷贝测试
    Item b = a.shallow_copy();
    b.arr[0] = 99;
    $display("After shallow copy: a.arr[0]=%0d b.arr[0]=%0d", a.arr[0], b.arr[0]);
    // a.arr[0] 也变成了99!

    // 深拷贝测试
    a.arr = '{1,2,3};  // 恢复
    Item c = a.deep_copy();
    c.arr[0] = 77;
    $display("After deep copy: a.arr[0]=%0d c.arr[0]=%0d", a.arr[0], c.arr[0]);
    // a.arr[0] 保持为1
  end
endmodule
