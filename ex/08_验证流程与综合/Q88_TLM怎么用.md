# Q88. TLM怎么用

> 🏷️ 验证流程与综合 | ⭐⭐ 中等 | 💻 代码题
> 📂 配套练习文件: [`Q88_TLM怎么用.sv`](./Q88_TLM怎么用.sv)

---

## 🎯 题目

-  TLM通信的步骤：

-  分辨出initiator和target，producer和consumer。

-  在target中实现tlm通信方法。

-  在俩个对象中创建tlm端口。

-  在更高层次中将俩个对象进行连接。

-  端口类型有三种：

-  port，一般是initiator的发起端。

-  export，作为initiator和target的中间端口。

-  imp，只能作为target接受request的末端。

-  多个port可以连接同一个export或imp，但是单个port或export不能连接多个imp。

-  端口的连接：通过connect函数进行连接，例如A(initiator)与B进行连接，可以使用A.port.connect(B.export)

-  uvm_*_imp#(T,IMP);IMP定义中第一个参数T是这个IMP传输的数据类型，第二个参数IMP是实现这个接口所在的component。

转载于：

IC验证面试常问题88道_酒酒聊IC编程的博客-CSDN博客_ic验证面试问题

---

## 📋 TODO 清单

- [ ] 理解题目核心概念，能用自己的语言解释
- [ ] 写出简洁的要点答案
- [ ] 打开 `.sv` 文件，完成所有 `// TODO:` 标记的代码
- [ ] 尝试编译/仿真验证你的代码
- [ ] 列出面试中可能的追问

---

## 💻 代码练习

> 请打开 [`Q88_TLM怎么用.sv`](./Q88_TLM怎么用.sv) 完成代码 TODO，然后回到这里查看答案。

---

## 💡 提示
- 验证核心是证明功能正确，不是找bug
- 结合项目经历回答更有说服力

---

## ✅ 参考答案

<details>
<summary>点击展开完整答案</summary>

-  TLM通信的步骤：

-  分辨出initiator和target，producer和consumer。

-  在target中实现tlm通信方法。

-  在俩个对象中创建tlm端口。

-  在更高层次中将俩个对象进行连接。

-  端口类型有三种：

-  port，一般是initiator的发起端。

-  export，作为initiator和target的中间端口。

-  imp，只能作为target接受request的末端。

-  多个port可以连接同一个export或imp，但是单个port或export不能连接多个imp。

-  端口的连接：通过connect函数进行连接，例如A(initiator)与B进行连接，可以使用A.port.connect(B.export)

-  uvm_*_imp#(T,IMP);IMP定义中第一个参数T是这个IMP传输的数据类型，第二个参数IMP是实现这个接口所在的component。

转载于：

IC验证面试常问题88道_酒酒聊IC编程的博客-CSDN博客_ic验证面试问题

</details>

---

📅 日期: ___/___  |  ⏱️ 用时: ___分钟  |  ✅ 掌握: ___/5  |  🔄 复习: ___次