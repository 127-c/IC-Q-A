//=============================================================
// Q04_练习：Task 和 Function 的区别
// 难度: ⭐ | 目标: 写出task和function, 理解区别
//=============================================================

module tb_q04_task_func;

  //----------------------------------------------------------
  // TODO 1: 写一个 function — 计算阶乘
  //   function 不能有 #delay, @(posedge clk), wait()
  //   function 必须有返回值
  //----------------------------------------------------------
  function int factorial(int n);
    // TODO: 在此处写你的代码 (实现递归阶乘)
    // 【参考答案】if (n <= 1) factorial = 1;
    // 【参考答案】else factorial = n * factorial(n - 1);
  endfunction


  //----------------------------------------------------------
  // TODO 2: 写一个 task — 带延迟的脉冲生成
  //   task 可以有 #delay, @(posedge clk), wait()
  //   task 可以有多个 output 参数
  //----------------------------------------------------------
  task generate_pulse(ref bit sig, input int high_ns, input int low_ns);
    // TODO: 在此处写你的代码 (sig=1 high_ns, 然后 sig=0 low_ns)
    // 【参考答案】sig = 1'b1; #(high_ns);
    // 【参考答案】sig = 1'b0; #(low_ns);
  endtask


  bit pulse;
  initial begin
    $display("factorial(5) = %0d", factorial(5));
    generate_pulse(pulse, 10, 5);
    $display("Pulse test done");
  end
endmodule
