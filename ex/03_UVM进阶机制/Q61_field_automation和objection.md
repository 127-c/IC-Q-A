# Q61. field_automation机制和objection机制

> 🏷️ UVM 进阶机制 | ⭐⭐ 中等 | 📝 简答题

---

## 🎯 题目

-  field_automation机制：可以自动实现copy、compare、print等三个函数。当使用uvm_field系列相关宏注册之后，可以直接调用以上三个函数，而无需自己定义。这极大的简化了验证平台的搭建，尤其是简化了driver和monitor，提高了效率。

-  UVM中通过objection机制来控制验证平台的关闭，需要在drop_objection之前先raise_objection。验证在进入到某一phase时，UVM会收集此phase提出的所有objection，并且实时监测所有objection是否已经被撤销了,当发现所有都已经撤销后，那么就会关闭此phase，开始进入下一个phase。当所有的phase都执行完毕后，就会调用$finish来将整个验证平台关掉。如果UVM发现此phase没有提起任何objection，那么将会直接跳转到 下一个phase中。

-  UVM的设计哲学就是全部由sequence来控制激励生成，因此一般情况下只在sequence中控制objection。另外还需注意的是，raise_objection语句必须在main_phase中第一个消耗仿真时间的语句之前。

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

-  field_automation机制：可以自动实现copy、compare、print等三个函数。当使用uvm_field系列相关宏注册之后，可以直接调用以上三个函数，而无需自己定义。这极大的简化了验证平台的搭建，尤其是简化了driver和monitor，提高了效率。

-  UVM中通过objection机制来控制验证平台的关闭，需要在drop_objection之前先raise_objection。验证在进入到某一phase时，UVM会收集此phase提出的所有objection，并且实时监测所有objection是否已经被撤销了,当发现所有都已经撤销后，那么就会关闭此phase，开始进入下一个phase。当所有的phase都执行完毕后，就会调用$finish来将整个验证平台关掉。如果UVM发现此phase没有提起任何objection，那么将会直接跳转到 下一个phase中。

-  UVM的设计哲学就是全部由sequence来控制激励生成，因此一般情况下只在sequence中控制objection。另外还需注意的是，raise_objection语句必须在main_phase中第一个消耗仿真时间的语句之前。

</details>

---

📅 日期: ___/___  |  ⏱️ 用时: ___分钟  |  ✅ 掌握: ___/5  |  🔄 复习: ___次