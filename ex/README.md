# IC验证面试88题 — 练习题库

> 来源: [CSDN-数字IC验证面试常问题88道](https://blog.csdn.net/weixin_42294124/article/details/123703812)
> 每题独立 `.md` 练习说明 + `.sv` 代码TODO文件（代码题）

## 🚀 使用方式

1. 进入对应分类文件夹
2. 打开 `.md` 文件，阅读题目和 TODO 清单
3. 打开配套 `.sv` 文件，完成 `// TODO:` 标记的代码
4. 尝试用 VCS/Questa/XCelium 编译仿真
5. 回到 `.md` 展开 `<details>` 查看参考答案
6. 标记完成日期和掌握程度

## 📊 分类总览

| 分类 | 题目数 | 代码题 | 路径 |
|------|--------|--------|------|
| SystemVerilog 基础 | 19 | 15 | [01_SV基础/](./01_SV基础/) |
| UVM 框架基础 | 12 | 6 | [02_UVM框架基础/](./02_UVM框架基础/) |
| UVM 进阶机制 | 19 | 9 | [03_UVM进阶机制/](./03_UVM进阶机制/) |
| 覆盖率 | 4 | 1 | [04_覆盖率/](./04_覆盖率/) |
| 断言 SVA | 6 | 5 | [05_断言/](./05_断言/) |
| 寄存器模型 RAL | 7 | 4 | [06_寄存器模型/](./06_寄存器模型/) |
| AMBA 总线协议 | 1 | 1 | [07_总线和协议/](./07_总线和协议/) |
| 验证流程与综合 | 20 | 6 | [08_验证流程与综合/](./08_验证流程与综合/) |

## 📋 完整题目索引

- [**Q01**](./01_SV基础/Q01_定宽数组动态数组关联数组队列.md) ⭐⭐ `代码` `[.sv]` — 定宽数组动态数组关联数组队列
- [**Q02**](./01_SV基础/Q02_fork_join用法差异.md) ⭐⭐ `代码` `[.sv]` — fork_join用法差异
- [**Q03**](./01_SV基础/Q03_多线程同步调度方法.md) ⭐⭐ `代码` `[.sv]` — 多线程同步调度方法
- [**Q04**](./01_SV基础/Q04_Task和function的区别.md) ⭐ `代码` `[.sv]` — Task和function的区别
- [**Q05**](./01_SV基础/Q05_interface和clocking_block.md) ⭐⭐ `代码` `[.sv]` — interface和clocking_block
- [**Q06**](./01_SV基础/Q06_面向对象特性.md) ⭐ `简答` — 面向对象特性
- [**Q07**](./02_UVM框架基础/Q07_UVM工厂机制.md) ⭐⭐ `代码` `[.sv]` — UVM工厂机制
- [**Q08**](./01_SV基础/Q08_interface的clock_blocking功能.md) ⭐⭐ `简答` — interface的clock_blocking功能
- [**Q09**](./01_SV基础/Q09_动态数组和关联数组区别.md) ⭐ `简答` — 动态数组和关联数组区别
- [**Q10**](./02_UVM框架基础/Q10_UVM启动和接口传递.md) ⭐⭐ `代码` `[.sv]` — UVM启动和接口传递
- [**Q11**](./02_UVM框架基础/Q11_uvm_config_db传递接口.md) ⭐⭐ `代码` `[.sv]` — uvm_config_db传递接口
- [**Q12**](./02_UVM框架基础/Q12_UVM的优势.md) ⭐ `简答` — UVM的优势
- [**Q13**](./01_SV基础/Q13_ref类型.md) ⭐ `简答` — ref类型
- [**Q14**](./02_UVM框架基础/Q14_component和object区别.md) ⭐⭐ `简答` — component和object区别
- [**Q15**](./02_UVM框架基础/Q15_UVM树形结构.md) ⭐ `简答` — UVM树形结构
- [**Q16**](./02_UVM框架基础/Q16_UVM验证环境组成.md) ⭐⭐ `代码` `[.sv]` — UVM验证环境组成
- [**Q17**](./02_UVM框架基础/Q17_virtual_sequencer和sequencer.md) ⭐⭐ `简答` — virtual_sequencer和sequencer
- [**Q18**](./02_UVM框架基础/Q18_sequence_sequencer_driver通信.md) ⭐⭐⭐ `代码` `[.sv]` — sequence_sequencer_driver通信
- [**Q19**](./04_覆盖率/Q19_代码功能断言覆盖率区别.md) ⭐⭐ `简答` — 代码功能断言覆盖率区别
- [**Q20**](./08_验证流程与综合/Q20_为什么选验证.md) ⭐ `简答` — 为什么选验证
- [**Q21**](./08_验证流程与综合/Q21_IC设计ASIC流程.md) ⭐⭐ `简答` — IC设计ASIC流程
- [**Q22**](./01_SV基础/Q22_find队列和find_index队列.md) ⭐ `代码` — find队列和find_index队列
- [**Q23**](./05_断言/Q23_写断言a高b高.md) ⭐⭐ `代码` `[.sv]` — 写断言a高b高
- [**Q24**](./05_断言/Q24_立即断言和并行断言.md) ⭐⭐ `简答` — 立即断言和并行断言
- [**Q25**](./08_验证流程与综合/Q25_形式验证.md) ⭐⭐ `简答` — 形式验证
- [**Q26**](./08_验证流程与综合/Q26_验证完备性.md) ⭐⭐ `简答` — 验证完备性
- [**Q27**](./02_UVM框架基础/Q27_启动sequence的方法.md) ⭐⭐ `代码` — 启动sequence的方法
- [**Q28**](./08_验证流程与综合/Q28_面向对象编程优势.md) ⭐ `简答` — 面向对象编程优势
- [**Q29**](./01_SV基础/Q29_事件的触发.md) ⭐ `代码` — 事件的触发
- [**Q30**](./01_SV基础/Q30_约束的几种形式.md) ⭐⭐ `代码` `[.sv]` — 约束的几种形式
- [**Q31**](./02_UVM框架基础/Q31_component和object继承.md) ⭐⭐ `简答` — component和object继承
- [**Q32**](./02_UVM框架基础/Q32_get_next_item和try_next_item.md) ⭐⭐ `简答` — get_next_item和try_next_item
- [**Q33**](./05_断言/Q33_断言and_intersect区别.md) ⭐⭐ `代码` `[.sv]` — 断言and_intersect区别
- [**Q34**](./01_SV基础/Q34_break_continue_return.md) ⭐ `代码` — break_continue_return
- [**Q35**](./01_SV基础/Q35_触发器和锁存器区别.md) ⭐⭐ `代码` `[.sv]` — 触发器和锁存器区别
- [**Q36**](./08_验证流程与综合/Q36_简单UVM验证平台.md) ⭐⭐⭐ `代码` — 简单UVM验证平台
- [**Q37**](./08_验证流程与综合/Q37_编写测试用例.md) ⭐⭐ `代码` — 编写测试用例
- [**Q38**](./08_验证流程与综合/Q38_测试用例自动执行.md) ⭐ `简答` — 测试用例自动执行
- [**Q39**](./05_断言/Q39_断言past用法.md) ⭐⭐ `代码` `[.sv]` — 断言past用法
- [**Q40**](./01_SV基础/Q40_如何关闭约束.md) ⭐ `代码` — 如何关闭约束
- [**Q41**](./01_SV基础/Q41_队列使用方法.md) ⭐ `代码` — 队列使用方法
- [**Q42**](./01_SV基础/Q42_rand和randc区别.md) ⭐ `代码` `[.sv]` — rand和randc区别
- [**Q43**](./08_验证流程与综合/Q43_组件通信机制analysis_port.md) ⭐⭐⭐ `代码` — 组件通信机制analysis_port
- [**Q44**](./01_SV基础/Q44_深拷贝和浅拷贝.md) ⭐⭐ `代码` `[.sv]` — 深拷贝和浅拷贝
- [**Q45**](./01_SV基础/Q45_public_protected_local.md) ⭐ `代码` `[.sv]` — public_protected_local
- [**Q46**](./03_UVM进阶机制/Q46_UVM验证方法学理解.md) ⭐⭐⭐ `简答` — UVM验证方法学理解
- [**Q47**](./03_UVM进阶机制/Q47_验证环境结构组件关系.md) ⭐⭐ `代码` — 验证环境结构组件关系
- [**Q48**](./03_UVM进阶机制/Q48_phase机制详解.md) ⭐⭐⭐ `代码` — phase机制详解
- [**Q49**](./03_UVM进阶机制/Q49_phase_domain概念.md) ⭐⭐ `简答` — phase_domain概念
- [**Q50**](./03_UVM进阶机制/Q50_run_phase和main_phase关系.md) ⭐⭐ `简答` — run_phase和main_phase关系
- [**Q51**](./03_UVM进阶机制/Q51_main_phase跳转reset_phase.md) ⭐⭐⭐ `代码` — main_phase跳转reset_phase
- [**Q52**](./03_UVM进阶机制/Q52_TLM接口分类和用法.md) ⭐⭐⭐ `代码` — TLM接口分类和用法
- [**Q53**](./03_UVM进阶机制/Q53_analysis_port连接.md) ⭐⭐ `简答` — analysis_port连接
- [**Q54**](./03_UVM进阶机制/Q54_sequence和item分类.md) ⭐⭐ `简答` — sequence和item分类
- [**Q55**](./03_UVM进阶机制/Q55_sequence和sequencer关系.md) ⭐⭐ `简答` — sequence和sequencer关系
- [**Q56**](./03_UVM进阶机制/Q56_sequencer仲裁和锁定机制.md) ⭐⭐⭐ `代码` `[.sv]` — sequencer仲裁和锁定机制
- [**Q57**](./03_UVM进阶机制/Q57_virtual_sequence含义.md) ⭐⭐ `简答` — virtual_sequence含义
- [**Q58**](./03_UVM进阶机制/Q58_sequence_sequencer_driver分开好处.md) ⭐⭐ `简答` — sequence_sequencer_driver分开好处
- [**Q59**](./03_UVM进阶机制/Q59_driver中使用interface.md) ⭐⭐ `代码` — driver中使用interface
- [**Q60**](./03_UVM进阶机制/Q60_factory和callback机制.md) ⭐⭐ `代码` — factory和callback机制
- [**Q61**](./03_UVM进阶机制/Q61_field_automation和objection.md) ⭐⭐ `简答` — field_automation和objection
- [**Q62**](./03_UVM进阶机制/Q62_config_db参数含义.md) ⭐⭐ `代码` `[.sv]` — config_db参数含义
- [**Q63**](./03_UVM进阶机制/Q63_component组织运行调度.md) ⭐⭐ `简答` — component组织运行调度
- [**Q64**](./03_UVM进阶机制/Q64_UVM启动sequence方法.md) ⭐⭐ `代码` — UVM启动sequence方法
- [**Q65**](./06_寄存器模型/Q65_为什么要用RAL.md) ⭐⭐⭐ `简答` — 为什么要用RAL
- [**Q66**](./06_寄存器模型/Q66_前门访问和后门访问区别.md) ⭐⭐ `代码` — 前门访问和后门访问区别
- [**Q67**](./06_寄存器模型/Q67_后门访问路径配置.md) ⭐⭐⭐ `代码` — 后门访问路径配置
- [**Q68**](./06_寄存器模型/Q68_寄存器地址不匹配测试.md) ⭐⭐ `代码` — 寄存器地址不匹配测试
- [**Q69**](./06_寄存器模型/Q69_寄存器模型镜像值期望值.md) ⭐⭐ `简答` — 寄存器模型镜像值期望值
- [**Q70**](./06_寄存器模型/Q70_prediction自动和显式预测.md) ⭐⭐⭐ `简答` — prediction自动和显式预测
- [**Q71**](./06_寄存器模型/Q71_寄存器配置adapter集成.md) ⭐⭐ `代码` — 寄存器配置adapter集成
- [**Q72**](./07_总线和协议/Q72_AHB_APB_AXI协议区别.md) ⭐⭐⭐ `代码` — AHB_APB_AXI协议区别
- [**Q73**](./05_断言/Q73_assertion分类和用法.md) ⭐⭐ `代码` — assertion分类和用法
- [**Q74**](./05_断言/Q74_a重复操作符区别.md) ⭐⭐ `代码` `[.sv]` — a重复操作符区别
- [**Q75**](./04_覆盖率/Q75_项目考虑哪些coverage.md) ⭐⭐ `代码` `[.sv]` — 项目考虑哪些coverage
- [**Q76**](./04_覆盖率/Q76_condition未cover到怎么办.md) ⭐⭐ `简答` — condition未cover到怎么办
- [**Q77**](./04_覆盖率/Q77_function和code_coverage区别.md) ⭐⭐ `简答` — function和code_coverage区别
- [**Q78**](./08_验证流程与综合/Q78_验证流程怎么做.md) ⭐⭐ `简答` — 验证流程怎么做
- [**Q79**](./08_验证流程与综合/Q79_验证中碰到的难点.md) ⭐⭐ `简答` — 验证中碰到的难点
- [**Q80**](./08_验证流程与综合/Q80_发现过哪些bug.md) ⭐⭐ `简答` — 发现过哪些bug
- [**Q81**](./08_验证流程与综合/Q81_验证环境目录结构.md) ⭐ `简答` — 验证环境目录结构
- [**Q82**](./08_验证流程与综合/Q82_UVM优缺点.md) ⭐ `简答` — UVM优缺点
- [**Q83**](./08_验证流程与综合/Q83_工厂覆盖要求.md) ⭐⭐ `简答` — 工厂覆盖要求
- [**Q84**](./08_验证流程与综合/Q84_两个config_db哪个有效.md) ⭐⭐ `代码` `[.sv]` — 两个config_db哪个有效
- [**Q85**](./08_验证流程与综合/Q85_VIP怎么写.md) ⭐⭐⭐ `简答` — VIP怎么写
- [**Q86**](./08_验证流程与综合/Q86_验证流程和环境搭建.md) ⭐⭐⭐ `代码` `[.sv]` — 验证流程和环境搭建
- [**Q87**](./08_验证流程与综合/Q87_uvm_component_utils作用.md) ⭐ `简答` — uvm_component_utils作用
- [**Q88**](./08_验证流程与综合/Q88_TLM怎么用.md) ⭐⭐ `代码` `[.sv]` — TLM怎么用

## 📈 统计

| 总题数 | 简答题 | 代码题(含.sv) | 简单 | 中等 | 困难 |
|--------|--------|---------------|------|------|------|
| 88 | 41 | 47 | 19 | 55 | 14 |