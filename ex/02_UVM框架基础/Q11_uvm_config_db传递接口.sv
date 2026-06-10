//=============================================================
// Q11_练习：uvm_config_db 传递接口和配置
// 难度: ⭐⭐ | 目标: 掌握config_db的set/get三种用法
//=============================================================

`include "uvm_macros.svh"
import uvm_pkg::*;

// --- 接口 ---
interface bus_if(input bit clk);
  logic [7:0] addr;
  logic [7:0] data;
endinterface

// --- 配置对象 ---
class my_config extends uvm_object;
  `uvm_object_utils(my_config)
  int timeout;
  string mode;
  function new(string name="my_config");
    super.new(name);
  endfunction
endclass

// --- Driver (接收配置的组件) ---
class my_driver extends uvm_driver #(uvm_sequence_item);
  `uvm_component_utils(my_driver)
  virtual bus_if vif;
  my_config cfg;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // TODO 1: 用 config_db get 获取 virtual interface
    if (!uvm_config_db #(virtual bus_if)::get(this, "", "vif", vif))
      `uvm_fatal("NOVIF", "Virtual interface not set!")

    // TODO 2: 用 config_db get 获取配置对象
    if (!uvm_config_db #(my_config)::get(this, "", "cfg", cfg))
      `uvm_fatal("NOCFG", "Config object not set!")

    `uvm_info("DRV", $sformatf("timeout=%0d mode=%s", cfg.timeout, cfg.mode), UVM_LOW)
  endfunction
endclass


// --- Test 顶层 ---
class my_test extends uvm_test;
  `uvm_component_utils(my_test)
  my_driver drv;

  function void build_phase(uvm_phase phase);
    my_config cfg;

    // TODO 3: 创建并配置 config object, 用 config_db set 传递
    cfg = my_config::type_id::create("cfg");
    cfg.timeout = 1000;
    cfg.mode = "FAST";
    uvm_config_db #(my_config)::set(this, "drv", "cfg", cfg);

    drv = my_driver::type_id::create("drv", this);
  endfunction
endclass
