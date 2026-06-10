//=============================================================
// Q30_练习：约束的几种形式 (dist / if-else / -> / inside)
// 难度: ⭐⭐ | 目标: 掌握随机约束的写法
//=============================================================

module tb_q30_constraints;

  class packet;
    rand bit [7:0] addr;
    rand bit [3:0] opcode;

    //----------------------------------------------------------
    // TODO 1: 权重约束 dist
    //   :=n  每个值权重为n
    //   :/n  每个值权重为 n/num
    //----------------------------------------------------------
    constraint c_op_weight {
      // opcode=0 权重最大(50%), opcode=1 权重30%, 其余平分20%
      opcode dist {
        0 := 50,
        1 := 30,
        [2:15] :/ 20
      };
    }


    //----------------------------------------------------------
    // TODO 2: 条件约束 if-else 和 ->
    //   if-else: 和编程语言一样
    //   ->:      蕴含操作符 (前件满足→后件必须满足)
    //----------------------------------------------------------
    constraint c_cond {
      // opcode=0 时, addr 在 [0:127]
      // opcode!=0 时, addr 在 [128:255]
      if (opcode == 0)
        addr inside {[0:127]};
      else
        addr inside {[128:255]};

      // 额外: opcode=1 时 addr < 200
      (opcode == 1) -> addr < 200;
    }


    //----------------------------------------------------------
    // TODO 3: 范围约束 inside
    //   注意: 不能写 min < addr < max (非法!)
    //----------------------------------------------------------
    constraint c_range {
      addr inside {[0:255]};   // 正确
      // addr >= 0 && addr <= 255;  // 也可以
    }

    function void print();
      $display("addr=%0d opcode=%0d", addr, opcode);
    endfunction
  endclass


  initial begin
    packet p = new();
    $display("--- Randomizing 10 times ---");
    repeat(10) begin
      if (!p.randomize()) $fatal("Randomization failed!");
      p.print();
    end

    // TODO bonus: 用 constraint_mode(0) 关闭约束
    // p.c_cond.constraint_mode(0);
    // p.randomize();
  end

endmodule
