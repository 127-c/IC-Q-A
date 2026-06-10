//=============================================================
// Q02_练习：fork join / join_any / join_none 的用法差异
// 难度: ⭐⭐ | 目标: 掌握三种fork方式的区别
//=============================================================

module tb_q02_fork_join;
  initial begin
    $display("[%0t] ========== Start ==========", $time);

    //----------------------------------------------------------
    // TODO 1: fork...join — 等待所有线程完成才继续
    //   问题: 下面的 $display 在什么时间打印?
    //----------------------------------------------------------
    $display("[%0t] --- fork join demo ---", $time);
    fork
      #5  $display("[%0t] Task1 (5ns)", $time);
      #15 $display("[%0t] Task2 (15ns)", $time);
      #25 $display("[%0t] Task3 (25ns)", $time);
    join
    // TODO: 在此处写你的代码 (回答: 打印时间?)
    // 【参考答案】$display("[%0t] After fork join (expected: 25ns)", $time);


    //----------------------------------------------------------
    // TODO 2: fork...join_any — 任意一个完成就继续
    //   问题: 打印时间? 未完成的线程会继续吗?
    //----------------------------------------------------------
    $display("[%0t] --- fork join_any demo ---", $time);
    fork
      #5  $display("[%0t] Quick (5ns)", $time);
      #50 $display("[%0t] Slow (50ns)", $time);
    join_any
    // TODO: 在此处写你的代码
    // 【参考答案】$display("[%0t] After fork join_any (expected: 5ns)", $time);


    //----------------------------------------------------------
    // TODO 3: fork...join_none — 不等待, 立即继续
    //   问题: 打印时间? 子线程何时执行?
    //----------------------------------------------------------
    $display("[%0t] --- fork join_none demo ---", $time);
    fork
      #10 $display("[%0t] BG task (10ns)", $time);
      #20 $display("[%0t] BG task2 (20ns)", $time);
    join_none
    // TODO: 在此处写你的代码
    // 【参考答案】$display("[%0t] After fork join_none (expected: 0ns)", $time);

    #100;
    $display("[%0t] ========== End ==========", $time);
  end
endmodule
