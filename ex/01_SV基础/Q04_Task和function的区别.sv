//=============================================================
// Q04_练习：Task 和 Function 的区别
// 难度: ⭐ | 目标: 掌握task和function的不同使用场景
//=============================================================

module tb_q04_task_func;

  //----------------------------------------------------------
  // TODO 1: 写一个 function — 计算阶乘
  //   - function 不能有延迟(#), 只能在0时刻执行
  //   - function 必须有 return, 或通过函数名返回
  //----------------------------------------------------------
  function int factorial(int n);
    // 实现阶乘计算
    // factorial = (n<=1) ? 1 : n * factorial(n-1);
    // return factorial;

    // --- 你的代码 ---

    // --- 参考答案 ---
    if (n <= 1)
      factorial = 1;
    else
      factorial = n * factorial(n - 1);
  endfunction


  //----------------------------------------------------------
  // TODO 2: 写一个 task — 带延迟的脉冲生成
  //   - task 可以包含 #delay, @(posedge clk), wait()
  //   - task 可以有多个 output/inout 参数
  //   - task 不返回值
  //----------------------------------------------------------
  task generate_pulse(ref bit sig, input int high_ns, input int low_ns);
    // 实现: sig=1 持续 high_ns, 然后 sig=0 持续 low_ns

    // --- 你的代码 ---

    // --- 参考答案 ---
    sig = 1'b1;
    #(high_ns);
    sig = 1'b0;
    #(low_ns);
  endtask


  //----------------------------------------------------------
  // test
  //----------------------------------------------------------
  bit pulse;

  initial begin
    int result;
    result = factorial(5);
    $display("factorial(5) = %0d", result);

    generate_pulse(pulse, 10, 5);
    $display("Pulse test done");
  end

endmodule
