//=============================================================
// Q42_练习：rand 和 randc 的区别
// 难度: ⭐ | 目标: 理解普通随机和周期性随机
//=============================================================

module tb_q42_rand_randc;

  class demo;
    // TODO 1: rand  — 每次独立随机，值可以重复
    rand  bit [2:0] rand_val;   // 范围 0~7

    // TODO 2: randc — 周期性随机, 所有值取完一遍才会重复
    randc bit [2:0] randc_val;  // 范围 0~7

    function void print();
      $display("rand=%0d  randc=%0d", rand_val, randc_val);
    endfunction
  endclass


  initial begin
    demo d = new();
    $display("--- rand x10 ---");
    repeat(10) begin
      d.randomize();
      d.print();
      // 观察: rand_val 可能很快重复, randc_val 8次内不会重复
    end
  end

endmodule
