`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2023 12:36:05 AM
// Design Name: 
// Module Name: top
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


module top#(parameter LENGTH = 200)(
    input clk_in1_p,clk_in1_n,reset,
    input [3:0] addra,
    output reg [2:0] count
    );
    
    wire [399:0] douta;
    wire clk;
    
  blk_mem_gen_0 inst1 (
  .clka(clk),    // input wire clka
  .addra(addra),  // input wire [3 : 0] addra
  .douta(douta)  // output wire [399 : 0] douta
);
  clk_wiz_0 inst3
   (
    // Clock out ports
    .clk_out1(clk),     // output clk_out1
   // Clock in ports
    .clk_in1_p(clk_in1_p),    // input clk_in1_p
    .clk_in1_n(clk_in1_n));    // input clk_in1_n


wire Accepted;   

wire [0:99] dna_main, dna_up_1, dna_up_2, dna_up_3, dna_up_4, dna_up_5, dna_down_1, dna_down_2, dna_down_3, dna_down_4, dna_down_5;
 
SneakySnake #(.LENGTH(200)) inst2(
clk,
douta[399:200], douta[199:0],
Accepted,
dna_main, dna_up_1, dna_up_2, dna_up_3, dna_up_4, dna_up_5, dna_down_1, dna_down_2, dna_down_3, dna_down_4, dna_down_5
); 

reg prev_wave;
  
always @(posedge clk or posedge reset) begin
    if (reset) begin
      count <= 0;
      prev_wave <= 0;
    end
    else begin
      if (Accepted && !prev_wave) begin
        count <= count + 1;
      end
      prev_wave <= Accepted;
    end
  end

endmodule
