module comp_3bit(A0,A1,A2,B0,B1,B2,Valid_1,Valid_2,O_1,O_2,O_3,O_4);
input Valid_1, Valid_2, A0, A1, A2, B0, B1, B2;
output reg O_1, O_2, O_3, O_4;

always @*
	begin
	if (Valid_1 & Valid_2)
	begin
	O_4 = 1;
	if ({B2,B1,B0} > {A2,A1,A0})
	{O_3, O_2, O_1} = {B2, B1, B0};
	else
	{O_3, O_2, O_1} = {A2, A1, A0};
	end
	else
	{O_4, O_3, O_2, O_1} = 4'b0000;
end
endmodule


