# Q14. 说一下component和object的区别，item是component还是object

> 🏷️ UVM 框架基础 | 📝 练习

---

## 🎯 题目

Q14.说一下component和object的区别，item是component还是object 

- UVM中component也是由object派生出来的，不过相比于object, component有很多其没有的属性，例如phase机制和树形结构等。在UVM中，不仅仅需要component这种较为复杂的类，进行TB的层次化搭建，也需要object这种基础类进行TB的事务搭建和一些环境配置等。
- Item是object

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

Q14.说一下component和object的区别，item是component还是object 

- UVM中component也是由object派生出来的，不过相比于object, component有很多其没有的属性，例如phase机制和树形结构等。在UVM中，不仅仅需要component这种较为复杂的类，进行TB的层次化搭建，也需要object这种基础类进行TB的事务搭建和一些环境配置等。
- Item是object

</details>

---

📅 日期: ___/___  |  ⏱️ 用时: ___分钟  |  ✅ 掌握: ___/5  |  🔄 复习: ___次