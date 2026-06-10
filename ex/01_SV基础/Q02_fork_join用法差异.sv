//=============================================================
// Q02_练习：fork join / join_any / join_none 的用法差异
// 难度: ⭐⭐ | 目标: 掌握三种fork方式的区别
//=============================================================

module tb_q02_fork_join;

  initial begin
    $display("[%0t] ========== Start ==========", $time);

    //----------------------------------------------------------
    // TODO 1: fork...join — 等待所有线程完成
    //----------------------------------------------------------
    $display("[%0t] --- fork join demo ---", $time);
    fork
      begin
        #5;
        $display("[%0t] Task1 done (5ns)", $time);
      end
      begin
        #15;
        $display("[%0t] Task2 done (15ns)", $time);
      end
      begin
        #25;
        $display("[%0t] Task3 done (25ns)", $time);
      end
    join
    // TODO: 上面的 $display 在什么时间打印? 答: _____ns
    $display("[%0t] After fork join", $time);


    //----------------------------------------------------------
    // TODO 2: fork...join_any — 任一完成即继续
    //----------------------------------------------------------
    $display("[%0t] --- fork join_any demo ---", $time);
    fork
      begin
        #5;
        $display("[%0t] Quick task done (5ns)", $time);
      end
      begin
        #50;
        $display("[%0t] Slow task done (50ns)", $time);
      end
    join_any
    // TODO: 这里 $display 在什么时间打印? 答: _____ns
    // TODO: Slow task 还会继续执行吗? 答: ____
    $display("[%0t] After fork join_any", $time);


    //----------------------------------------------------------
    // TODO 3: fork...join_none — 不等待，立即继续
    //----------------------------------------------------------
    $display("[%0t] --- fork join_none demo ---", $time);
    fork
      begin
        #10;
        $display("[%0t] Background task (10ns)", $time);
      end
      begin
        #20;
        $display("[%0t] Another bg task (20ns)", $time);
      end
    join_none
    // TODO: 这里 $display 在什么时间打印? 答: _____ns
    $display("[%0t] After fork join_none", $time);

    // TODO: 如果在这里加 wait fork; 会发生什么?
    // wait fork;
    // $display("[%0t] After wait fork", $time);

    #100;
    $display("[%0t] ========== End ==========", $time);
  end

endmodule
