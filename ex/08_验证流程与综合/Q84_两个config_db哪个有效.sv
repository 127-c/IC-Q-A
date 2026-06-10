//=============================================================
// Q84_练习：两个 config_db set, 哪个生效?
// 难度: ⭐⭐ | 目标: 理解config_db的优先级规则
//
// 优先级规则:
// 1. 层次越高, 优先级越高: top > test > env > agent > driver
// 2. 同层次, 时间越靠后优先级越高: 后set覆盖前set
// 3. 路径越精确优先级越高: "env.agt" > "*"
//=============================================================

`include "uvm_macros.svh"
import uvm_pkg::*;

class my_driver extends uvm_driver #(uvm_sequence_item);
  `uvm_component_utils(my_driver)
  function void build_phase(uvm_phase phase);
    int timeout;
    // TODO: get 获取 timeout
    // 【参考答案】uvm_config_db #(int)::get(this, "", "timeout", timeout);
    `uvm_info("DRV", $sformatf("GOT timeout = %0d", timeout), UVM_LOW)
    // 问题: 输出是100还是200? 为什么?
    // 【参考答案】100 — top层set的优先级更高!
  endfunction
endclass

class my_test extends uvm_test;
  `uvm_component_utils(my_test)
  my_driver drv;
  function void build_phase(uvm_phase phase);
    // test层 set timeout=200 (层次更低)
    uvm_config_db #(int)::set(this, "*", "timeout", 200);
    drv = my_driver::type_id::create("drv", this);
  endfunction
endclass

module tb_q84_config_priority;
  import uvm_pkg::*;
  initial begin
    // top层 set timeout=100 (层次最高)
    uvm_config_db #(int)::set(uvm_root::get(), "*", "timeout", 100);
    run_test("my_test");
  end
endmodule
