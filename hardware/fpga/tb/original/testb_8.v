

module LZC_testbench_8();
	
	reg A0,A1,A2,A3,A4,A5,A6,A7;
	wire Valid, Z0, Z1, Z2;
	
	leading_zero_8 test2(A0,A1,A2,A3,A4, A5, A6, A7, Z0, Z1, Z2, Valid);
	initial 
		begin
		A0 = 1'b0; A1= 1'b0; A2=1'b0; A3 =1'b0; A4 = 1'b0; A5= 1'b0; A6=1'b0; A7 =1'b0;
		#10;
		A0 = 1'b0; A1= 1'b0; A2=1'b0; A3 =1'b0; A4 = 1'b0; A5= 1'b0; A6=1'b0; A7 =1'b0;
		$monitor("%b %b %b %b", Z0, Z1, Z2,  Valid);
		
		#20;
		A0 = 1'b0; A1= 1'b0; A2=1'b0; A3 =1'b1; A4 = 1'b0; A5= 1'b1; A6=1'b0; A7 =1'b0;
		$monitor("%b %b %b %b", Z0, Z1, Z2,  Valid);
		
		#30;
		A0 = 1'b0; A1= 1'b0; A2=1'b0; A3 =1'b0; A4 = 1'b1; A5= 1'b0; A6=1'b0; A7 =1'b0;
		$monitor("%b %b %b %b", Z0, Z1, Z2,  Valid);
		
		#40;
		A0 = 1'b0; A1= 1'b0; A2=1'b1; A3 =1'b0; A4 = 1'b0; A5= 1'b0; A6=1'b0; A7 =1'b0;
		$monitor("%b %b %b %b", Z0, Z1, Z2,  Valid);
		
		
		
		
		
		
		end 
	
endmodule 
		