//=============================================================
// Q86_练习：验证流程与环境搭建
// 难度: ⭐⭐⭐ | 目标: 写出完整的验证环境目录和文件结构
//=============================================================

// =============================================================
// TODO: 画出你的验证环境目录结构
//
// project/
// ├── rtl/                 ← DUT RTL代码
// │   ├── alu.v
// │   └── fifo.v
// ├── tb/                  ← 验证环境
// │   ├── top.sv           ← 顶层, run_test()
// │   ├── interface.sv     ← 接口定义
// │   ├── my_pkg.sv        ← package, import所有文件
// │   ├── item.sv          ← transaction定义
// │   ├── sequence.sv      ← sequence
// │   ├── sequencer.sv     ← sequencer
// │   ├── driver.sv        ← driver
// │   ├── monitor.sv       ← monitor
// │   ├── agent.sv         ← agent(封装drv+mon+sqr)
// │   ├── model.sv         ← reference model
// │   ├── scoreboard.sv    ← checker
// │   ├── coverage.sv      ← coverage collector
// │   ├── env.sv           ← env(封装agent+model+scb)
// │   └── test.sv          ← test base class
// ├── tests/               ← 测试用例
// │   ├── test_smoke.sv
// │   └── test_full.sv
// ├── sim/                 ← 仿真目录
// │   └── Makefile
// └── scripts/             ← 脚本
//     └── regress.sh
// =============================================================


// TODO: 完成package文件
package my_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  `include "item.sv"
  `include "sequence.sv"
  `include "sequencer.sv"
  `include "driver.sv"
  `include "monitor.sv"
  `include "agent.sv"
  `include "model.sv"
  `include "scoreboard.sv"
  `include "coverage.sv"
  `include "env.sv"
  `include "test.sv"
endpackage


// TODO: 完成验证流程图
//
//  阅读Spec ──→ 制定验证计划 ──→ 搭建TB ──→ 编写case
//      ↑                                      ↓
//      └──── 总结报告 ←── 回归测试 ←── 分析覆盖率
