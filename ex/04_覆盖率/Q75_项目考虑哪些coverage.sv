//=============================================================
// Q75_练习：Covergroup / Coverpoint 功能覆盖率编写
// 难度: ⭐⭐ | 目标: 掌握covergroup的声明和采样
//=============================================================

module tb_q75_coverage;

  class transaction;
    rand bit [7:0] addr;
    rand bit [3:0] opcode;
    rand bit       parity;
  endclass


  //----------------------------------------------------------
  // TODO 1: 定义 covergroup
  //----------------------------------------------------------
  covergroup cg_trans @(posedge virtual_clk);
    option.per_instance = 1;
    option.goal = 90;          // 目标覆盖率90%

    // coverpoint 1: opcode
    cp_op: coverpoint trans.opcode {
      bins zero     = {0};
      bins low      = {[1:3]};
      bins high     = {[4:14]};
      bins max      = {15};
      illegal_bins inv = {[16:$]};  // 4bit opcode不会超过15
    }

    // coverpoint 2: addr 分段
    cp_addr: coverpoint trans.addr {
      bins low_addr  = {[0:63]};
      bins mid_addr  = {[64:191]};
      bins high_addr = {[192:255]};
    }

    // coverpoint 3: parity toggle
    cp_parity: coverpoint trans.parity {
      bins even = {0};
      bins odd  = {1};
    }

    // TODO 2: cross — 交叉覆盖率
    cross_op_addr: cross cp_op, cp_addr {
      // 忽略 op=0 且 addr=high 的组合
      ignore_bins ign = binsof(cp_op) intersect {0} &&
                        binsof(cp_addr) intersect {high_addr};
    }

  endgroup


  // test
  bit virtual_clk;
  transaction trans;
  cg_trans cg;

  initial begin
    trans = new();
    cg = new();  // TODO: 实例化covergroup

    always #5 virtual_clk = ~virtual_clk;

    $display("--- Sampling coverage ---");
    repeat(50) begin
      @(posedge virtual_clk);
      if (trans.randomize())
        cg.sample();  // TODO: 采样
    end

    $display("Coverage = %0.1f%%", cg.get_coverage());
  end

endmodule
