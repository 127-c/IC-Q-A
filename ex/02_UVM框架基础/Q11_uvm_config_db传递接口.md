# Q11. 接口怎么传递到验证环境中（uvm_config_db）

> 🏷️ UVM 框架基础 | ⭐⭐ 中等 | 💻 代码题
> 📂 配套练习文件: [`Q11_uvm_config_db传递接口.sv`](./Q11_uvm_config_db传递接口.sv)

---

## 🎯 题目

传递virtual interface到环境中；

配置单一变量值，例如int、string、enum等；

传递配置对象（config_object）到环境；

传递virtual interface到环境中；

- 虽然SV可以通过层次化的interface的索引完成传递，但是这种传递方式不利于软件环境的封装和复用。通过使用uvm_config_db配置机制来传递接口，可以将接口的传递与获取彻底分离开。

- 接口传递从硬件世界到UVM环境可以通过uvm_config_db来实现，在实现过程中应当注意：

- 接口传递应发生在run_test()之前。这保证了在进入build_phase之前，virtual interface已经被传递到uvm_config_db中。

- 用户应当把interface与virtual interface区分开来，在传递过程中的类型应当为virtual interface，即实际接口的句柄。

配置单一变量值，例如int、string、enum等；

- 在各个test中，可以在build_phase阶段对底层组件的各个变量加以配置，进而在环境例化之前完成配置，使得环境可以按照预期运行。

传递配置对象（config_object）到环境；

- 在test配置中，需要配置的参数不只是数量多，可能还分属于不同的组件。对这么多层次的变量做出类似上边的单一变量传递，需要更多的代码，容易出错且不易复用。

- 如果整合各个组件中的变量，将其放置在一个uvm_object中，再对中心化的配置对象进行传递，将有利于整体环境的修改维护，提升代码的复用性。

---

## 📋 TODO 清单

- [ ] 理解题目核心概念，能用自己的语言解释
- [ ] 写出简洁的要点答案
- [ ] 打开 `.sv` 文件，完成所有 `// TODO:` 标记的代码
- [ ] 尝试编译/仿真验证你的代码
- [ ] 列出面试中可能的追问

---

## 💻 代码练习

> 请打开 [`Q11_uvm_config_db传递接口.sv`](./Q11_uvm_config_db传递接口.sv) 完成代码 TODO，然后回到这里查看答案。

---

## 💡 提示
- 回想UVM类库继承层次: uvm_object → uvm_component
- factory核心: 注册→创建→覆盖

---

## ✅ 参考答案

<details>
<summary>点击展开完整答案</summary>

传递virtual interface到环境中；

配置单一变量值，例如int、string、enum等；

传递配置对象（config_object）到环境；

传递virtual interface到环境中；

- 虽然SV可以通过层次化的interface的索引完成传递，但是这种传递方式不利于软件环境的封装和复用。通过使用uvm_config_db配置机制来传递接口，可以将接口的传递与获取彻底分离开。

- 接口传递从硬件世界到UVM环境可以通过uvm_config_db来实现，在实现过程中应当注意：

- 接口传递应发生在run_test()之前。这保证了在进入build_phase之前，virtual interface已经被传递到uvm_config_db中。

- 用户应当把interface与virtual interface区分开来，在传递过程中的类型应当为virtual interface，即实际接口的句柄。

配置单一变量值，例如int、string、enum等；

- 在各个test中，可以在build_phase阶段对底层组件的各个变量加以配置，进而在环境例化之前完成配置，使得环境可以按照预期运行。

传递配置对象（config_object）到环境；

- 在test配置中，需要配置的参数不只是数量多，可能还分属于不同的组件。对这么多层次的变量做出类似上边的单一变量传递，需要更多的代码，容易出错且不易复用。

- 如果整合各个组件中的变量，将其放置在一个uvm_object中，再对中心化的配置对象进行传递，将有利于整体环境的修改维护，提升代码的复用性。

</details>

---

📅 日期: ___/___  |  ⏱️ 用时: ___分钟  |  ✅ 掌握: ___/5  |  🔄 复习: ___次