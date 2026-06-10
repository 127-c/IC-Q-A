# Q60. 你了解uvm的factory机制和callback机制嘛

> 🏷️ UVM 进阶机制 | 📝 练习

---

## 🎯 题目

Q60. 你了解uvm的factory机制和callback机制嘛 

Factory机制也叫工厂机制，其存在的意义就是为了能够方便的替换TB中的实例或者已注册的类型。一般而言，在搭建完TB后，我们如果需要对TB进行更改配置或者相关的类信息，我们可以通过使用factory 机制进行覆盖，达到替换的效果，从而大大提高TB的可重用性和灵活性。要使用factory机制先要进行：
 
-  
将类注册到factory表中
 
-  
创建对象，使用对应的语句 （type_id::create）
 
-  
编写相应的类对基类进行覆盖。
 

Callback机制其作用是提高TB的可重用性,其还可进行特殊激励的产生等，与factory类似，两者可以有机结合使用。与factory不同之处在于 callback的类还是原先的类，只是内部的callback函数变了，而factory是产生一个新的扩展类进行替换。
 
-  
UVM组件中内嵌callback函数或者任务
 
-  
定义一个常见的uvm_callbacks class
 
-  
从UVM callback空壳类扩展uvm_callback类
 
-  
在验证环境中创建并登记uvm_callback

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

Q60. 你了解uvm的factory机制和callback机制嘛 

Factory机制也叫工厂机制，其存在的意义就是为了能够方便的替换TB中的实例或者已注册的类型。一般而言，在搭建完TB后，我们如果需要对TB进行更改配置或者相关的类信息，我们可以通过使用factory 机制进行覆盖，达到替换的效果，从而大大提高TB的可重用性和灵活性。要使用factory机制先要进行：
 
-  
将类注册到factory表中
 
-  
创建对象，使用对应的语句 （type_id::create）
 
-  
编写相应的类对基类进行覆盖。
 

Callback机制其作用是提高TB的可重用性,其还可进行特殊激励的产生等，与factory类似，两者可以有机结合使用。与factory不同之处在于 callback的类还是原先的类，只是内部的callback函数变了，而factory是产生一个新的扩展类进行替换。
 
-  
UVM组件中内嵌callback函数或者任务
 
-  
定义一个常见的uvm_callbacks class
 
-  
从UVM callback空壳类扩展uvm_callback类
 
-  
在验证环境中创建并登记uvm_callback

</details>

---

📅 日期: ___/___  |  ⏱️ 用时: ___分钟  |  ✅ 掌握: ___/5  |  🔄 复习: ___次