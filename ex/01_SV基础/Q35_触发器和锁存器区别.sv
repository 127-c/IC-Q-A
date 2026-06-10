//=============================================================
// Q35_练习：D触发器和D锁存器的区别
// 难度: ⭐⭐ | 目标: 写出RTL代码并理解触发器vs锁存器
//=============================================================

module tb_q35_ff_latch;

  //----------------------------------------------------------
  // TODO 1: 写一个 D 触发器 (Flip-Flop) — 时钟沿触发
  //----------------------------------------------------------
  module d_ff (
    input  logic clk, rst_n,
    input  logic d,
    output logic q
  );
    always_ff @(posedge clk or negedge rst_n) begin
      if (!rst_n)
        q <= 1'b0;
      else
        // TODO: 填写触发器逻辑
        q <= d;
    end
  endmodule


  //----------------------------------------------------------
  // TODO 2: 写一个 D 锁存器 (Latch) — 电平触发
  //----------------------------------------------------------
  module d_latch (
    input  logic en,
    input  logic d,
    output logic q
  );
    always_latch begin
      // TODO: 填写锁存器逻辑 (en为高时透明, 为低时保持)
      if (en)
        q = d;
    end
  endmodule


  //----------------------------------------------------------
  // TODO 3: 写一个会产生意外锁存器的例子
  //----------------------------------------------------------
  module bad_code(input logic [1:0] sel, input logic [7:0] d,
                  output logic [7:0] q);
    always_comb begin
      // TODO: 这里缺少 else / default, 综合会产生 latch!
      if (sel == 2'b00)
        q = d;
      else if (sel == 2'b01)
        q = d + 1;
      // ❌ sel=10或11时q不变 → 综合出latch!
    end
  endmodule

endmodule
