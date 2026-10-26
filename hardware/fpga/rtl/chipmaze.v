module ChipMaze #(parameter LENGTH = 16)
(
input clk,
input [0:LENGTH-1] dna_read, dna_ref,
output reg [0:(LENGTH/2)-1] dna_main, dna_up_1, dna_up_2 , dna_up_3, dna_up_4, dna_up_5, dna_down_1,
dna_down_2,dna_down_3,dna_down_4,dna_down_5 );

reg[0:LENGTH-1] DNA_1, DNA_2, DNA_3, DNA_4, DNA_5, DNA_6, DNA_7, DNA_8, DNA_9, DNA_10, DNA_11;
integer index, i;

always@(posedge clk)
	begin 
	DNA_1 = dna_ref ^ dna_read;
	index = 0;
	for(i=0; i<LENGTH; i=i+2)
		begin 
		if(DNA_1[i] || DNA_1[i+1])
			dna_main[index] = 1'b1;
		else
			dna_main[index] = 1'b0;
		index = index + 1;
		end 
		
	
	DNA_2 = dna_ref ^ (dna_read<<2);
	index = 0;
	for(i=0; i<LENGTH; i=i+2)
		begin 
		if(DNA_2[i] || DNA_2[i+1])
			dna_up_1[index] = 1'b1;
		else
			dna_up_1[index] = 1'b0;
		index = index + 1;
		end 
	dna_up_1[(LENGTH/2)-1] = 1'b1;
	
	
	DNA_3 = dna_ref ^ (dna_read<<4);
	index = 0;
	for(i=0; i<LENGTH; i=i+2)
		begin 
		if(DNA_3[i] || DNA_3[i+1])
			dna_up_2[index] = 1'b1;
		else
			dna_up_2[index] = 1'b0;
		index = index + 1;
		end 
		
	dna_up_2[(LENGTH/2)-1] = 1'b1;
	dna_up_2[(LENGTH/2)-2] = 1'b1;
	
	DNA_4 = dna_ref ^ (dna_read<<6);
	index = 0;
	for(i=0; i<LENGTH; i=i+2)
		begin 
		if(DNA_4[i] || DNA_4[i+1])
			dna_up_3[index] = 1'b1;
		else
			dna_up_3[index] = 1'b0;
		index = index + 1;
		end 
	
	dna_up_3[(LENGTH/2)-1] = 1'b1;
	dna_up_3[(LENGTH/2)-2] = 1'b1;
	dna_up_3[(LENGTH/2)-3] = 1'b1;
	
	DNA_5 = dna_ref ^ (dna_read<<8);
	index = 0;
	for(i=0; i<LENGTH; i=i+2)
		begin 
		if(DNA_5[i] || DNA_5[i+1])
			dna_up_4[index] = 1'b1;
		else
			dna_up_4[index] = 1'b0;
		index = index + 1;
		end 
	
	dna_up_4[(LENGTH/2)-1] = 1'b1;
	dna_up_4[(LENGTH/2)-2] = 1'b1;
	dna_up_4[(LENGTH/2)-3] = 1'b1;
	dna_up_4[(LENGTH/2)-4] = 1'b1;
	
	DNA_6 = dna_ref ^ (dna_read<<10);
	index = 0;
	for(i=0; i<LENGTH; i=i+2)
		begin 
		if(DNA_6[i] || DNA_6[i+1])
			dna_up_5[index] = 1'b1;
		else
			dna_up_5[index] = 1'b0;
		index = index + 1;
		end 
		
	dna_up_5[(LENGTH/2)-1] = 1'b1;
	dna_up_5[(LENGTH/2)-2] = 1'b1;
	dna_up_5[(LENGTH/2)-3] = 1'b1;
	dna_up_5[(LENGTH/2)-4] = 1'b1;
	dna_up_5[(LENGTH/2)-5] = 1'b1;
	
	
	//LOWER ROWS
	
	DNA_7 = dna_ref ^ (dna_read>>2);
	index = 0;
	for(i=0; i<LENGTH; i=i+2)
		begin 
		if(DNA_7[i] || DNA_7[i+1])
			dna_down_1[index] = 1'b1;
		else
			dna_down_1[index] = 1'b0;
		index = index + 1;
		end 
	
	dna_down_1[0] = 1'b1;
	
	DNA_8 = dna_ref ^ (dna_read>>4);
	index = 0;
	for(i=0; i<LENGTH; i=i+2)
		begin 
		if(DNA_8[i] || DNA_8[i+1])
			dna_down_2[index] = 1'b1;
		else
			dna_down_2[index] = 1'b0;
		index = index + 1;
		end 
		
	dna_down_2[0] = 1'b1;
	dna_down_2[1] = 1'b1;
	
	DNA_9 = dna_ref ^ (dna_read>>6);
	index = 0;
	for(i=0; i<LENGTH; i=i+2)
		begin 
		if(DNA_9[i] || DNA_9[i+1])
			dna_down_3[index] = 1'b1;
		else
			dna_down_3[index] = 1'b0;
		index = index + 1;
		end 
	
	dna_down_3[0] = 1'b1;
	dna_down_3[1] = 1'b1;
	dna_down_3[2] = 1'b1;
	
	
	DNA_10 = dna_ref ^ (dna_read>>8);
	index = 0;
	for(i=0; i<LENGTH; i=i+2)
		begin 
		if(DNA_10[i] || DNA_10[i+1])
			dna_down_4[index] = 1'b1;
		else
			dna_down_4[index] = 1'b0;
		index = index + 1;
		end 
	
	dna_down_4[0] = 1'b1;
	dna_down_4[1] = 1'b1;
	dna_down_4[2] = 1'b1;
	dna_down_4[3] = 1'b1;
	
	DNA_11 = dna_ref ^ (dna_read>>10);
	index = 0;
	for(i=0; i<LENGTH; i=i+2)
		begin 
		if(DNA_11[i] || DNA_11[i+1])
			dna_down_5[index] = 1'b1;
		else
			dna_down_5[index] = 1'b0;
		index = index + 1;
		end
	
	dna_down_5[0] = 1'b1;
	dna_down_5[1] = 1'b1;
	dna_down_5[2] = 1'b1;
	dna_down_5[3] = 1'b1;
	dna_down_5[4] = 1'b1;
	
	end 
	

endmodule 
	
	
	
