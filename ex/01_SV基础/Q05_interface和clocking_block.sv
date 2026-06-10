//=============================================================
// Q05_练习：Interface 和 Clocking Block
// 难度: ⭐⭐ | 目标: 定义interface并理解clocking block避免竞争
//=============================================================

//----------------------------------------------------------
// TODO 1: 定义一个带 clocking block 的总线 interface
//----------------------------------------------------------
interface bus_if(input bit clk, input bit rst_n);
  logic [7:0] data;
  logic       valid;
  logic       ready;

  // TODO: 定义驱动clocking block (output: data, valid; input: ready)
  //   - output skew = 驱动落后时钟沿
  //   - input skew  = 采样提前时钟沿
  clocking drv_cb @(posedge clk);
    output data, valid;
    input  ready;
  endclocking

  // TODO: 定义监测clocking block (全部input)
  clocking mon_cb @(posedge clk);
    input data, valid, ready;
  endclocking

  // TODO: 定义 modport
  modport drv(clocking drv_cb, input clk, rst_n);
  modport mon(clocking mon_cb, input clk, rst_n);
endinterface


//----------------------------------------------------------
// TODO 2: 写DUT和简单的test
//----------------------------------------------------------
module dut(bus_if.drv bus);
  always_ff @(posedge bus.clk or negedge bus.rst_n) begin
    if (!bus.rst_n) begin
      bus.ready <= 1'b0;
    end else begin
      bus.ready <= bus.valid;
    end
  end
endmodule

module tb_q05_interface;
  bit clk, rst_n;
  always #5 clk = ~clk;

  bus_if vif(clk, rst_n);
  dut u_dut(vif.drv);

  initial begin
    rst_n = 0; #20; rst_n = 1;
    // TODO: 使用 clocking block 驱动信号
    @(vif.drv_cb);
    vif.drv_cb.data  <= 8'hAA;
    vif.drv_cb.valid <= 1'b1;
    @(vif.drv_cb);
    vif.drv_cb.valid <= 1'b0;
    #30;
    $finish;
  end
endmodule
