module comp_3bit_tb();
	
	reg A0,A1,A2,B0,B1,B2,Valid_1,Valid_2;
	wire O_1, O_2, O_3, O_4;
	
	comp_3bit test3(A0,A1,A2,B0,B1,B2,Valid_1,Valid_2,O_1,O_2,O_3,O_4);
	initial 
		begin
		A0 = 1'b0; A1= 1'b0; A2=1'b0; B0 =1'b0; B1 = 1'b0; B2 = 1'b1; Valid_1 = 1; Valid_2 = 1;
		#10;
	        A0 = 1'b0; A1= 1'b0; A2=1'b0; B0 =1'b0; B1 = 1'b0; B2 = 1'b1; Valid_1 = 1; Valid_2 = 1;
		$monitor("%b %b %b %b", O_1, O_2, O_3, O_4);
		
		#20;
		A0 = 1'b1; A1= 1'b0; A2=1'b0; B0 =1'b0; B1 = 1'b0; B2 = 1'b1; Valid_1 = 1; Valid_2 = 1;
		$monitor("%b %b %b %b", O_1, O_2, O_3, O_4);
		
		#30;
		A0 = 1'b1; A1= 1'b1; A2=1'b0; B0 =1'b1; B1 = 1'b0; B2 = 1'b1; Valid_1 = 1; Valid_2 = 1;
		$monitor("%b %b %b %b", O_1, O_2, O_3, O_4);
		
		#40
		A0 = 1'b1; A1= 1'b1; A2=1'b0; B0 =1'b1; B1 = 1'b0; B2 = 1'b1; Valid_1 = 0; Valid_2 = 0;
		$monitor("%b %b %b %b", O_1, O_2, O_3, O_4);
		
		end 
	
endmodule 
	
