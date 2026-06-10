//=============================================================
// Q39_练习：SVA $past 用法
// 难度: ⭐⭐ | 目标: 用$past检测历史信号
//   $past(sig)      → 前1周期值
//   $past(sig, N)   → 前N周期值
//   $rose(sig)      → 上升沿: sig && !$past(sig)
//   $fell(sig)      → 下降沿: !sig && $past(sig)
//=============================================================

module tb_q39_past;
  bit clk, a, b, c, d;
  always #5 clk = ~clk;

  //----------------------------------------------------------
  // TODO 1: c,d同时为1时, 前两个周期 a,b必须同时为1
  //   使用 $past(expr, 2)
  //----------------------------------------------------------
  property check_ab_before_cd;
    @(posedge clk)
      // TODO: 在此处写你的代码
      // 【参考答案】(c && d) |-> $past(a && b, 2);
  endproperty

  ap_past: assert property(check_ab_before_cd)
    else $error("FAIL: c&d=1 but a&b!=1 two cycles ago");

  //----------------------------------------------------------
  // TODO 2: a的上升沿时 b必须为高 (用 $rose)
  //----------------------------------------------------------
  property check_rose;
    @(posedge clk)
      // TODO: 在此处写你的代码
      // 【参考答案】$rose(a) |-> b;
  endproperty

  initial begin
    a=0; b=0; c=0; d=0; #10;
    @(posedge clk); a=1; b=1;         // T1: a,b=1
    @(posedge clk); a=0; b=0;         // T2
    @(posedge clk); c=1; d=1;         // T3: cd=1, 检查T1的ab
    #20; $finish;
  end
endmodule
