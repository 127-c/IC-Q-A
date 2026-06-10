//=============================================================
// Q35_练习：D触发器 vs D锁存器 + 意外锁存器
// 难度: ⭐⭐ | 目标: 写RTL, 理解区别, 避免意外latch
//=============================================================

module tb_q35_ff_latch;

  //----------------------------------------------------------
  // TODO 1: D触发器 (Flip-Flop) — 时钟沿触发
  //   使用 always_ff @(posedge clk)
  //----------------------------------------------------------
  module d_ff(input logic clk, rst_n, d, output logic q);
    always_ff @(posedge clk or negedge rst_n) begin
      if (!rst_n)
        q <= 1'b0;
      else
        // TODO: 在此处写你的代码
        // 【参考答案】q <= d;
    end
  endmodule

  //----------------------------------------------------------
  // TODO 2: D锁存器 (Latch) — 电平触发, en=1时透明
  //   使用 always_latch
  //----------------------------------------------------------
  module d_latch(input logic en, d, output logic q);
    always_latch begin
      // TODO: 在此处写你的代码 (en为高时q=d, 否则保持)
      // 【参考答案】if (en) q = d;
    end
  endmodule

  //----------------------------------------------------------
  // TODO 3: 这会产生意外锁存器! 为什么?
  //----------------------------------------------------------
  module bad_code(input logic [1:0] sel, input logic [7:0] d, output logic [7:0] q);
    always_comb begin
      if (sel == 2'b00)
        q = d;
      else if (sel == 2'b01)
        q = d + 1;
      // ❌ sel=10或11时q没有赋值 → 需要保持 → 综合出latch!
      // TODO: 如何修复?
      // 【参考答案】加 else q = 8'h0; 或用 default
    end
  endmodule

endmodule
