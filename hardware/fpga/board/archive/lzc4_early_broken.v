`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2023 09:30:25 AM
// Design Name: 
// Module Name: leading_zero_4bit
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


module leading_zero_4bit(
    input A0,
    input A1,
    input A2,
    input A3,
    output O_0,
    output O_1,
    output Valid
    );

wire a1,a2,a3,a4;

assign a1 = A0 || A1;
assign O_1 = a1;
assign a2 = ~A1;
assign a3 = a2&&A2;
assign out = A0 || a3;
assign valid = a1 || (A2 || A3);

endmodule 



















