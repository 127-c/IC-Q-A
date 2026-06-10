//=============================================================
// Q84_练习：两个 config_db set 哪个有效?
// 难度: ⭐⭐ | 目标: 理解config_db的优先级规则
//=============================================================

`include "uvm_macros.svh"
import uvm_pkg::*;

// =============================================================
// config_db 优先级规则:
// 1. 层次越高, 优先级越高 (top > test > env > agent > driver)
// 2. 同层次, 时间越靠后, 优先级越高 (后set覆盖前set)
// 3. 路径越精确, 优先级越高 ("env.agt" > "*")
// =============================================================


// 场景演示:
// - 在 module top 中 set timeout=100 (更高层次)
// - 在 test 中 set timeout=200 (更低层次但时间更晚)
// - 在 driver 中 get timeout — 结果是?

class my_driver extends uvm_driver #(uvm_sequence_item);
  `uvm_component_utils(my_driver)

  function void build_phase(uvm_phase phase);
    int timeout;
    // TODO: get 获取timeout
    uvm_config_db #(int)::get(this, "", "timeout", timeout);
    `uvm_info("DRV", $sformatf("GOT timeout = %0d", timeout), UVM_LOW)
    // 问题: 输出是100还是200?
    // 答案: 100 — 因为top层次更高!
  endfunction
endclass


class my_test extends uvm_test;
  `uvm_component_utils(my_test)
  my_driver drv;

  function void build_phase(uvm_phase phase);
    // test层 set timeout=200
    uvm_config_db #(int)::set(this, "*", "timeout", 200);
    drv = my_driver::type_id::create("drv", this);
  endfunction
endclass


// top module
module tb_q84_config_priority;
  import uvm_pkg::*;

  initial begin
    // 在 run_test 之前 set: 层次最高
    uvm_config_db #(int)::set(uvm_root::get(), "*", "timeout", 100);
    run_test("my_test");
  end
endmodule

// TODO: 思考 — 如果 top 的set在 run_test之后呢?
// TODO: 如果路径分别写成 "*.drv" 和 "*" 呢?
