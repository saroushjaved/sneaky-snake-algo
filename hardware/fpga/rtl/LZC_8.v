module leading_zero_8(
input A0,A1,A2,A3,A4,A5,A6,A7,
output Z0,Z1,Z2, Valid
);

wire a1;
wire a2;
wire a3;
wire a4;
wire a5;
wire a6;
wire a7;
wire a8;
wire a9;
wire a10;
wire a11;
wire a12;


leading_zero_4bit inst1(
.A0(A0), .A1(A1), .A2(A2), .A3(A3), .O_0(a1), .O_1(a2), .Valid(a3));

leading_zero_4bit inst2(
.A0(A4), .A1(A5), .A2(A6), .A3(A7), .O_0(a4), .O_1(a5), .Valid(a6));

assign a7 = ~a3;
assign Z2 = a7;

assign a8 = ~a6;

assign a9 = a4&&a7;
assign a10 = a5&&a7;

assign a11 = a1 | a9;
assign a12 = a2 | a10;
assign Z0 = ~a11;
assign Z1 = ~a12;
assign Valid = a3 | a6;

endmodule 