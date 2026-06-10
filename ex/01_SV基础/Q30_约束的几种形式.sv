//=============================================================
// Q30_练习：约束的形式 (dist / if-else / -> / inside)
// 难度: ⭐⭐ | 目标: 掌握随机约束的各种写法
//=============================================================

module tb_q30_constraints;
  class packet;
    rand bit [7:0] addr;
    rand bit [3:0] opcode;

    //----------------------------------------------------------
    // TODO 1: 权重约束 dist
    //   :=n  → 每个值权重为n
    //   :/n  → 每个值权重为 n/num
    //----------------------------------------------------------
    constraint c_op_weight {
      // 填写: opcode=0权重50, opcode=1权重30, 其余平分20
      // TODO: 在此处写你的代码
      // 【参考答案】opcode dist { 0 := 50, 1 := 30, [2:15] :/ 20 };
    }

    //----------------------------------------------------------
    // TODO 2: 条件约束 if-else 和 ->
    //   if-else: 和编程语言一样
    //   ->: 蕴含 (前件满足时后件必须满足)
    //----------------------------------------------------------
    constraint c_cond {
      // 填写: opcode=0时addr在[0:127], 其他在[128:255]
      // 填写: opcode=1时addr<200
      // TODO: 在此处写你的代码
      // 【参考答案】if (opcode == 0) addr inside {[0:127]};
      // 【参考答案】else addr inside {[128:255]};
      // 【参考答案】(opcode == 1) -> addr < 200;
    }

    //----------------------------------------------------------
    // TODO 3: 范围约束 inside (不能用 min<addr<max!)
    //----------------------------------------------------------
    constraint c_range {
      // 填写: addr在0~255之间
      // TODO: 在此处写你的代码
      // 【参考答案】addr inside {[0:255]};
    }

    function void print();
      $display("addr=%0d opcode=%0d", addr, opcode);
    endfunction
  endclass

  initial begin
    packet p = new();
    repeat(10) begin
      p.randomize();
      p.print();
    end
  end
endmodule
