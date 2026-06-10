# Q55. Sequence和sequencer的关系

> 🏷️ UVM 进阶机制 | ⭐⭐ 中等 | 📝 简答题

---

## 🎯 题目

-  sequence机制用于产生激励，它是UVM中最重要的机制之一。sequence机制有两大组成部分：sequence和sequencer。

-  在整个验证平台中sequence处于一个比较特殊的位置。sequence不属于验证平台的任何一部分，但是它与sequencer之间有着密切的关系。

-  只有在sequencer的帮助下，sequence产生的transaction才能最终送给driver；同样，sequencer只有在sequence出现的情况下才能体现出其价值，如果没有sequence，sequencer几乎没有任何作用。

-  除此之外，sequence与sequencer还有显著的区别。从本质上说，sequencer是一个uvm_component,而sequence是一个uvm_object。与my_transaction一样，sequence也有其生命周期。它的生命周期比my_transaction要更长一点，其内部的transaction全部发送完毕后，它的生命周期也就结束了。

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

-  sequence机制用于产生激励，它是UVM中最重要的机制之一。sequence机制有两大组成部分：sequence和sequencer。

-  在整个验证平台中sequence处于一个比较特殊的位置。sequence不属于验证平台的任何一部分，但是它与sequencer之间有着密切的关系。

-  只有在sequencer的帮助下，sequence产生的transaction才能最终送给driver；同样，sequencer只有在sequence出现的情况下才能体现出其价值，如果没有sequence，sequencer几乎没有任何作用。

-  除此之外，sequence与sequencer还有显著的区别。从本质上说，sequencer是一个uvm_component,而sequence是一个uvm_object。与my_transaction一样，sequence也有其生命周期。它的生命周期比my_transaction要更长一点，其内部的transaction全部发送完毕后，它的生命周期也就结束了。

</details>

---

📅 日期: ___/___  |  ⏱️ 用时: ___分钟  |  ✅ 掌握: ___/5  |  🔄 复习: ___次