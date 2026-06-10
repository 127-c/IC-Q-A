//=============================================================
// Q03_练习：多线程同步调度方法 (mailbox / event / semaphore)
// 难度: ⭐⭐ | 目标: 掌握三种线程同步方式
//=============================================================

program tb_q03_sync;

  //----------------------------------------------------------
  // TODO 1: Mailbox 邮箱 — 线程间数据传递
  //----------------------------------------------------------
  mailbox #(int) mbx = new(1);  // 容量为1的mailbox

  initial begin
    $display("--- Mailbox Demo ---");
    fork
      begin  // Producer
        int data = 42;
        // TODO: 用 mbx.put() 发送数据
        // mbx.put(data);
        $display("[Producer] Sent: %0d", data);
      end
      begin  // Consumer
        int val;
        // TODO: 用 mbx.get() 接收数据
        // mbx.get(val);
        $display("[Consumer] Received: %0d", val);
      end
    join
  end


  //----------------------------------------------------------
  // TODO 2: Event 事件 — 线程间同步触发
  //----------------------------------------------------------
  event evt;

  initial begin
    $display("--- Event Demo ---");
    fork
      begin  // Trigger thread
        #10;
        // TODO: 用 -> 触发事件
        // -> evt;
        $display("[%0t] Event triggered!", $time);
      end
      begin  // Wait thread
        $display("[%0t] Waiting for event...", $time);
        // TODO: 用 @(evt) 或 wait(evt.triggered) 等待事件
        // @(evt);
        $display("[%0t] Event received!", $time);
      end
    join
  end


  //----------------------------------------------------------
  // TODO 3: Semaphore 旗语 — 资源互斥访问
  //----------------------------------------------------------
  semaphore sem = new(1);  // 只有1把钥匙

  initial begin
    $display("--- Semaphore Demo ---");
    fork
      begin  // Thread A - 先获取钥匙
        // TODO: 用 sem.get(1) 获取钥匙
        // sem.get(1);
        $display("[%0t] Thread A got the key, working...", $time);
        #5;
        // TODO: 用 sem.put(1) 归还钥匙
        // sem.put(1);
        $display("[%0t] Thread A released key", $time);
      end
      begin  // Thread B - 等待钥匙
        #1;
        $display("[%0t] Thread B waiting for key...", $time);
        // TODO: 获取和归还钥匙
        // sem.get(1);
        $display("[%0t] Thread B got the key!", $time);
        #2;
        // sem.put(1);
      end
    join
  end

endprogram
