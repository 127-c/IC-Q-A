# Q72. AMBA总线中AHB/APB/AXI协议的区别

> 🏷️ AMBA 总线协议 | ⭐⭐⭐ 困难 | 💻 代码题

---

## 🎯 题目

AHB(Advanced High-performance Bus)高级高性能总线。APB(Advanced Peripheral Bus)高级外围总线AXI (Advanced eXtensible Interface)高级可拓展接口

-  AHB主要是针对高效率、高频宽及快速系统模块所设计的总线，它可以连接如微处理器、芯片上或芯片外的内存模块和DMA等高效率模块。

-  APB主要用在低速且低功率的外围，可针对外围设备作功率消耗及复杂接口的最佳化。APB在AHB和低带宽的外围设备之间提供了通信的桥梁，所以APB是AHB的二级拓展总线。

-  AXI高速度、高带宽，管道化互联，单向通道，只需要首地址，读写并行，支持乱序，支持非对齐操作，有效支持初始延迟较高的外设，连线非常多。

AHB协议

1. AHB的组成

-  Master:能够发起读写操作，提供地址和控制信号，同一时间只有1个Master会被激活。

-  Slave:在给定的地址范围内对读写操作作响应，并对Master返回成功、失败或者等待状态。

-  Arbiter:负责保证总线上一次只有1个Master在工作。仲裁协议是规定的，但是仲裁算法可以根据应用决定。

-  Decoder:负责对地址进行解码，并提供片选信号到各Slave。每个AHB都需要1个仲裁器和1个中央解码器。

2. AHB基本信号(经常会问Htrans和Hburst，以及AHB的边界地址怎么确定

-  HADDR:32位系统地址总线。

-  HTRANS:M指示传输状态，NONSEQ、SEQ、IDLE、BUSY。

-  HWRITE:传输方向1-写，0-读。

-  HSIZE:传输单位。

-  HBURST:传输的burst类型，SINGLE、INCR、WRAP4、INCR4等。

-  HWDATA:写数据总线，从M写到S。

-  HREADY:S应答M是否读写操作传输完成，1-传输完成，0-需延长传输周期。

-  HRESP:S应答当前传输状态，OKAY、ERROR、RETRY、SPLIT。

-  HRDATA:读数据总线，从S读到M。

APB协议及读写操作：

1. APB的状态转移

2. APB写操作

3. APB读操作

---

## 📋 TODO 清单

- [ ] 理解题目核心概念，能用自己的语言解释
- [ ] 写出简洁的要点答案
- [ ] 打开 `.sv` 文件，完成所有 `// TODO:` 标记的代码
- [ ] 尝试编译/仿真验证你的代码
- [ ] 列出面试中可能的追问

---

## 💡 提示
- 从性能、通道数、突发支持三个维度对比
- 理解AHB pipeline和AXI outstanding

---

## ✅ 参考答案

<details>
<summary>点击展开完整答案</summary>

AHB(Advanced High-performance Bus)高级高性能总线。APB(Advanced Peripheral Bus)高级外围总线AXI (Advanced eXtensible Interface)高级可拓展接口

-  AHB主要是针对高效率、高频宽及快速系统模块所设计的总线，它可以连接如微处理器、芯片上或芯片外的内存模块和DMA等高效率模块。

-  APB主要用在低速且低功率的外围，可针对外围设备作功率消耗及复杂接口的最佳化。APB在AHB和低带宽的外围设备之间提供了通信的桥梁，所以APB是AHB的二级拓展总线。

-  AXI高速度、高带宽，管道化互联，单向通道，只需要首地址，读写并行，支持乱序，支持非对齐操作，有效支持初始延迟较高的外设，连线非常多。

AHB协议

1. AHB的组成

-  Master:能够发起读写操作，提供地址和控制信号，同一时间只有1个Master会被激活。

-  Slave:在给定的地址范围内对读写操作作响应，并对Master返回成功、失败或者等待状态。

-  Arbiter:负责保证总线上一次只有1个Master在工作。仲裁协议是规定的，但是仲裁算法可以根据应用决定。

-  Decoder:负责对地址进行解码，并提供片选信号到各Slave。每个AHB都需要1个仲裁器和1个中央解码器。

2. AHB基本信号(经常会问Htrans和Hburst，以及AHB的边界地址怎么确定

-  HADDR:32位系统地址总线。

-  HTRANS:M指示传输状态，NONSEQ、SEQ、IDLE、BUSY。

-  HWRITE:传输方向1-写，0-读。

-  HSIZE:传输单位。

-  HBURST:传输的burst类型，SINGLE、INCR、WRAP4、INCR4等。

-  HWDATA:写数据总线，从M写到S。

-  HREADY:S应答M是否读写操作传输完成，1-传输完成，0-需延长传输周期。

-  HRESP:S应答当前传输状态，OKAY、ERROR、RETRY、SPLIT。

-  HRDATA:读数据总线，从S读到M。

APB协议及读写操作：

1. APB的状态转移

2. APB写操作

3. APB读操作

</details>

---

📅 日期: ___/___  |  ⏱️ 用时: ___分钟  |  ✅ 掌握: ___/5  |  🔄 复习: ___次