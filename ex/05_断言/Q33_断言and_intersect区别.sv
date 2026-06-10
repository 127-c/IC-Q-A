//=============================================================
// Q33_练习：SVA 操作符 and / intersect / or 的区别
// 难度: ⭐⭐ | 目标: 掌握序列组合操作符
//=============================================================

module tb_q33_operators;
  bit clk, a, b, c;
  always #5 clk = ~clk;


  //----------------------------------------------------------
  // TODO 1: and — 两个序列同时开始，分别满足即可(终点可不同)
  //----------------------------------------------------------
  sequence s1;
    a ##1 b;         // a, 然后下一周期b
  endsequence

  sequence s2;
    a ##1 c;         // a, 然后下一周期c
  endsequence

  property p_and;
    @(posedge clk)
      s1 and s2;     // 同时从a开始, s1满足且s2满足
  endproperty


  //----------------------------------------------------------
  // TODO 2: intersect — 两个序列同时开始且同时结束(同起点+同终点)
  //----------------------------------------------------------
  sequence s3;
    ##1 a ##1 b ##1 c;   // 序列长度3
  endsequence

  sequence s4;
    ##1 a ##[1:3] c;     // 序列长度2~4
  endsequence

  property p_intersect;
    @(posedge clk)
      s3 intersect s4;  // 必须同起点+同终点 (长度相等)
  endproperty


  //----------------------------------------------------------
  // TODO 3: or — 两个序列满足任意一个即可
  //----------------------------------------------------------
  property p_or;
    @(posedge clk)
      s1 or s2;          // s1或s2任一满足
  endproperty


  //----------------------------------------------------------
  // TODO 4: throughout — 在整个序列期间条件保持
  //----------------------------------------------------------
  property p_throughout;
    @(posedge clk)
      a throughout (##1 b ##1 c);  // a在其间始终为高
  endproperty

  initial begin
    a=0; b=0; c=0;
    #10;
    @(posedge clk); a=1; b=0; c=1;
    @(posedge clk); a=0; b=1; c=1;
    @(posedge clk); a=0; b=0; c=0;
    #20; $finish;
  end

endmodule
