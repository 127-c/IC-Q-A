# Q31. 哪些继承于component，哪些继承于object

> 🏷️ UVM 框架基础 | 📝 练习

---

## 🎯 题目


**题目**: 哪些继承于component，哪些继承于object？

**核心区分**:
- **继承于 uvm_component** (参与树形结构，有phase机制):
  - driver, monitor, sequencer, agent
  - scoreboard, reference model (通常)
  - env, test
  - predictor, coverage collector

- **继承于 uvm_object** (不参与树形结构，无phase):
  - sequence_item (transaction)
  - sequence
  - config (配置对象)
  - uvm_reg (寄存器模型相关)

**记忆技巧**: 除了driver、monitor、agent、sequencer、scoreboard、env、test之外，全部用uvm_object。


Q31. 哪些继承于component，哪些继承于object 

> 📷 [图片](https://i-blog.csdnimg.cn/blog_migrate/f928464bc2982434e87ab6b7657a90e7.png)

 

 除了driver、monitor、agent、model、scoreboard、env、test之外全部用uvm_object。

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


**题目**: 哪些继承于component，哪些继承于object？

**核心区分**:
- **继承于 uvm_component** (参与树形结构，有phase机制):
  - driver, monitor, sequencer, agent
  - scoreboard, reference model (通常)
  - env, test
  - predictor, coverage collector

- **继承于 uvm_object** (不参与树形结构，无phase):
  - sequence_item (transaction)
  - sequence
  - config (配置对象)
  - uvm_reg (寄存器模型相关)

**记忆技巧**: 除了driver、monitor、agent、sequencer、scoreboard、env、test之外，全部用uvm_object。


Q31. 哪些继承于component，哪些继承于object 

> 📷 [图片](https://i-blog.csdnimg.cn/blog_migrate/f928464bc2982434e87ab6b7657a90e7.png)

 

 除了driver、monitor、agent、model、scoreboard、env、test之外全部用uvm_object。

</details>

---

📅 日期: ___/___  |  ⏱️ 用时: ___分钟  |  ✅ 掌握: ___/5  |  🔄 复习: ___次