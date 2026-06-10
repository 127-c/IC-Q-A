# Q49. phase中的domain概念

> 🏷️ UVM 进阶机制 | 📝 练习

---

## 🎯 题目

Q49. phase中的domain概念 

Domain是用来组织不同组件，实现独立运行的概率。默认情况下，UVM的9个phase属于 common_domain，12个小phase属于uvm_domain。例如，如果我们有两个dirver类，默认情况下，两个driver类中的复位phase和 main phase必须同时执行,但是我们可以设置两个driver属于不同的domain,这样两个dirver就是独立运行的了，相当于处于不同的时钟域(只针对12个小phase有效)。

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

Q49. phase中的domain概念 

Domain是用来组织不同组件，实现独立运行的概率。默认情况下，UVM的9个phase属于 common_domain，12个小phase属于uvm_domain。例如，如果我们有两个dirver类，默认情况下，两个driver类中的复位phase和 main phase必须同时执行,但是我们可以设置两个driver属于不同的domain,这样两个dirver就是独立运行的了，相当于处于不同的时钟域(只针对12个小phase有效)。

</details>

---

📅 日期: ___/___  |  ⏱️ 用时: ___分钟  |  ✅ 掌握: ___/5  |  🔄 复习: ___次