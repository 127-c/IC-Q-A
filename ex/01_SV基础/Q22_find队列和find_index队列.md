# Q22. Find 队列和find index队列

> 🏷️ SystemVerilog 基础 | 📝 练习

---

## 🎯 题目


**题目**: find队列和find_index队列的区别？

**核心要点**:
- `find()` 系列方法返回**满足条件的元素值**
- `find_index()` 系列方法返回**满足条件的元素的索引**
- 通常和 `with` 子句配合使用

**代码示例**:
```systemverilog
int q[$] = '{1, 3, 5, 7, 9, 2, 4, 6, 8};
int result[$];

// find: 返回值
result = q.find(x) with (x > 5);     // {7, 9, 6, 8}
result = q.find_first(x) with (x > 5); // {7}

// find_index: 返回索引
result = q.find_index(x) with (x > 5); // {3, 4, 7, 8} (第3,4,7,8个元素)
result = q.find_first_index(x) with (x > 5); // {3}

// 其他相关方法:
// find_last(), find_last_index()
// find with 返回所有匹配; find_first 返回第一个匹配
```


Q22. Find 队列和find index队列 

find的队列应该是返回队列的值，一般的话是和with配合使用，find index应该是返回索引值

---

## 📋 TODO 清单

- [ ] 理解题目核心概念，能用自己的语言解释
- [ ] 写出简洁的要点答案
- [ ] 结合项目经验举例说明
- [ ] 列出面试中可能的追问

---

## 💡 提示
- 回顾SystemVerilog LRM相关章节
- 注意对比不同机制的使用场景和差异

---

## ✅ 参考答案

<details>
<summary>点击展开完整答案</summary>


**题目**: find队列和find_index队列的区别？

**核心要点**:
- `find()` 系列方法返回**满足条件的元素值**
- `find_index()` 系列方法返回**满足条件的元素的索引**
- 通常和 `with` 子句配合使用

**代码示例**:
```systemverilog
int q[$] = '{1, 3, 5, 7, 9, 2, 4, 6, 8};
int result[$];

// find: 返回值
result = q.find(x) with (x > 5);     // {7, 9, 6, 8}
result = q.find_first(x) with (x > 5); // {7}

// find_index: 返回索引
result = q.find_index(x) with (x > 5); // {3, 4, 7, 8} (第3,4,7,8个元素)
result = q.find_first_index(x) with (x > 5); // {3}

// 其他相关方法:
// find_last(), find_last_index()
// find with 返回所有匹配; find_first 返回第一个匹配
```


Q22. Find 队列和find index队列 

find的队列应该是返回队列的值，一般的话是和with配合使用，find index应该是返回索引值

</details>

---

📅 日期: ___/___  |  ⏱️ 用时: ___分钟  |  ✅ 掌握: ___/5  |  🔄 复习: ___次