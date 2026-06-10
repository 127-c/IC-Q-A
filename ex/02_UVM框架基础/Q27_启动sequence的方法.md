# Q27. 启动Sequence的方法

> 🏷️ UVM 框架基础 | 📝 练习

---

## 🎯 题目

启动Sequence有哪些方法？分别怎么实现？

**核心要点**:

严格意义上有3种启动方式：

**1. 显式启动 — `sequence.start()`**:
```systemverilog
// 在test的run_phase中
my_sequence seq = my_sequence::type_id::create("seq");
seq.start(env.agt.sqr);  // 绑定到具体的sequencer
```

**2. 隐式启动 — `default_sequence`**:
```systemverilog
// 在test的build_phase中配置
uvm_config_db #(uvm_object_wrapper)::set(this,
  "env.agt.sqr.main_phase",
  "default_sequence",
  my_sequence::type_id::get());
```

**3. 宏启动 — `uvm_do系列**:
```systemverilog
`uvm_do(req)                       // 自动创建、随机化、发送
`uvm_do_with(req, {req.addr < 8'hFF;})  // 带约束
`uvm_do_on(req, p_sequencer)       // 指定sequencer
```

**注意**: 一般需要在sequence的body()中 `raise_objection` / `drop_objection` 来控制仿真结束。

---

## 📋 TODO 清单

- [ ] 理解三种启动方式的区别和使用场景
- [ ] 写出每种方式的代码示例
- [ ] 理解 default_sequence 和 sequencer 的绑定关系
- [ ] 列出面试中可能的追问

---

## 💡 提示
- 显式启动最灵活，可以在运行时动态决定启动哪个sequence
- default_sequence最常用，配置一次自动执行
- `uvm_do宏是快捷方式，内部封装了start_item/finish_item

---

## ✅ 参考答案

<details>
<summary>点击展开完整答案</summary>

严格意义上有2种（`uvm_do算start的变体):  

1. 通过 `sequence.start(sequencer)` 的方式**显式启动**，需要指定目标sequencer  
2. 通过 `default_sequence` 在config_db中配置来**隐式启动**  

另外 `uvm_do系列宏(start_item/finish_item的封装) 也常用于在sequence内部发送item。

| 方式 | 控制粒度 | 灵活性 | 使用场景 |
|------|---------|--------|---------|
| start() | 最高 | 最高 | 动态场景组合 |
| default_sequence | 中等 | 中等 | 常规测试 |
| uvm_do宏 | 最便捷 | 较低 | 简单激励 |

</details>

---

📅 日期: ___/___  |  ⏱️ 用时: ___分钟  |  ✅ 掌握: ___/5  |  🔄 复习: ___次
