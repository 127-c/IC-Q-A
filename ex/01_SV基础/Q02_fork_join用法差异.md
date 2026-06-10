# Q2. 多线程fork join/fork join_any/fork join_none的用法差异

> 🏷️ SystemVerilog 基础 | ⭐⭐ 中等 | 💻 代码题
> 📂 配套练习文件: [`Q02_fork_join用法差异.sv`](./Q02_fork_join用法差异.sv)

---

## 🎯 题目

- Fork join:内部 begin end块并行运行，直到所有线程运行完毕才会进入下一个阶段。

- Fork join_any:内部 begin end块并行运行，任意一个begin end块运行结束就可以进入下一个阶段。

- Fork join_none:内部 begin end块并行运行，无需等待可以直接进入下一个阶段。

- wait fork：会引起调用进程阻塞，直到它的所有子进程结束，一般用来确保所有子进程（调用进程产生的进程，也即一级子进程）执行都已经结束。

- disable fork：用来终止调用进程 的所有活跃进程， 以及进程的所有子进程。

---

## 📋 TODO 清单

- [ ] 理解题目核心概念，能用自己的语言解释
- [ ] 写出简洁的要点答案
- [ ] 打开 `.sv` 文件，完成所有 `// TODO:` 标记的代码
- [ ] 尝试编译/仿真验证你的代码
- [ ] 列出面试中可能的追问

---

## 💻 代码练习

> 请打开 [`Q02_fork_join用法差异.sv`](./Q02_fork_join用法差异.sv) 完成代码 TODO，然后回到这里查看答案。

---

## 💡 提示
- 回顾SystemVerilog LRM相关章节
- 注意对比不同数据结构/机制的使用场景

---

## ✅ 参考答案

<details>
<summary>点击展开完整答案</summary>

- Fork join:内部 begin end块并行运行，直到所有线程运行完毕才会进入下一个阶段。

- Fork join_any:内部 begin end块并行运行，任意一个begin end块运行结束就可以进入下一个阶段。

- Fork join_none:内部 begin end块并行运行，无需等待可以直接进入下一个阶段。

- wait fork：会引起调用进程阻塞，直到它的所有子进程结束，一般用来确保所有子进程（调用进程产生的进程，也即一级子进程）执行都已经结束。

- disable fork：用来终止调用进程 的所有活跃进程， 以及进程的所有子进程。

</details>

---

📅 日期: ___/___  |  ⏱️ 用时: ___分钟  |  ✅ 掌握: ___/5  |  🔄 复习: ___次