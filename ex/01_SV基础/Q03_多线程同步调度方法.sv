//=============================================================
// Q03_练习：mailbox / event / semaphore 三种线程同步方式
// 难度: ⭐⭐ | 目标: 掌握三种同步方式的使用
//=============================================================

program tb_q03_sync;

  //----------------------------------------------------------
  // TODO 1: Mailbox 邮箱 — 线程间数据传递
  //   发送用 put(), 接收用 get(), 查看不删除用 peek()
  //----------------------------------------------------------
  mailbox #(int) mbx = new(1);
  initial begin
    $display("--- Mailbox Demo ---");
    fork
      begin  // Producer
        int data = 42;
        // TODO: 用 mbx.put() 发送数据
        // 【参考答案】mbx.put(data);
        $display("[Producer] Sent: %0d", data);
      end
      begin  // Consumer
        int val;
        // TODO: 用 mbx.get() 接收数据
        // 【参考答案】mbx.get(val);
        $display("[Consumer] Received: %0d", val);
      end
    join
  end


  //----------------------------------------------------------
  // TODO 2: Event 事件 — 线程间同步触发
  //   触发用 ->, 等待用 @(event) 或 wait(event.triggered)
  //----------------------------------------------------------
  event evt;
  initial begin
    $display("--- Event Demo ---");
    fork
      begin
        #10;
        // TODO: 触发事件
        // 【参考答案】-> evt;
        $display("[%0t] Event triggered!", $time);
      end
      begin
        $display("[%0t] Waiting for event...", $time);
        // TODO: 等待事件 (@ vs wait.triggered)
        // 【参考答案】@(evt);
        $display("[%0t] Event received!", $time);
      end
    join
  end


  //----------------------------------------------------------
  // TODO 3: Semaphore 旗语 — 资源互斥访问
  //   获取用 get(N), 归还用 put(N)
  //----------------------------------------------------------
  semaphore sem = new(1);  // 只有1把钥匙
  initial begin
    $display("--- Semaphore Demo ---");
    fork
      begin
        // TODO: 获取钥匙 → 工作 → 归还钥匙
        // 【参考答案】sem.get(1);
        $display("[%0t] Thread A got key", $time);
        #5;
        // 【参考答案】sem.put(1);
        $display("[%0t] Thread A released key", $time);
      end
      begin
        #1;
        // TODO: 同样获取→工作→归还
        // 【参考答案】sem.get(1);
        $display("[%0t] Thread B got key", $time);
        #2;
        // 【参考答案】sem.put(1);
      end
    join
  end
endprogram
