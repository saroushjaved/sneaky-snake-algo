
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

assign a1 = A0 | A1;
assign O_1 = a1;
assign a2 = ~A1;
assign a3 = a2&&A2;
assign O_0 = A0 | a3;
assign a4 = A2 |A3;
assign Valid = a1 | a4 ;

endmodule 





















