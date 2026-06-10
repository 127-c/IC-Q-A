//=============================================================
// Q10_练习：UVM启动流程 + 接口传递 (config_db)
// 难度: ⭐⭐ | 目标: 理解run_test和config_db set时序
//=============================================================

`include "uvm_macros.svh"
import uvm_pkg::*;

interface dut_if(input bit clk);
  logic [7:0] data;
  logic       valid;
endinterface

class my_test extends uvm_test;
  `uvm_component_utils(my_test)
  function new(string name, uvm_component parent); super.new(name, parent); endfunction
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    $display("[TEST] Hello UVM!");
    #100;
    phase.drop_objection(this);
  endtask
endclass

module tb_q10_uvm_start;
  bit clk;
  always #5 clk = ~clk;
  dut_if vif(clk);

  initial begin
    // TODO 1: 在 run_test 之前, 用 config_db set 传递 virtual interface
    // 参数: context, inst_path, field_name, value
    // TODO: 在此处写你的代码
    // 【参考答案】uvm_config_db #(virtual dut_if)::set(uvm_root::get(), "*", "vif", vif);

    // TODO 2: 启动UVM
    // TODO: 在此处写你的代码
    // 【参考答案】run_test("my_test");
  end
endmodule
