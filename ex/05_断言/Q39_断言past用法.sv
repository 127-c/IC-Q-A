//=============================================================
// Q39_练习：SVA $past 用法
// 难度: ⭐⭐ | 目标: 掌握$past检测历史信号
//=============================================================

module tb_q39_past;
  bit clk, a, b, c, d;
  always #5 clk = ~clk;


  //----------------------------------------------------------
  // TODO 1: 检测 abcd 四个信号
  //   当 c,d 同时为1时, 前两个周期 a,b 必须同时为1
  //----------------------------------------------------------
  property check_ab_before_cd;
    @(posedge clk)
      (c && d) |-> $past(a && b, 2);  // $past(expr, N): N周期前的值
  endproperty

  ap_past: assert property(check_ab_before_cd)
    else $error("FAIL: c&d=1 but a&b!=1 two cycles ago");


  //----------------------------------------------------------
  // TODO 2: $past 常见用法
  //   $past(sig)         → 前1周期
  //   $past(sig, 3)      → 前3周期
  //   $past(sig,,, @(posedge clk2)) → 在另一个时钟域采样
  //----------------------------------------------------------

  // 检测上升沿: $rose(sig) 等价于 sig && !$past(sig)
  property check_rose;
    @(posedge clk)
      $rose(a) |-> b;     // a上升沿时b为高
  endproperty

  // 检测下降沿: $fell(sig) 等价于 !sig && $past(sig)
  property check_fell;
    @(posedge clk)
      $fell(a) |-> !b;    // a下降沿时b为低
  endproperty

  initial begin
    a=0; b=0; c=0; d=0;
    #10;
    @(posedge clk); a=1; b=1;         // T1: a,b=1
    @(posedge clk); a=0; b=0;         // T2
    @(posedge clk); c=1; d=1;         // T3: c&d=1, $past(a&&b,2)应检查T1
    #20; $finish;
  end

endmodule
