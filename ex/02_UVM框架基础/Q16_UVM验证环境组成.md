# Q16. UVM验证环境的组成

> 🏷️ UVM 框架基础 | ⭐⭐ 中等 | 💻 代码题
> 📂 配套练习文件: [`Q16_UVM验证环境组成.sv`](./Q16_UVM验证环境组成.sv)

---

## 🎯 题目

- Sequencer:负责将数据转给driver

- driver负责数据的发送;driver有时钟/时序的概念。

- Agent:其实只是简单的把driver ,monitor和sequencer封装在一起。

- Agent:对应的是物理接口协议,不同的接口协议对应不同的agent ，一个平台通常会有多个 agent 。

- Env：则相当于是一个特大的容器，将所有成员包含进去。

---

## 📋 TODO 清单

- [ ] 理解题目核心概念，能用自己的语言解释
- [ ] 写出简洁的要点答案
- [ ] 打开 `.sv` 文件，完成所有 `// TODO:` 标记的代码
- [ ] 尝试编译/仿真验证你的代码
- [ ] 列出面试中可能的追问

---

## 💻 代码练习

> 请打开 [`Q16_UVM验证环境组成.sv`](./Q16_UVM验证环境组成.sv) 完成代码 TODO，然后回到这里查看答案。

---

## 💡 提示
- 回想UVM类库继承层次: uvm_object → uvm_component
- factory核心: 注册→创建→覆盖

---

## ✅ 参考答案

<details>
<summary>点击展开完整答案</summary>

- Sequencer:负责将数据转给driver

- driver负责数据的发送;driver有时钟/时序的概念。

- Agent:其实只是简单的把driver ,monitor和sequencer封装在一起。

- Agent:对应的是物理接口协议,不同的接口协议对应不同的agent ，一个平台通常会有多个 agent 。

- Env：则相当于是一个特大的容器，将所有成员包含进去。

</details>

---

📅 日期: ___/___  |  ⏱️ 用时: ___分钟  |  ✅ 掌握: ___/5  |  🔄 复习: ___次