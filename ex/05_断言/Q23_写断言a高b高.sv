//=============================================================
// Q23_练习：SVA 断言 — a为高时b为高 / 下一周期b为高
// 难度: ⭐⭐ | 目标: 掌握 |-> 和 |=> 的区别
//=============================================================

module tb_q23_assertion;
  bit clk, a, b;

  always #5 clk = ~clk;

  //----------------------------------------------------------
  // TODO 1: a为高时, 同一周期 b 也必须为高
  //   使用: |->  (重叠蕴含, overlapping implication)
  //----------------------------------------------------------
  property a_high_same_cycle_b_high;
    @(posedge clk)
      // 填写: a为高时, b也要为高
      a |-> b;
  endproperty

  // 断言检查
  ap_same: assert property(a_high_same_cycle_b_high)
    else $error("[FAIL] a=1 but b=0 in same cycle!");


  //----------------------------------------------------------
  // TODO 2: a为高时, 下一个周期 b 必须为高
  //   使用: |=>  (非重叠蕴含, non-overlapping implication)
  //   等价于: a ##1 b
  //----------------------------------------------------------
  property a_high_next_cycle_b_high;
    @(posedge clk)
      // 填写: a为高后, 下一个周期b为高
      a |=> b;
  endproperty

  ap_next: assert property(a_high_next_cycle_b_high)
    else $error("[FAIL] a=1 but b!=1 in next cycle!");


  // TODO 3: cover — 检测是否覆盖到了
  cover_a_b: cover property(@(posedge clk) a |-> b);


  //----------------------------------------------------------
  // 测试激励
  //----------------------------------------------------------
  initial begin
    // 场景1: a和b同时为高 → 通过
    a=0; b=0; #10;
    @(posedge clk); a=1; b=1;
    @(posedge clk); a=0; b=0;

    // 场景2: a为高b为低 → 触发断言失败!
    @(posedge clk); a=1; b=0;
    @(posedge clk); a=0; b=0;

    #20;
    $finish;
  end

endmodule
