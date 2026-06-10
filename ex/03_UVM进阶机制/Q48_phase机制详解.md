# Q48. 举例说明UVM组件中常用的方法，各种phase关系，phase机制作用

> 🏷️ UVM 进阶机制 | ⭐⭐⭐ 困难 | 💻 代码题

---

## 🎯 题目

-  UVM中有很多非常有趣的机制，例如factory机制，field_automation机制，phase机制，打印机制，sequence机制，config_db机制等，这些机制使得我们搭建的UVM能够有很好的可重用性和使得我们平台运行有秩序稳定。

-  例如phase机制，phase机制主要是使得UVM的运行仿真层次化，使得各种例化先后次序正确。UVM的phase机制主要有9个，外加12个小phase。主要的 phase有build phase、connect phase、run phase、report phase、final phase等，其中除了run phase是** task**，其余都是function，然后build phase和final phase都是自顶向下运行,其余都是自底向上运行。Run phase和12个小phase( reset phase、configure phase、main phase、shutdown phase）是并行运行的，有这12个小phase主要是进一步将run phase 中的事务划分到不同的phase进行，简化代码。注意，run phase和 12个小phase最好不要同时使用。从运行上来看，9个phase顺序执行，不同组件中的同一个phase执行有顺序，build phase为自顶向下，只有同一个phase全部执行完毕才会执行下一个phase。

-  所有的phase按照以下顺序自上而下自动执行：(九大phase,其中run phase又分为12个小phase)

- build_pase

- connect_phase

- end_of_elaboration_phase

- start_of_simulation_phase

- run_pase

- extract_phase

- check_phase

- report_phase

- final_phase

- 其中，run_phase按照以下顺序自上而下执行：

- pre_reset_phase

- reset_phase

- post_reset_phase

- pre_configure_phase

- configure_phase

- post_configure_phase

- pre_main_phase

- main_phase

- post_main_phase

- pre_shutdown_phase

- shutdown_phase

- post_shutdown_phase

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

-  UVM中有很多非常有趣的机制，例如factory机制，field_automation机制，phase机制，打印机制，sequence机制，config_db机制等，这些机制使得我们搭建的UVM能够有很好的可重用性和使得我们平台运行有秩序稳定。

-  例如phase机制，phase机制主要是使得UVM的运行仿真层次化，使得各种例化先后次序正确。UVM的phase机制主要有9个，外加12个小phase。主要的 phase有build phase、connect phase、run phase、report phase、final phase等，其中除了run phase是** task**，其余都是function，然后build phase和final phase都是自顶向下运行,其余都是自底向上运行。Run phase和12个小phase( reset phase、configure phase、main phase、shutdown phase）是并行运行的，有这12个小phase主要是进一步将run phase 中的事务划分到不同的phase进行，简化代码。注意，run phase和 12个小phase最好不要同时使用。从运行上来看，9个phase顺序执行，不同组件中的同一个phase执行有顺序，build phase为自顶向下，只有同一个phase全部执行完毕才会执行下一个phase。

-  所有的phase按照以下顺序自上而下自动执行：(九大phase,其中run phase又分为12个小phase)

- build_pase

- connect_phase

- end_of_elaboration_phase

- start_of_simulation_phase

- run_pase

- extract_phase

- check_phase

- report_phase

- final_phase

- 其中，run_phase按照以下顺序自上而下执行：

- pre_reset_phase

- reset_phase

- post_reset_phase

- pre_configure_phase

- configure_phase

- post_configure_phase

- pre_main_phase

- main_phase

- post_main_phase

- pre_shutdown_phase

- shutdown_phase

- post_shutdown_phase

</details>

---

📅 日期: ___/___  |  ⏱️ 用时: ___分钟  |  ✅ 掌握: ___/5  |  🔄 复习: ___次