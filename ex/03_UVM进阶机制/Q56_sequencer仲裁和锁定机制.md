# Q56. Sequencer的仲裁特性（set_arbitration）及锁定机制（lock和grab）

> 🏷️ UVM 进阶机制 | ⭐⭐⭐ 困难 | 💻 代码题
> 📂 配套练习文件: [`Q56_sequencer仲裁和锁定机制.sv`](./Q56_sequencer仲裁和锁定机制.sv)

---

## 🎯 题目

1、仲裁特性：

在实际使用中，我们可以通过

uvm, _sequencer:set _arbitration(UVM _SEQ ARB _TYPE val)函数来设置仲裁模式，

这里的仲裁模式UVM_ SEQ ARB. _TYPE有下面几种值可以选择:

- UVM_SEQ_ARB_FIFO: 默认模式。来自于sequences的发送请求， 按照FIFO先进先出的方式被依次授权，和优先级没有关系。

- UVM_SEQ_ARB_WEIGHTED: 不同sequence的发送请求， 将按照它们的优先级权重随机授权。

- UVM _SEQ_ARB_RANDOM: 不同的请求会被随机授权，而无视它们的抵达顺序和优先级。

- UVM_SEQ_ARB_STRICT_FIFO: 不同的请求，会按照它们的优先级以及抵达顺序来依次授权，因此与优先级和抵达时间都有关。

- UVM_SEQ_ARB_STRICT_RANDOM: 不同的请求，会按照它们的最高优先级随机授权，与抵达时间无关。

- UVM_SEQ_ARB_USER: 用户可以自定义仲故方法user. priority. ,arbitration0来裁定哪个sequence的请求被优先授权。

2、锁定机制

uvm_sequencer提供了两种锁定机制，分别通过lock()和grab()方法实现，这两种方法的区别在于:

- lock()与unlock()这一对方法可以为sequence提供排外的访问权限，但前提条件是，该sequence 首先需要按照sequencer的仲裁机制获得授权。而一旦sequence获得授权，则无需担心权限被收回，只有该sequence主动解锁(unlock)它的sequencer,才可以释放这一锁定的权限。lock()是一种阻塞任务，只有获得了权限，它才会返回。

- grab()与ungrab()也可以为sequence提供排外的访问权限，而且它只需要在sequencer下一次授权周期时就可以无条件地获得授权。与lock方法相比， grab方法无视同一时刻内发起传送请求的其它sequence，而唯一可以阻止它的只有已经预先获得授权的其它lock或者grab的sequence.

- 这里需要注意的是， 由于“解铃还须系铃人”，如果sequence使用 了lock()或者grab()方法，必须在sequence结束前调用unlock()或者ungrab()方法来释放权限，否则sequencer会进入死锁状态而无法继续为其余sequence授权。

---

## 📋 TODO 清单

- [ ] 理解题目核心概念，能用自己的语言解释
- [ ] 写出简洁的要点答案
- [ ] 打开 `.sv` 文件，完成所有 `// TODO:` 标记的代码
- [ ] 尝试编译/仿真验证你的代码
- [ ] 列出面试中可能的追问

---

## 💻 代码练习

> 请打开 [`Q56_sequencer仲裁和锁定机制.sv`](./Q56_sequencer仲裁和锁定机制.sv) 完成代码 TODO，然后回到这里查看答案。

---

## 💡 提示
- 理解UVM设计哲学: 分离关注点、提高可重用性
- TLM是component间唯一的通信方式

---

## ✅ 参考答案

<details>
<summary>点击展开完整答案</summary>

1、仲裁特性：

在实际使用中，我们可以通过

uvm, _sequencer:set _arbitration(UVM _SEQ ARB _TYPE val)函数来设置仲裁模式，

这里的仲裁模式UVM_ SEQ ARB. _TYPE有下面几种值可以选择:

- UVM_SEQ_ARB_FIFO: 默认模式。来自于sequences的发送请求， 按照FIFO先进先出的方式被依次授权，和优先级没有关系。

- UVM_SEQ_ARB_WEIGHTED: 不同sequence的发送请求， 将按照它们的优先级权重随机授权。

- UVM _SEQ_ARB_RANDOM: 不同的请求会被随机授权，而无视它们的抵达顺序和优先级。

- UVM_SEQ_ARB_STRICT_FIFO: 不同的请求，会按照它们的优先级以及抵达顺序来依次授权，因此与优先级和抵达时间都有关。

- UVM_SEQ_ARB_STRICT_RANDOM: 不同的请求，会按照它们的最高优先级随机授权，与抵达时间无关。

- UVM_SEQ_ARB_USER: 用户可以自定义仲故方法user. priority. ,arbitration0来裁定哪个sequence的请求被优先授权。

2、锁定机制

uvm_sequencer提供了两种锁定机制，分别通过lock()和grab()方法实现，这两种方法的区别在于:

- lock()与unlock()这一对方法可以为sequence提供排外的访问权限，但前提条件是，该sequence 首先需要按照sequencer的仲裁机制获得授权。而一旦sequence获得授权，则无需担心权限被收回，只有该sequence主动解锁(unlock)它的sequencer,才可以释放这一锁定的权限。lock()是一种阻塞任务，只有获得了权限，它才会返回。

- grab()与ungrab()也可以为sequence提供排外的访问权限，而且它只需要在sequencer下一次授权周期时就可以无条件地获得授权。与lock方法相比， grab方法无视同一时刻内发起传送请求的其它sequence，而唯一可以阻止它的只有已经预先获得授权的其它lock或者grab的sequence.

- 这里需要注意的是， 由于“解铃还须系铃人”，如果sequence使用 了lock()或者grab()方法，必须在sequence结束前调用unlock()或者ungrab()方法来释放权限，否则sequencer会进入死锁状态而无法继续为其余sequence授权。

</details>

---

📅 日期: ___/___  |  ⏱️ 用时: ___分钟  |  ✅ 掌握: ___/5  |  🔄 复习: ___次