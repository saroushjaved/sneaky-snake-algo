
module longestescape_tb;

parameter LENGTH = 16;
reg clk;
reg [0:LENGTH-1] dna_read, dna_ref;
wire L0, L1, L2, L3;



longestescape #(.LENGTH(16)) inst1(clk, dna_read, dna_ref, L0, L1, L2, L3);

initial begin 

	clk = 0;
	dna_read = 16'b0010011011110001;
	dna_ref =  16'b0010011011101100;
	
	end
	
	always #10 clk = ~clk;

endmodule 

