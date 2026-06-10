# Q64. UVM如何启动一个sequence

> 🏷️ UVM 进阶机制 | 📝 练习

---

## 🎯 题目

Q64. UVM如何启动一个sequence 

-  
启动sequence有很多的方法:常用的方法有使用default sequence进行调用，其会将对应的sequence 与 sequencer绑定，当dirver请求获得req时，sequencer就会调用对应的sequence去运行body函数，从而产生req。
 
-  
除此之外，还可以使用start函数进行，其参数主要就是对应的需要绑定的sequencer和该类的上层sequence。如此，就可以实现启动sequence的功能。
 
-  
注意:一般仿真开始结束会在sequence 中 raise objection和 drop objection

---

## 📋 TODO 清单

- [ ] 理解题目核心概念，能用自己的语言解释
- [ ] 写出简洁的要点答案
- [ ] 结合项目经验举例说明
- [ ] 列出面试中可能的追问

---

## 💡 提示
- 理解UVM设计哲学: 分离关注点、提高可重用性
- TLM是component间唯一的通信方式

---

## ✅ 参考答案

<details>
<summary>点击展开完整答案</summary>

Q64. UVM如何启动一个sequence 

-  
启动sequence有很多的方法:常用的方法有使用default sequence进行调用，其会将对应的sequence 与 sequencer绑定，当dirver请求获得req时，sequencer就会调用对应的sequence去运行body函数，从而产生req。
 
-  
除此之外，还可以使用start函数进行，其参数主要就是对应的需要绑定的sequencer和该类的上层sequence。如此，就可以实现启动sequence的功能。
 
-  
注意:一般仿真开始结束会在sequence 中 raise objection和 drop objection

</details>

---

📅 日期: ___/___  |  ⏱️ 用时: ___分钟  |  ✅ 掌握: ___/5  |  🔄 复习: ___次