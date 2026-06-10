//=============================================================
// Q05_练习：Interface 和 Clocking Block
// 难度: ⭐⭐ | 目标: 定义interface,理解clocking block避免竞争
//=============================================================

//----------------------------------------------------------
// TODO 1: 定义一个带 clocking block 的总线 interface
//   clocking block: output=驱动侧, input=监测侧
//   input skew: 采样提前 (如 #1step)
//   output skew: 驱动落后 (如 #1)
//----------------------------------------------------------
interface bus_if(input bit clk, input bit rst_n);
  logic [7:0] data;
  logic       valid;
  logic       ready;

  // TODO: 填写 drv_cb — output: data, valid; input: ready
  // 【参考答案】clocking drv_cb @(posedge clk);
  // 【参考答案】  output data, valid;
  // 【参考答案】  input  ready;
  // 【参考答案】endclocking

  // TODO: 填写 mon_cb — 全部为 input
  // 【参考答案】clocking mon_cb @(posedge clk);
  // 【参考答案】  input data, valid, ready;
  // 【参考答案】endclocking

  modport drv(clocking drv_cb, input clk, rst_n);
  modport mon(clocking mon_cb, input clk, rst_n);
endinterface


module dut(bus_if.drv bus);
  always_ff @(posedge bus.clk or negedge bus.rst_n) begin
    if (!bus.rst_n) bus.ready <= 0;
    else bus.ready <= bus.valid;
  end
endmodule

module tb_q05_interface;
  bit clk, rst_n;
  always #5 clk = ~clk;
  bus_if vif(clk, rst_n);
  dut u_dut(vif.drv);

  initial begin
    rst_n = 0; #20; rst_n = 1;
    @(vif.drv_cb);
    // TODO: 使用clocking block驱动信号
    // 【参考答案】vif.drv_cb.data  <= 8'hAA;
    // 【参考答案】vif.drv_cb.valid <= 1'b1;
    @(vif.drv_cb);
    // 【参考答案】vif.drv_cb.valid <= 1'b0;
    #30; $finish;
  end
endmodule
