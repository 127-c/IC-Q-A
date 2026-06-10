# Q10. UVM从哪里启动，接口怎么传递到环境中

> 🏷️ UVM 框架基础 | ⭐⭐ 中等 | 💻 代码题
> 📂 配套练习文件: [`Q10_UVM启动和接口传递.sv`](./Q10_UVM启动和接口传递.sv)

---

## 🎯 题目

UVM的启动

总结:

- 在导入uvm_pkg文件时，会自动创建UVM_root所例化的对象UVM_top，UVM顶层的类会提供run_test()方法充当UVM世界的核心角色，通过UVM_top调用run_test()方法.

- 在环境中输入run_test来启动UVM验证平台，run_test语句会创建一个my_case0的实例，得到正确的test_name

依次执行uvm_test容器中的各个component组件中的phase机制，按照顺序:

- build-phase（自顶向下构建UVM 树）

- connet_phase(自低向上连接各个组件)

- end_of_elaboration_phase

- start_of_simulation_phase

- run_phase() objection机制仿真挂起，通过start启动sequence（每个sequence都有一个body任务。当一个sequence启动后，会自动执行sequence的body任务）,等到sequence发送完毕则关闭objection，结束run_phase()（UVM_objection提供component和sequence共享的计数器，当所有参与到objection机制中的组件都落下objection时，计数器counter才会清零，才满足run_phase()退出的条件）

- 执行后面的phase

---

## 📋 TODO 清单

- [ ] 理解题目核心概念，能用自己的语言解释
- [ ] 写出简洁的要点答案
- [ ] 打开 `.sv` 文件，完成所有 `// TODO:` 标记的代码
- [ ] 尝试编译/仿真验证你的代码
- [ ] 列出面试中可能的追问

---

## 💻 代码练习

> 请打开 [`Q10_UVM启动和接口传递.sv`](./Q10_UVM启动和接口传递.sv) 完成代码 TODO，然后回到这里查看答案。

---

## 💡 提示
- 回想UVM类库继承层次: uvm_object → uvm_component
- factory核心: 注册→创建→覆盖

---

## ✅ 参考答案

<details>
<summary>点击展开完整答案</summary>

UVM的启动

总结:

- 在导入uvm_pkg文件时，会自动创建UVM_root所例化的对象UVM_top，UVM顶层的类会提供run_test()方法充当UVM世界的核心角色，通过UVM_top调用run_test()方法.

- 在环境中输入run_test来启动UVM验证平台，run_test语句会创建一个my_case0的实例，得到正确的test_name

依次执行uvm_test容器中的各个component组件中的phase机制，按照顺序:

- build-phase（自顶向下构建UVM 树）

- connet_phase(自低向上连接各个组件)

- end_of_elaboration_phase

- start_of_simulation_phase

- run_phase() objection机制仿真挂起，通过start启动sequence（每个sequence都有一个body任务。当一个sequence启动后，会自动执行sequence的body任务）,等到sequence发送完毕则关闭objection，结束run_phase()（UVM_objection提供component和sequence共享的计数器，当所有参与到objection机制中的组件都落下objection时，计数器counter才会清零，才满足run_phase()退出的条件）

- 执行后面的phase

</details>

---

📅 日期: ___/___  |  ⏱️ 用时: ___分钟  |  ✅ 掌握: ___/5  |  🔄 复习: ___次