# Q58. 为什么会有sequence、sequencer以及driver，为什么要分开实现，这样做的好处是什么？

> 🏷️ UVM 进阶机制 | ⭐⭐ 中等 | 📝 简答题

---

## 🎯 题目

-  在UVM中有sequence机制，以往如果我们使用SV进行TB搭建时，我们一般会采用driver 一个类进行数据的参数,转换,发送,或者使用genetor和driver两个进行，这种方式可重用性很低，而且代码臃肿;

-  但是在UVM中我们通过将sequence、sequencer、driver、sequence_item拆开，相互独立而又有联系，因此我们只需关注每一个类需要做的工作就可以，可重用性高。我在学习sequence时，我经常把sequence 比作蓄水池，sequence_item就是水，sequencer就是一个调度站，driver就是总工厂，通过这种方式进行处理，我们的总工厂不需要管其他，只需处理运送过来的水资源就可以，而sequencer只需要调度水资源，sequence只需要产生不同的水资源。

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

-  在UVM中有sequence机制，以往如果我们使用SV进行TB搭建时，我们一般会采用driver 一个类进行数据的参数,转换,发送,或者使用genetor和driver两个进行，这种方式可重用性很低，而且代码臃肿;

-  但是在UVM中我们通过将sequence、sequencer、driver、sequence_item拆开，相互独立而又有联系，因此我们只需关注每一个类需要做的工作就可以，可重用性高。我在学习sequence时，我经常把sequence 比作蓄水池，sequence_item就是水，sequencer就是一个调度站，driver就是总工厂，通过这种方式进行处理，我们的总工厂不需要管其他，只需处理运送过来的水资源就可以，而sequencer只需要调度水资源，sequence只需要产生不同的水资源。

</details>

---

📅 日期: ___/___  |  ⏱️ 用时: ___分钟  |  ✅ 掌握: ___/5  |  🔄 复习: ___次