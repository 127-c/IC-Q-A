# Q15. UVM的树形结构

> 🏷️ UVM 框架基础 | 📝 练习

---

## 🎯 题目


**题目**: 请画出UVM的树形结构。

UVM的树形结构是以 `uvm_root` 为根节点的层次化组件树：

```
uvm_root (uvm_top)
  └── uvm_test_top (my_test)
        └── env (my_env)
              ├── agent_in (my_agent)
              │     ├── sequencer
              │     ├── driver
              │     └── monitor
              ├── agent_out (my_agent)
              │     └── monitor
              ├── reference_model
              ├── scoreboard
              └── coverage_collector
```

**关键点**:
- 每个component在new时通过parent参数建立父子关系
- build_phase自顶向下构建树
- connect_phase自底向上连接
- uvm_top是全局唯一的根节点，在导入uvm_pkg时自动创建
- 只有uvm_component及其派生类才参与树形结构，uvm_object不参与


Q15. UVM的树形结构 

> 📷 [图片](https://i-blog.csdnimg.cn/blog_migrate/754038edf429c37321492278d6323db1.png)

---

## 📋 TODO 清单

- [ ] 理解题目核心概念，能用自己的语言解释
- [ ] 写出简洁的要点答案
- [ ] 结合项目经验举例说明
- [ ] 列出面试中可能的追问

---

## 💡 提示
- 回想UVM类库继承层次: uvm_object → uvm_component
- factory核心: 注册→创建→覆盖

---

## ✅ 参考答案

<details>
<summary>点击展开完整答案</summary>


**题目**: 请画出UVM的树形结构。

UVM的树形结构是以 `uvm_root` 为根节点的层次化组件树：

```
uvm_root (uvm_top)
  └── uvm_test_top (my_test)
        └── env (my_env)
              ├── agent_in (my_agent)
              │     ├── sequencer
              │     ├── driver
              │     └── monitor
              ├── agent_out (my_agent)
              │     └── monitor
              ├── reference_model
              ├── scoreboard
              └── coverage_collector
```

**关键点**:
- 每个component在new时通过parent参数建立父子关系
- build_phase自顶向下构建树
- connect_phase自底向上连接
- uvm_top是全局唯一的根节点，在导入uvm_pkg时自动创建
- 只有uvm_component及其派生类才参与树形结构，uvm_object不参与


Q15. UVM的树形结构 

> 📷 [图片](https://i-blog.csdnimg.cn/blog_migrate/754038edf429c37321492278d6323db1.png)

</details>

---

📅 日期: ___/___  |  ⏱️ 用时: ___分钟  |  ✅ 掌握: ___/5  |  🔄 复习: ___次