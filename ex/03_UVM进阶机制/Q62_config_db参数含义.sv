//=============================================================
// Q62_练习：uvm_config_db 四个参数的含义
// 难度: ⭐⭐ | 目标: 理解set/get的四个参数
//=============================================================
// uvm_config_db #(T)::set( context, inst_path, field_name, value );
//                           ①        ②           ③         ④
// ① context   : 父级上下文 (null=全局, uvm_root::get(), this=当前)
// ② inst_path : 目标路径 (""=当前, "*"=通配, "env.agt.drv"=精确)
// ③ field_name: 字段名 (set和get必须一致)
// ④ value     : 实际值

`include "uvm_macros.svh"
import uvm_pkg::*;

interface my_if(input bit clk); logic [7:0] data; endinterface

class my_config extends uvm_object;
  `uvm_object_utils(my_config)
  int  baud_rate;
  string parity;
  function new(string name="my_config"); super.new(name); endfunction
endclass

class my_driver extends uvm_driver #(uvm_sequence_item);
  `uvm_component_utils(my_driver)
  virtual my_if vif;
  my_config cfg;

  function void build_phase(uvm_phase phase);
    // TODO 1: get virtual interface (4个参数各是什么?)
    // TODO: 在此处写你的代码
    // 【参考答案】if (!uvm_config_db #(virtual my_if)::get(this, "", "vif", vif))
    // 【参考答案】  `uvm_fatal("ERR", "vif not found")

    // TODO 2: get config object
    // TODO: 在此处写你的代码
    // 【参考答案】if (!uvm_config_db #(my_config)::get(this, "", "cfg", cfg))
    // 【参考答案】  `uvm_fatal("ERR", "cfg not found")

    `uvm_info("DRV", $sformatf("baud=%0d parity=%s", cfg.baud_rate, cfg.parity), UVM_LOW)
  endfunction
endclass

class my_test extends uvm_test;
  `uvm_component_utils(my_test)
  my_driver drv;
  function void build_phase(uvm_phase phase);
    my_config cfg = my_config::type_id::create("cfg");
    cfg.baud_rate = 115200; cfg.parity = "ODD";
    // TODO 3: set config object 到 driver
    // TODO: 在此处写你的代码
    // 【参考答案】uvm_config_db #(my_config)::set(this, "drv", "cfg", cfg);
    drv = my_driver::type_id::create("drv", this);
  endfunction
endclass
