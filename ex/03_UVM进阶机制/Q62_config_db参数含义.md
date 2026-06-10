# Q62. Config_db的作用，以及传递其使用时的参数含义

> 🏷️ UVM 进阶机制 | ⭐⭐ 中等 | 💻 代码题
> 📂 配套练习文件: [`Q62_config_db参数含义.sv`](./Q62_config_db参数含义.sv)

---

## 🎯 题目

-  Config_db 机制主要作用就是传递参数使得TB的可配置性高，更加灵活。Config_db机制主要传递的有三种类型:

-  一种是interface虚拟接口，通过传递virtual interface使得dirver和 monitor能够与DUT连接，并驱动接口和采集接口信号。

-  第二种是单一变量参数，如int,string,enum等，这些主要就是为了配置某些循环次数，id号是多少等等。

-  第三种是object类，这种主要是当配置参数较多时，我们可以将其封装成一个object类，去包含这些属性和相关的处理方法,这样传递起来就比较简单明朗，不易出错。

-  Config_db 的参数主要由四个参数组成，如下所示，第一个参数为父的根parent，第二个参数为接下来的路径，对应的组件，第三个是传递时的名字（必须保持一致)，第四个是变量名。uvm_config_db #(virtual interface) :: set(uvm_root:.get(),"uvm_test_top.c1",'vif",vif); uvm_config_db #(virtual interface) :: get(this,"”,"vif",vif);

---

## 📋 TODO 清单

- [ ] 理解题目核心概念，能用自己的语言解释
- [ ] 写出简洁的要点答案
- [ ] 打开 `.sv` 文件，完成所有 `// TODO:` 标记的代码
- [ ] 尝试编译/仿真验证你的代码
- [ ] 列出面试中可能的追问

---

## 💻 代码练习

> 请打开 [`Q62_config_db参数含义.sv`](./Q62_config_db参数含义.sv) 完成代码 TODO，然后回到这里查看答案。

---

## 💡 提示
- 理解UVM设计哲学: 分离关注点、提高可重用性
- TLM是component间唯一的通信方式

---

## ✅ 参考答案

<details>
<summary>点击展开完整答案</summary>

-  Config_db 机制主要作用就是传递参数使得TB的可配置性高，更加灵活。Config_db机制主要传递的有三种类型:

-  一种是interface虚拟接口，通过传递virtual interface使得dirver和 monitor能够与DUT连接，并驱动接口和采集接口信号。

-  第二种是单一变量参数，如int,string,enum等，这些主要就是为了配置某些循环次数，id号是多少等等。

-  第三种是object类，这种主要是当配置参数较多时，我们可以将其封装成一个object类，去包含这些属性和相关的处理方法,这样传递起来就比较简单明朗，不易出错。

-  Config_db 的参数主要由四个参数组成，如下所示，第一个参数为父的根parent，第二个参数为接下来的路径，对应的组件，第三个是传递时的名字（必须保持一致)，第四个是变量名。uvm_config_db #(virtual interface) :: set(uvm_root:.get(),"uvm_test_top.c1",'vif",vif); uvm_config_db #(virtual interface) :: get(this,"”,"vif",vif);

</details>

---

📅 日期: ___/___  |  ⏱️ 用时: ___分钟  |  ✅ 掌握: ___/5  |  🔄 复习: ___次