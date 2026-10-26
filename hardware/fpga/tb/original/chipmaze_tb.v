
module chipmaze_tb;

parameter LENGTH = 16;
reg clk;
reg [0:LENGTH-1] dna_read, dna_ref;
wire [0:(LENGTH/2)-1] dna_main, dna_up_1, dna_up_2 , dna_up_3, dna_up_4, dna_up_5, dna_down_1,
dna_down_2,dna_down_3,dna_down_4,dna_down_5;


ChipMaze #(.LENGTH (16)) ins1(clk, dna_read, dna_ref, dna_main, dna_up_1, dna_up_2 , dna_up_3, dna_up_4, dna_up_5, dna_down_1,
dna_down_2,dna_down_3,dna_down_4,dna_down_5);





initial begin 

	clk = 0;
	dna_read = 16'b0010011011110001;
	dna_ref = 16'b0001001011110001;
	
	end
	
	always #10 clk = ~clk;

endmodule 
