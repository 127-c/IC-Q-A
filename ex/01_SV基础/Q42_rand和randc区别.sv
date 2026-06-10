//=============================================================
// Q42_练习：rand 和 randc 的区别
// 难度: ⭐ | 目标: 理解普通随机和周期性随机
//=============================================================

module tb_q42_rand_randc;
  class demo;
    rand  bit [2:0] rand_val;   // 每次独立随机, 可以重复
    randc bit [2:0] randc_val;  // 周期随机, 所有值取一遍才重复

    function void print();
      $display("rand=%0d  randc=%0d", rand_val, randc_val);
    endfunction
  endclass

  initial begin
    demo d = new();
    $display("--- rand vs randc x16 ---");
    repeat(16) begin
      d.randomize();
      d.print();
      // 观察: rand_val 可能很快重复
      //       randc_val 8次内(0~7)不会重复
    end
  end
endmodule
