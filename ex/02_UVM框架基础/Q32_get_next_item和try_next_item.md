# Q32. get_next_item（）和try_next_item（）有什么区别

> 🏷️ UVM 框架基础 | ⭐⭐ 中等 | 📝 简答题

---

## 🎯 题目

- get_next_item（）是一个阻塞调用，直到存在可供驱动的sequence item为止，并返回指向sequence item的指针。

- try_next_item（）是非阻塞调用，如果没有可供驱动的sequence item，则返回空指针。

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

- get_next_item（）是一个阻塞调用，直到存在可供驱动的sequence item为止，并返回指向sequence item的指针。

- try_next_item（）是非阻塞调用，如果没有可供驱动的sequence item，则返回空指针。

</details>

---

📅 日期: ___/___  |  ⏱️ 用时: ___分钟  |  ✅ 掌握: ___/5  |  🔄 复习: ___次