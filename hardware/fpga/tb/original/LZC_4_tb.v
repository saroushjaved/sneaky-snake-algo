module LZC_testbench();
	
	reg A0,A1,A2,A3;
	wire Valid, P0, P1;
	
	leading_zero_4bit test1(A0,A1,A2,A3,P0,P1,Valid);
	initial 
		begin
		A0 = 1'b0; A1= 1'b0; A2=1'b0; A3 =1'b0; 
		#10;
		A0 = 1'b0; A1= 1'b0; A2=1'b0; A3 =1'b0;
		$monitor("%b %b %b", P0, P1, Valid);
		
		#20;
		A0 = 1'b0; A1= 1'b1; A2=1'b0; A3 =1'b0;
		$monitor("%b %b %b", P0, P1, Valid);
		
		#30;
		A0 = 1'b0; A1= 1'b0; A2=1'b1; A3 =1'b0;
		$monitor("%b %b %b", P0, P1, Valid);
		
		
		
		end 
	
endmodule 
		

	
	
	