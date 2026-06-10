//=============================================================
// Q11_练习：uvm_config_db 的三种传递方式
// 难度: ⭐⭐ | 目标: 掌握virtual interface/变量/config_object的传递
//=============================================================

`include "uvm_macros.svh"
import uvm_pkg::*;

interface bus_if(input bit clk);
  logic [7:0] addr, data;
endinterface

// 配置对象
class my_config extends uvm_object;
  `uvm_object_utils(my_config)
  int timeout;
  string mode;
  function new(string name="my_config"); super.new(name); endfunction
endclass

// Driver — 接收配置的组件
class my_driver extends uvm_driver #(uvm_sequence_item);
  `uvm_component_utils(my_driver)
  virtual bus_if vif;
  my_config cfg;

  function void build_phase(uvm_phase phase);
    // TODO 1: get virtual interface
    // TODO: 在此处写你的代码
    // 【参考答案】if (!uvm_config_db #(virtual bus_if)::get(this, "", "vif", vif))
    // 【参考答案】  `uvm_fatal("NOVIF", "Virtual interface not set!")

    // TODO 2: get config object
    // TODO: 在此处写你的代码
    // 【参考答案】if (!uvm_config_db #(my_config)::get(this, "", "cfg", cfg))
    // 【参考答案】  `uvm_fatal("NOCFG", "Config object not set!")

    `uvm_info("DRV", $sformatf("timeout=%0d mode=%s", cfg.timeout, cfg.mode), UVM_LOW)
  endfunction
endclass

class my_test extends uvm_test;
  `uvm_component_utils(my_test)
  my_driver drv;
  function void build_phase(uvm_phase phase);
    my_config cfg = my_config::type_id::create("cfg");
    cfg.timeout = 1000; cfg.mode = "FAST";
    // TODO 3: set config object
    // TODO: 在此处写你的代码
    // 【参考答案】uvm_config_db #(my_config)::set(this, "drv", "cfg", cfg);
    drv = my_driver::type_id::create("drv", this);
  endfunction
endclass
