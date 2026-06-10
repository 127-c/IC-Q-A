# Q50. run_phase和main_phase之间的关系;

> 🏷️ UVM 进阶机制 | ⭐⭐ 中等 | 📝 简答题

---

## 🎯 题目

-  run_phase和main phase（动态运行）都是task phase，且是并行运行的，后者称为动态运行(run-time)的phase。

-  如果想执行一些耗费时间的代码，那么要在此phase下任意一个component中至少提起一次objection，这个结论只适用于12个run-time的phase。对于run_phase则不适用，由于run_phase与动态运行的phase是并行运行的，如果12个动态运行的phase有objection被提起，那么run_phase根本不需要raise_objection就可以自动执行。

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

-  run_phase和main phase（动态运行）都是task phase，且是并行运行的，后者称为动态运行(run-time)的phase。

-  如果想执行一些耗费时间的代码，那么要在此phase下任意一个component中至少提起一次objection，这个结论只适用于12个run-time的phase。对于run_phase则不适用，由于run_phase与动态运行的phase是并行运行的，如果12个动态运行的phase有objection被提起，那么run_phase根本不需要raise_objection就可以自动执行。

</details>

---

📅 日期: ___/___  |  ⏱️ 用时: ___分钟  |  ✅ 掌握: ___/5  |  🔄 复习: ___次