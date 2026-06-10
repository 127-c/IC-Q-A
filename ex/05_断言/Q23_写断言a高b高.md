# Q23. 用过断言嘛？写一个断言，a为高的时候，b为高，还有a为高的时候，下一个周期b为高

> 🏷️ 断言 SVA | ⭐⭐ 中等 | 💻 代码题
> 📂 配套练习文件: [`Q23_写断言a高b高.sv`](./Q23_写断言a高b高.sv)

---

## 🎯 题目

```systemverilog
property a_high_then_b_high;  //a和b同时为高
@(posedge clk)
    a|->b;
endproperty

property a_high_then_b_high;
@(posedge clk)                 //a为高，下一个周期b为高
    a|=>b;
endproperty

a:assert property(a_high_then_b_high);

```

---

## 📋 TODO 清单

- [ ] 理解题目核心概念，能用自己的语言解释
- [ ] 写出简洁的要点答案
- [ ] 打开 `.sv` 文件，完成所有 `// TODO:` 标记的代码
- [ ] 尝试编译/仿真验证你的代码
- [ ] 列出面试中可能的追问

---

## 💻 代码练习

> 请打开 [`Q23_写断言a高b高.sv`](./Q23_写断言a高b高.sv) 完成代码 TODO，然后回到这里查看答案。

---

## 💡 提示
- 区分 |-> 和 |=> 的区别
- 断言不仅能检查错误，也能做功能覆盖率

---

## ✅ 参考答案

<details>
<summary>点击展开完整答案</summary>

```systemverilog
property a_high_then_b_high;  //a和b同时为高
@(posedge clk)
    a|->b;
endproperty

property a_high_then_b_high;
@(posedge clk)                 //a为高，下一个周期b为高
    a|=>b;
endproperty

a:assert property(a_high_then_b_high);

```

</details>

---

📅 日期: ___/___  |  ⏱️ 用时: ___分钟  |  ✅ 掌握: ___/5  |  🔄 复习: ___次