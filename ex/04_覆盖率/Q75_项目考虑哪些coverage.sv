//=============================================================
// Q75_练习：Covergroup / Coverpoint 功能覆盖率
// 难度: ⭐⭐ | 目标: 掌握covergroup的定义和采样
//=============================================================

module tb_q75_coverage;

  class transaction;
    rand bit [7:0] addr;
    rand bit [3:0] opcode;
    rand bit       parity;
  endclass

  bit virtual_clk;
  always #5 virtual_clk = ~virtual_clk;

  transaction trans;

  //----------------------------------------------------------
  // TODO: 定义 covergroup
  //   coverpoint: 覆盖信号的各种取值
  //   cross: 交叉覆盖率
  //   bins: 自定义仓
  //   illegal_bins: 非法值
  //----------------------------------------------------------
  // TODO: 在此处写你的代码 — 定义一个 covergroup cg_trans
  // 【参考答案】
  // covergroup cg_trans @(posedge virtual_clk);
  //   option.per_instance = 1;
  //   option.goal = 90;
  //
  //   cp_op: coverpoint trans.opcode {
  //     bins zero = {0};
  //     bins low  = {[1:3]};
  //     bins high = {[4:14]};
  //     bins max  = {15};
  //     illegal_bins inv = {[16:$]};
  //   }
  //
  //   cp_addr: coverpoint trans.addr {
  //     bins low  = {[0:63]};
  //     bins mid  = {[64:191]};
  //     bins high = {[192:255]};
  //   }
  //
  //   cp_parity: coverpoint trans.parity;
  //
  //   cross_op_addr: cross cp_op, cp_addr;
  // endgroup

  initial begin
    trans = new();
    // TODO: 实例化 covergroup
    // 【参考答案】cg_trans cg = new();

    repeat(50) begin
      @(posedge virtual_clk);
      if (trans.randomize())
        // TODO: 采样
        // 【参考答案】cg.sample();
        ;
    end
    // $display("Coverage = %0.1f%%", cg.get_coverage());
  end
endmodule
