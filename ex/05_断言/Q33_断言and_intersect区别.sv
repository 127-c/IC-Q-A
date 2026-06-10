//=============================================================
// Q33_练习：SVA 操作符 and / intersect / or / throughout
// 难度: ⭐⭐ | 目标: 掌握序列组合操作符
//   and:      同起点, 各自满足即可(终点可不同)
//   intersect:同起点+同终点(必须同时结束)
//   or:       满足任意一个即可
//   throughout:整个序列期间某条件保持
//=============================================================

module tb_q33_operators;
  bit clk, a, b, c;
  always #5 clk = ~clk;

  sequence s1; a ##1 b; endsequence  // a, 然后下一周期b
  sequence s2; a ##1 c; endsequence  // a, 然后下一周期c
  sequence s3; ##1 a ##1 b ##1 c; endsequence  // 长度3
  sequence s4; ##1 a ##[1:3] c; endsequence     // 长度2~4

  // TODO 1: and — s1和s2同时满足
  property p_and;
    @(posedge clk)
      // TODO: 在此处写你的代码
      // 【参考答案】s1 and s2;
  endproperty

  // TODO 2: intersect — s3和s4同起点+同终点
  property p_intersect;
    @(posedge clk)
      // TODO: 在此处写你的代码
      // 【参考答案】s3 intersect s4;
  endproperty

  // TODO 3: or — s1或s2任一满足
  property p_or;
    @(posedge clk)
      // TODO: 在此处写你的代码
      // 【参考答案】s1 or s2;
  endproperty

  // TODO 4: throughout — a在b##1 c期间保持
  property p_throughout;
    @(posedge clk)
      // TODO: 在此处写你的代码
      // 【参考答案】a throughout (##1 b ##1 c);
  endproperty

  initial begin
    a=0; b=0; c=0; #10;
    @(posedge clk); a=1; b=0; c=1;
    @(posedge clk); a=0; b=1; c=1;
    @(posedge clk); a=0; b=0; c=0;
    #20; $finish;
  end
endmodule
