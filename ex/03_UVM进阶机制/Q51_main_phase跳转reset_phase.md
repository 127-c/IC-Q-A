# Q51. main_phase要如何跳转到reset_phase;

> 🏷️ UVM 进阶机制 | 📝 练习

---

## 🎯 题目


**题目**: main_phase要如何跳转到reset_phase？

**核心要点**:
使用 `phase.jump()` 方法实现phase跳转。

**代码示例**:
```systemverilog
task main_phase(uvm_phase phase);
  // 正常操作...
  forever begin
    @(posedge vif.clk);
    if (vif.reset) begin
      // 检测到reset, 跳转到reset_phase
      phase.jump(uvm_reset_phase::get());
    end
    // 其他操作...
  end
endtask
```

**注意事项**:
- jump()只能用于12个run-time小phase之间跳转
- 不能从run_phase跳转到小phase，反之亦然
- jump后当前phase立即结束，目标phase从头开始执行


Q51. main_phase要如何跳转到reset_phase; 

在main_phase执行过程中，突然遇到reset信号被置起，可以用jump()实现从mian_phase到reset_phase的跳转：

---

## 📋 TODO 清单

- [ ] 理解题目核心概念，能用自己的语言解释
- [ ] 写出简洁的要点答案
- [ ] 结合项目经验举例说明
- [ ] 列出面试中可能的追问

---

## 💡 提示
- 理解UVM设计哲学: 分离关注点、提高可重用性
- TLM是component间唯一的通信方式

---

## ✅ 参考答案

<details>
<summary>点击展开完整答案</summary>


**题目**: main_phase要如何跳转到reset_phase？

**核心要点**:
使用 `phase.jump()` 方法实现phase跳转。

**代码示例**:
```systemverilog
task main_phase(uvm_phase phase);
  // 正常操作...
  forever begin
    @(posedge vif.clk);
    if (vif.reset) begin
      // 检测到reset, 跳转到reset_phase
      phase.jump(uvm_reset_phase::get());
    end
    // 其他操作...
  end
endtask
```

**注意事项**:
- jump()只能用于12个run-time小phase之间跳转
- 不能从run_phase跳转到小phase，反之亦然
- jump后当前phase立即结束，目标phase从头开始执行


Q51. main_phase要如何跳转到reset_phase; 

在main_phase执行过程中，突然遇到reset信号被置起，可以用jump()实现从mian_phase到reset_phase的跳转：

</details>

---

📅 日期: ___/___  |  ⏱️ 用时: ___分钟  |  ✅ 掌握: ___/5  |  🔄 复习: ___次