# Q54. Sequence和item（uvm_sequece，uvm_sequence_item）以及sequence的分类

> 🏷️ UVM 进阶机制 | ⭐⭐ 中等 | 📝 简答题

---

## 🎯 题目

-  item是基于uvm_object类，这表明了它具备UVM核心基类所必要的数据操作方法，例如copy、 clone、compare、record等。

-  item对象的生命应该开始于sequence的body（）方法，而后经历了随机化并穿越sequencer最终到达driver，直到被driver消化之后，它的生命一般来讲才会结束。

-  item与sequence的关系 一个sequence可以包含一些有序组织起来的item实例，考虑到item在创建后需要被随机化，sequence在声明时也需要预留一些可供外部随机化的变量，这些随机变量一部分是用来通过层级传递约束来最终控制item对象的随机变量，一部分是用来对item对象之间加以组织和时序控制的。

-  Sequence的分类:

-  扁平类（flat sequence)：这一类往往只用来组织更细小的粒度，即item实例构成的组织。

-  层次类( hierarchical sequence)：这一类是由更高层的sequence用来组织底层的sequence,进而让这些sequence或者按照顺序方式，或者按照并行方式，挂载到同一个sequencer上。

-  虚拟类（virtual sequence)：这一类则是最终控制整个测试场景的方式，鉴于整个环境中往往存在不同种类的sequencer和其对应的sequence，我们需要一个虚拟的sequence来协调顶层的测试场景。之所以称这个方式为virtual sequence，是因为该序列本身并不会固定挂载于某一种sequencer类型上，而是将其内部不同类型sequence最终挂载到不同的目标sequencer上面。这也是virtual sequence不同于hierarchical sequence的最大一点。

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

-  item是基于uvm_object类，这表明了它具备UVM核心基类所必要的数据操作方法，例如copy、 clone、compare、record等。

-  item对象的生命应该开始于sequence的body（）方法，而后经历了随机化并穿越sequencer最终到达driver，直到被driver消化之后，它的生命一般来讲才会结束。

-  item与sequence的关系 一个sequence可以包含一些有序组织起来的item实例，考虑到item在创建后需要被随机化，sequence在声明时也需要预留一些可供外部随机化的变量，这些随机变量一部分是用来通过层级传递约束来最终控制item对象的随机变量，一部分是用来对item对象之间加以组织和时序控制的。

-  Sequence的分类:

-  扁平类（flat sequence)：这一类往往只用来组织更细小的粒度，即item实例构成的组织。

-  层次类( hierarchical sequence)：这一类是由更高层的sequence用来组织底层的sequence,进而让这些sequence或者按照顺序方式，或者按照并行方式，挂载到同一个sequencer上。

-  虚拟类（virtual sequence)：这一类则是最终控制整个测试场景的方式，鉴于整个环境中往往存在不同种类的sequencer和其对应的sequence，我们需要一个虚拟的sequence来协调顶层的测试场景。之所以称这个方式为virtual sequence，是因为该序列本身并不会固定挂载于某一种sequencer类型上，而是将其内部不同类型sequence最终挂载到不同的目标sequencer上面。这也是virtual sequence不同于hierarchical sequence的最大一点。

</details>

---

📅 日期: ___/___  |  ⏱️ 用时: ___分钟  |  ✅ 掌握: ___/5  |  🔄 复习: ___次