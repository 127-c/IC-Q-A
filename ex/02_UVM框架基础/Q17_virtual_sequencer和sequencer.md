# Q17. Virtual sequencer 和sequencer的区别

> 🏷️ UVM 框架基础 | ⭐⭐ 中等 | 📝 简答题

---

## 🎯 题目

- Virtual sequencer主要用于对不同的agent进行协调时，需要有一定顶层的sequencer对内部各个agent中的sequencer进行协调

- virtual sequencer是面向多个sequencer的多个sequence群，而sequencer是面向一个sequencer 的sequence群。

- Virtual sequencer桥接着所有底层的sequencer的句柄，其本身也不需要传递item，不需要和driver连接。只需要将其内部的底层sequencer句柄和sequencer 实体对象连接。

---

## 📋 TODO 清单

- [ ] 理解题目核心概念，能用自己的语言解释
- [ ] 写出简洁的要点答案
- [ ] 结合项目经验举例说明
- [ ] 列出面试中可能的追问

---

## 💡 提示
- 回想UVM类库继承层次: uvm_object → uvm_component
- factory核心: 注册→创建→覆盖

---

## ✅ 参考答案

<details>
<summary>点击展开完整答案</summary>

- Virtual sequencer主要用于对不同的agent进行协调时，需要有一定顶层的sequencer对内部各个agent中的sequencer进行协调

- virtual sequencer是面向多个sequencer的多个sequence群，而sequencer是面向一个sequencer 的sequence群。

- Virtual sequencer桥接着所有底层的sequencer的句柄，其本身也不需要传递item，不需要和driver连接。只需要将其内部的底层sequencer句柄和sequencer 实体对象连接。

</details>

---

📅 日期: ___/___  |  ⏱️ 用时: ___分钟  |  ✅ 掌握: ___/5  |  🔄 复习: ___次