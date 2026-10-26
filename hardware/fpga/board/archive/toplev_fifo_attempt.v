`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2023 11:17:33 PM
// Design Name: 
// Module Name: toplev
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module toplev(
input clk_in1_n, clk_in1_p, reset,
input [4:0] addra,
output Accepted, 
output reg [4:0] count
    );
  
wire [399:0] dout;
wire [0:99] dna_main, dna_up_1, dna_up_2, dna_up_3, dna_up_4, dna_up_5, dna_down_1, dna_down_2, dna_down_3, dna_down_4, dna_down_5;
wire clk;

  clk_wiz_0 inst3
   (
    // Clock out ports
    .clk_out1(clk),     // output clk_out1
   // Clock in ports
    .clk_in1_p(clk_in1_p),    // input clk_in1_p
    .clk_in1_n(clk_in1_n));
SneakySnake #(.LENGTH(200)) inst1(
clk,
dout[399:200], dout[199:0],
Accepted,
dna_main, dna_up_1, dna_up_2, dna_up_3, dna_up_4, dna_up_5, dna_down_1, dna_down_2, dna_down_3, dna_down_4, dna_down_5
); 


blk_mem_gen_0 inst2 (
  .clka(clk),    // input wire clka
  .addra(addra),  // input wire [3 : 0] addra
  .douta(dout)  // output wire [399 : 0] douta
);

reg prev_signal;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      count <= 0;
      prev_signal <= 0;
    end else begin
      if (Accepted && !prev_signal)
        count <= count + 1;
      prev_signal <= Accepted;
    end
  end

endmodule
