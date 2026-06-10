//=============================================================
// Q10_练习：UVM 启动流程 + 接口传递 (run_test + config_db)
// 难度: ⭐⭐ | 目标: 理解UVM的启动和接口传递机制
//=============================================================

// === 文件: top.sv ===
`include "uvm_macros.svh"
import uvm_pkg::*;

// step 1: 定义 interface
interface dut_if(input bit clk);
  logic [7:0] data;
  logic       valid;
endinterface

// step 2: 写一个最小的 test
class my_test extends uvm_test;
  `uvm_component_utils(my_test)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    $display("[TEST] Hello UVM!");
    #100;
    phase.drop_objection(this);
  endtask
endclass

// step 3: top模块
module tb_q10_uvm_start;
  bit clk;
  always #5 clk = ~clk;
  dut_if vif(clk);

  initial begin
    // TODO 1: 在 run_test 之前，用 config_db set 传递 virtual interface
    uvm_config_db #(virtual dut_if)::set(
      uvm_root::get(),  // context
      "*",              // inst_path
      "vif",            // field name
      vif               // value
    );

    // TODO 2: 启动 UVM
    run_test("my_test");
  end
endmodule
