
module eightsegsneakysnake_tb;

reg [0:3] SumIn;
reg [0:1] EditIn;
reg clk; 
reg [0:7] A, B, C, D, E, F, G, H, I ,J, K;  
wire  [0:7] Ao, Bo, Co, Do, Eo, Fo, Go, Ho, Io, Jo, Ko;
wire [0:3]SumOut;
wire [0:1]EditOut;
wire [0:1]Lives;


eightbitSneakySnake inst1(
SumIn,
EditIn,
clk, 
A, B, C, D, E, F, G, H, I ,J, K, 
Ao, Bo, Co, Do, Eo, Fo, Go, Ho, Io, Jo, Ko, 
SumOut, 
EditOut,
Lives );


initial 
	begin
	
	clk = 0;
	SumIn = 0;
	EditIn = 0;
	A = 8'b00011101;
	B = 8'b00110011;
	C = 8'b00001111;
	D = 8'b01001111;
	E = 8'b00110011;
	F = 8'b11011111;
	G = 8'b11011100;
	H = 8'b00111111;
	I = 8'b11000111;
	J = 8'b11111000;
	K = 8'b01111111; 	
	
	end 
	
	always #10 clk = ~clk;
	
endmodule 
	