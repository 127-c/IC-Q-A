//=============================================================
// Q74_练习：SVA 重复操作符 a[*3] / a[->3] / a[=3] 区别
// 难度: ⭐⭐ | 目标: 掌握三种重复操作符
//   a[*3]  = a ##1 a ##1 a  (连续3次, 无间隔)
//   a[->3] = 非连续3次, 最后一次后紧跟后续(goto)
//   a[=3]  = 非连续3次, 最后一次后可有间隔
//=============================================================

module tb_q74_repeat;
  bit clk, a, c;
  always #5 clk = ~clk;

  // TODO 1: a[*3] — 连续3次
  property p_consecutive;
    @(posedge clk)
      // TODO: 在此处写你的代码
      // 【参考答案】a[*3] |-> c;
  endproperty

  // TODO 2: a[->3] — 非连续3次, 最后一次紧跟c (goto)
  property p_goto;
    @(posedge clk)
      // TODO: 在此处写你的代码
      // 【参考答案】a[->3] |-> c;
  endproperty

  // TODO 3: a[=3] — 非连续3次, 最后一次后某时刻c
  property p_nonconsecutive;
    @(posedge clk)
      // TODO: 在此处写你的代码
      // 【参考答案】a[=3] |-> c;
  endproperty

  initial begin
    a=0; c=0; #10;
    // 波形: a = 0,1,0,1,1,0,1,0,1,0 (a=1 at T1,T3,T5,T7,T9)
    @(posedge clk); a=1;    // T1
    @(posedge clk); a=0;    // T2
    @(posedge clk); a=1;    // T3
    @(posedge clk); a=0;    // T4
    @(posedge clk); a=1; c=1; // T5 (a第3次)
    @(posedge clk); a=0; c=0;
    @(posedge clk); a=0;
    #30; $finish;
  end
endmodule
