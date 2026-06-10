# Q59. 如何在driver中使用interface，为什么

> 🏷️ UVM 进阶机制 | ⭐⭐ 中等 | 💻 代码题

---

## 🎯 题目

-  Interface如果不进行virtual声明的话是不能直接使用在dirver中的,会报错，因为interface声明的是一个实际的物理接口。一般在dirver中使用virtual interface进行申明接口，然后通过config_db进行接口参数传递，这样我们可以从上层组件获得虚拟的interface接口进行处理。

-  Config_db传递时只能传递virtual接口，即interface的句柄，否则传递的是一个实际的物理接口，这在 driver中是不能实现的，且这样的话不同组件中的接口一一对应一个物理接口，那么操作就没有意义了。

---

## 📋 TODO 清单

- [ ] 理解题目核心概念，能用自己的语言解释
- [ ] 写出简洁的要点答案
- [ ] 打开 `.sv` 文件，完成所有 `// TODO:` 标记的代码
- [ ] 尝试编译/仿真验证你的代码
- [ ] 列出面试中可能的追问

---

## 💡 提示
- 理解UVM设计哲学: 分离关注点、提高可重用性
- TLM是component间唯一的通信方式

---

## ✅ 参考答案

<details>
<summary>点击展开完整答案</summary>

-  Interface如果不进行virtual声明的话是不能直接使用在dirver中的,会报错，因为interface声明的是一个实际的物理接口。一般在dirver中使用virtual interface进行申明接口，然后通过config_db进行接口参数传递，这样我们可以从上层组件获得虚拟的interface接口进行处理。

-  Config_db传递时只能传递virtual接口，即interface的句柄，否则传递的是一个实际的物理接口，这在 driver中是不能实现的，且这样的话不同组件中的接口一一对应一个物理接口，那么操作就没有意义了。

</details>

---

📅 日期: ___/___  |  ⏱️ 用时: ___分钟  |  ✅ 掌握: ___/5  |  🔄 复习: ___次