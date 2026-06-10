# Q18. 平台往里边输入数据的话怎么输入sequence， sequence，sequencer，driver之间的通信

> 🏷️ UVM 框架基础 | ⭐⭐⭐ 困难 | 💻 代码题
> 📂 配套练习文件: [`Q18_sequence_sequencer_driver通信.sv`](./Q18_sequence_sequencer_driver通信.sv)

---

## 🎯 题目

- 无论是sequence还是driver,它们通话的对象都是sequencer。当多个sequence试图要挂载到同一个sequencer上时，涉及sequencer的仲裁功能。

- 重点分析sequencer作为sequence与driver之间握手的桥梁，是如何扮演好这一角色的。

- 我们将抽取去这三个类的主要方法，利用时间箭头演示出完整的TLM通信过程。

- 对于sequence而言，无论是flat sequence还是hierarchical sequence，进一步切分的话，流向sequencer的 都是sequence item,所以就每个item的"成长周期”来看，它起始于reate_item()，继而通过start item（）尝试从sequencer获取可以通过的权限。

- 对于sequencer的仲裁机制和使用方法我们暂且略过，而driver一侧将一直处于"吃不饱”的状态，如果它没有了item可以使用，将调用get_next_item()来尝试从sequencer一侧获取item。

- 在sequencer将通过权限交给某一个底层的sequence前，目标sequence中的item应该完成随机化，继而在获取sequencer的通过权限后，执行finish_ item()。

- 接下来sequence中的item将穿过sequencer到达driver一侧， 这个重要节点标志着sequencer第一次充 当通信桥梁的角色已经完成。

- driver在得到新的item之后，会提取有效的数据信息，将其驱动到与DUT连接的接口上面。

- 在完成驱动后，driver应当通过item_done()来告知sequence已经完成数据传送，而sequence在 获取该消息后，则表示driver与sequence双方完成了这一次item的握手传输。

- 在这次传递中，driver可以选择将RSP作为状态返回值传递给sequence，而sequence也可以选择调用get_response(RSP)等待从driver一侧获取返回的数据对象。

在多个sequence同时向sequencer发送item时，需要有ID信息表明该item从哪个sequence来，ID信息在sequence创建item时就赋值了。

---

## 📋 TODO 清单

- [ ] 理解题目核心概念，能用自己的语言解释
- [ ] 写出简洁的要点答案
- [ ] 打开 `.sv` 文件，完成所有 `// TODO:` 标记的代码
- [ ] 尝试编译/仿真验证你的代码
- [ ] 列出面试中可能的追问

---

## 💻 代码练习

> 请打开 [`Q18_sequence_sequencer_driver通信.sv`](./Q18_sequence_sequencer_driver通信.sv) 完成代码 TODO，然后回到这里查看答案。

---

## 💡 提示
- 回想UVM类库继承层次: uvm_object → uvm_component
- factory核心: 注册→创建→覆盖

---

## ✅ 参考答案

<details>
<summary>点击展开完整答案</summary>

- 无论是sequence还是driver,它们通话的对象都是sequencer。当多个sequence试图要挂载到同一个sequencer上时，涉及sequencer的仲裁功能。

- 重点分析sequencer作为sequence与driver之间握手的桥梁，是如何扮演好这一角色的。

- 我们将抽取去这三个类的主要方法，利用时间箭头演示出完整的TLM通信过程。

- 对于sequence而言，无论是flat sequence还是hierarchical sequence，进一步切分的话，流向sequencer的 都是sequence item,所以就每个item的"成长周期”来看，它起始于reate_item()，继而通过start item（）尝试从sequencer获取可以通过的权限。

- 对于sequencer的仲裁机制和使用方法我们暂且略过，而driver一侧将一直处于"吃不饱”的状态，如果它没有了item可以使用，将调用get_next_item()来尝试从sequencer一侧获取item。

- 在sequencer将通过权限交给某一个底层的sequence前，目标sequence中的item应该完成随机化，继而在获取sequencer的通过权限后，执行finish_ item()。

- 接下来sequence中的item将穿过sequencer到达driver一侧， 这个重要节点标志着sequencer第一次充 当通信桥梁的角色已经完成。

- driver在得到新的item之后，会提取有效的数据信息，将其驱动到与DUT连接的接口上面。

- 在完成驱动后，driver应当通过item_done()来告知sequence已经完成数据传送，而sequence在 获取该消息后，则表示driver与sequence双方完成了这一次item的握手传输。

- 在这次传递中，driver可以选择将RSP作为状态返回值传递给sequence，而sequence也可以选择调用get_response(RSP)等待从driver一侧获取返回的数据对象。

在多个sequence同时向sequencer发送item时，需要有ID信息表明该item从哪个sequence来，ID信息在sequence创建item时就赋值了。

</details>

---

📅 日期: ___/___  |  ⏱️ 用时: ___分钟  |  ✅ 掌握: ___/5  |  🔄 复习: ___次