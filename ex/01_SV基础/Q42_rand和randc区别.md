# Q42. Rand 和randc的区别

> 🏷️ SystemVerilog 基础 | 📝 练习
> 📂 配套代码: [`Q42_rand和randc区别.sv`](./Q42_rand和randc区别.sv)

---

## 🎯 题目

Q42. Rand 和randc的区别 

- rand修饰符：rand修饰的变量，每次随机时，都在取值范围内随机取一个值，每个值被随机到的概率是一样的，就想掷骰子一样。
- randc修饰符：randc表示周期性随机，即所有可能的值都取到过后，才会重复取值

randc为什么不能随机化产生具有唯一元素值的数组，请参考：
 

SV学习笔记——randc为什么不能随机化产生具有唯一元素值的数组
> 📷 [图片](https://i-blog.csdnimg.cn/blog_migrate/73accd1c446486d72a65d1862797ba52.png)
https://blog.csdn.net/weixin_42294124/article/details/123111524?spm=1001.2014.3001.5501

---

## 📋 TODO 清单

- [ ] 理解题目核心概念，能用自己的语言解释
- [ ] 写出简洁的要点答案
- [ ] 打开 `.sv` 文件，完成所有 `// TODO:` 标记的代码
- [ ] 结合项目经验举例说明
- [ ] 列出面试中可能的追问

---
> 💻 请打开 [`Q42_rand和randc区别.sv`](./Q42_rand和randc区别.sv) 完成代码练习，然后回来看答案。

---

## 💡 提示
- 回顾SystemVerilog LRM相关章节
- 注意对比不同机制的使用场景和差异

---

## ✅ 参考答案

<details>
<summary>点击展开完整答案</summary>

Q42. Rand 和randc的区别 

- rand修饰符：rand修饰的变量，每次随机时，都在取值范围内随机取一个值，每个值被随机到的概率是一样的，就想掷骰子一样。
- randc修饰符：randc表示周期性随机，即所有可能的值都取到过后，才会重复取值

randc为什么不能随机化产生具有唯一元素值的数组，请参考：
 

SV学习笔记——randc为什么不能随机化产生具有唯一元素值的数组
> 📷 [图片](https://i-blog.csdnimg.cn/blog_migrate/73accd1c446486d72a65d1862797ba52.png)
https://blog.csdn.net/weixin_42294124/article/details/123111524?spm=1001.2014.3001.5501

</details>

---

📅 日期: ___/___  |  ⏱️ 用时: ___分钟  |  ✅ 掌握: ___/5  |  🔄 复习: ___次