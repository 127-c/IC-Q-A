# Q43. 组件之间的通信机制，analysis port和其它的区别

> 🏷️ 验证流程与综合 | ⭐⭐⭐ 困难 | 💻 代码题

---

## 🎯 题目

1、通信分为，单向通信，双向通信和多向通信

- 单向通信：指的是从initiator到target之间的数据流向是单一方向的

- 双向通信：双向通信的两端也分为initiator和target，但是数据流向在端对端之间是双向的

- 多向通信：仍然是两个组件之间的通信，是指initiator与target之间的相同TLM端口数目超过一个时的处理解决办法。

2、blocking阻塞传输的方法包含:

- Put（）：initiator先生成数据Tt，同时将该数据传送至target。

- Get（）:initiator从target获取数据Tt，而target中的该数据Tt则应消耗。

- Peek(): initiator从target获取数据Tt，而target中的该数据Tt还应保留。

3、通信管道：

- TLM FIFO：可以进行数据缓存，功能类似于mailbox，不同的地方在于uvm_tlm_fifo提供了各种端口（put、get、peek）供用户使用

- analysis port：一端对多端，用于多个组件同时对一个数据进行处理，如果这个数据是从同一个源的TLM端口发出到达不同组件，则要求该端口能够满足一端到多端，如果数据源端发生变化需要通知跟它关联的多个组件时，我们可以利用软件的设计模式之一观察者模式实现，即广播模式

- analysis TLM FIFO

a. 由于analysis端口提出实现了一端到多端的TLM数据传输，而一个新的数据缓存组件类uvm_tlm_analysis_fifo为用户们提供了可以搭配uvm_analysis_port端口uvm_analysis_imp端口和write()函数。

b.uvm_tlm_analysis_fifo类继承于uvm_tlm_fifo，这表明它本身具有面向单一TLM端口的数据缓存特性，而同时该类又有一个uvm_analysis_imp端口analysis_export并且实现了write()函数:

- request & response通信管道

双向通信端口transport，即通过在target端实现transport()方法可以在一次传输中既发送request又可以接收response。

---

## 📋 TODO 清单

- [ ] 理解题目核心概念，能用自己的语言解释
- [ ] 写出简洁的要点答案
- [ ] 打开 `.sv` 文件，完成所有 `// TODO:` 标记的代码
- [ ] 尝试编译/仿真验证你的代码
- [ ] 列出面试中可能的追问

---

## 💡 提示
- 验证核心是证明功能正确，不是找bug
- 结合项目经历回答更有说服力

---

## ✅ 参考答案

<details>
<summary>点击展开完整答案</summary>

1、通信分为，单向通信，双向通信和多向通信

- 单向通信：指的是从initiator到target之间的数据流向是单一方向的

- 双向通信：双向通信的两端也分为initiator和target，但是数据流向在端对端之间是双向的

- 多向通信：仍然是两个组件之间的通信，是指initiator与target之间的相同TLM端口数目超过一个时的处理解决办法。

2、blocking阻塞传输的方法包含:

- Put（）：initiator先生成数据Tt，同时将该数据传送至target。

- Get（）:initiator从target获取数据Tt，而target中的该数据Tt则应消耗。

- Peek(): initiator从target获取数据Tt，而target中的该数据Tt还应保留。

3、通信管道：

- TLM FIFO：可以进行数据缓存，功能类似于mailbox，不同的地方在于uvm_tlm_fifo提供了各种端口（put、get、peek）供用户使用

- analysis port：一端对多端，用于多个组件同时对一个数据进行处理，如果这个数据是从同一个源的TLM端口发出到达不同组件，则要求该端口能够满足一端到多端，如果数据源端发生变化需要通知跟它关联的多个组件时，我们可以利用软件的设计模式之一观察者模式实现，即广播模式

- analysis TLM FIFO

a. 由于analysis端口提出实现了一端到多端的TLM数据传输，而一个新的数据缓存组件类uvm_tlm_analysis_fifo为用户们提供了可以搭配uvm_analysis_port端口uvm_analysis_imp端口和write()函数。

b.uvm_tlm_analysis_fifo类继承于uvm_tlm_fifo，这表明它本身具有面向单一TLM端口的数据缓存特性，而同时该类又有一个uvm_analysis_imp端口analysis_export并且实现了write()函数:

- request & response通信管道

双向通信端口transport，即通过在target端实现transport()方法可以在一次传输中既发送request又可以接收response。

</details>

---

📅 日期: ___/___  |  ⏱️ 用时: ___分钟  |  ✅ 掌握: ___/5  |  🔄 复习: ___次