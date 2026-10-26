module longest_escape #(parameter LENGTH = 16)(
input [0:LENGTH-1] dna_read, dna_ref,
input clk,
output L0, L1, L2, L3
);


wire Valid_A, A0, A1, A2;
wire Valid_B, B0, B1, B2;
wire Valid_C, C0, C1, C2;
wire Valid_D, D0, D1, D2;
wire Valid_E, E0, E1, E2;
wire Valid_F, F0, F1, F2;
wire Valid_G, G0, G1, G2;
wire Valid_H, H0, H1, H2;
wire Valid_I, I0, I1, I2;
wire Valid_J, J0, J1, J2;
wire Valid_K, K0, K1, K2;

wire cout1a, cout1b, cout1c, cout1d;
wire cout2a, cout2b, cout2c, cout2d;
wire cout3a, cout3b, cout3c, cout3d;
wire cout4a, cout4b, cout4c, cout4d;
wire cout5a, cout5b, cout5c, cout5d;
wire cout6a, cout6b, cout6c, cout6d;

wire cout2_1a, cout2_1b, cout2_1c, cout2_1d;
wire cout2_2a, cout2_2b, cout2_2c, cout2_2d;
wire cout2_3a, cout2_3b, cout2_3c, cout2_3d;

wire cout3_1a, cout3_1b, cout3_1c, cout3_1d;
wire cout3_2a, cout3_2b, cout3_2c, cout3_2d;



wire [0:(LENGTH/2)-1] dna_main, dna_up_1, dna_up_2 , dna_up_3, dna_up_4, dna_up_5, dna_down_1,dna_down_2,dna_down_3,dna_down_4,dna_down_5;

ChipMaze #(.LENGTH(16)) ins1(clk, dna_read, dna_ref,dna_main, dna_up_1, dna_up_2 , dna_up_3, dna_up_4, dna_up_5, dna_down_1, dna_down_2,dna_down_3,dna_down_4,dna_down_5 );

leading_zero_8 lzc1( .A0(dna_main[0]),.A1(dna_main[1]),.A2(dna_main[2]),.A3(dna_main[3]),.A4(dna_main[4]),.A5(dna_main[5]),.A6(dna_main[6]),.A7(dna_main[7]), 
.Z0(A0),.Z1(A1),.Z2(A2), .Valid(Valid_A));

leading_zero_8 lzc2( .A0(dna_up_1[0]),.A1(dna_up_1[1]),.A2(dna_up_1[2]),.A3(dna_up_1[3]),.A4(dna_up_1[4]),.A5(dna_up_1[5]),.A6(dna_up_1[6]),.A7(dna_up_1[7]), 
.Z0(B0),.Z1(B1),.Z2(B2), .Valid(Valid_B));

leading_zero_8 lzc3( .A0(dna_up_2[0]),.A1(dna_up_2[1]),.A2(dna_up_2[2]),.A3(dna_up_2[3]),.A4(dna_up_2[4]),.A5(dna_up_2[5]),.A6(dna_up_2[6]),.A7(dna_up_2[7]), 
.Z0(C0),.Z1(C1),.Z2(C2), .Valid(Valid_C));

leading_zero_8 lzc4( .A0(dna_up_3[0]),.A1(dna_up_3[1]),.A2(dna_up_3[2]),.A3(dna_up_3[3]),.A4(dna_up_3[4]),.A5(dna_up_3[5]),.A6(dna_up_3[6]),.A7(dna_up_3[7]), 
.Z0(D0),.Z1(D1),.Z2(D2), .Valid(Valid_D));

leading_zero_8 lzc5( .A0(dna_up_4[0]),.A1(dna_up_4[1]),.A2(dna_up_4[2]),.A3(dna_up_4[3]),.A4(dna_up_4[4]),.A5(dna_up_4[5]),.A6(dna_up_4[6]),.A7(dna_up_4[7]), 
.Z0(E0),.Z1(E1),.Z2(E2), .Valid(Valid_E));

leading_zero_8 lzc6( .A0(dna_up_5[0]),.A1(dna_up_5[1]),.A2(dna_up_5[2]),.A3(dna_up_5[3]),.A4(dna_up_5[4]),.A5(dna_up_5[5]),.A6(dna_up_5[6]),.A7(dna_up_5[7]), 
.Z0(F0),.Z1(F1),.Z2(F2), .Valid(Valid_F));

leading_zero_8 lzc7( .A0(dna_down_1[0]),.A1(dna_down_1[1]),.A2(dna_down_1[2]),.A3(dna_down_1[3]),.A4(dna_down_1[4]),.A5(dna_down_1[5]),.A6(dna_down_1[6]),.A7(dna_down_1[7]), 
.Z0(G0),.Z1(G1),.Z2(G2), .Valid(Valid_G));

leading_zero_8 lzc8( .A0(dna_down_2[0]),.A1(dna_down_2[1]),.A2(dna_down_2[2]),.A3(dna_down_2[3]),.A4(dna_down_2[4]),.A5(dna_down_2[5]),.A6(dna_down_2[6]),.A7(dna_down_2[7]), 
.Z0(H0),.Z1(H1),.Z2(H2), .Valid(Valid_H));

leading_zero_8 lzc9( .A0(dna_down_3[0]),.A1(dna_down_3[1]),.A2(dna_down_3[2]),.A3(dna_down_3[3]),.A4(dna_down_3[4]),.A5(dna_down_3[5]),.A6(dna_down_3[6]),.A7(dna_down_3[7]), 
.Z0(I0),.Z1(I1),.Z2(I2), .Valid(Valid_I));

leading_zero_8 lzc10( .A0(dna_down_4[0]),.A1(dna_down_4[1]),.A2(dna_down_4[2]),.A3(dna_down_4[3]),.A4(dna_down_4[4]),.A5(dna_down_4[5]),.A6(dna_down_4[6]),.A7(dna_down_4[7]), 
.Z0(J0),.Z1(J1),.Z2(J2), .Valid(Valid_J));

leading_zero_8 lzc11( .A0(dna_down_5[0]),.A1(dna_down_5[1]),.A2(dna_down_5[2]),.A3(dna_down_5[3]),.A4(dna_down_5[4]),.A5(dna_down_5[5]),.A6(dna_down_5[6]),.A7(dna_down_5[7]), 
.Z0(K0),.Z1(K1),.Z2(K2), .Valid(Valid_K));

comp_3bit com1(.A0(A0),.A1(A1),.A2(A2),.B0(B0),.B1(B1),.B2(B2),.Valid_1(Valid_A),.Valid_2(Valid_B),.O_1(cout1a),.O_2(cout1b),.O_3(cout1c),.O_4(cout1d));

comp_3bit com2(.A0(C0),.A1(C1),.A2(C2),.B0(D0),.B1(D1),.B2(D2),.Valid_1(Valid_C),.Valid_2(Valid_D),.O_1(cout2a),.O_2(cout2b),.O_3(cout2c),.O_4(cout2d));

comp_3bit com3(.A0(E0),.A1(E1),.A2(E2),.B0(F0),.B1(F1),.B2(F2),.Valid_1(Valid_E),.Valid_2(Valid_F),.O_1(cout3a),.O_2(cout3b),.O_3(cout3c),.O_4(cout3d));

comp_3bit com4(.A0(G0),.A1(G1),.A2(G2),.B0(H0),.B1(H1),.B2(H2),.Valid_1(Valid_G),.Valid_2(Valid_H),.O_1(cout4a),.O_2(cout4b),.O_3(cout4c),.O_4(cout4d));

comp_3bit com5(.A0(I0),.A1(I1),.A2(I2),.B0(J0),.B1(J1),.B2(J2),.Valid_1(Valid_I),.Valid_2(Valid_J),.O_1(cout5a),.O_2(cout5b),.O_3(cout5c),.O_4(cout5d));

comp_3bit com6(.A0(A0),.A1(K1),.A2(K2),.B0(1'b0),.B1(1'b0),.B2(1'b0),.Valid_1(Valid_K),.Valid_2(1'b1),.O_1(cout6a),.O_2(cout6b),.O_3(cout6c),.O_4(cout6d));

//level 2 comparator 

comp_3bit com7(.A0(cout1a),.A1(cout1b),.A2(cout1c),.B0(cout2a),.B1(cout2b),.B2(cout2c),.Valid_1(cout1d),.Valid_2(cout2d),.O_1(cout2_1a),.O_2(cout2_1b),.O_3(cout2_1c),.O_4(cout2_1d));

comp_3bit com8(.A0(cout3a),.A1(cout3b),.A2(cout3c),.B0(cout4a),.B1(cout4b),.B2(cout4c),.Valid_1(cout3d),.Valid_2(cout4d),.O_1(cout2_2a),.O_2(cout2_2b),.O_3(cout2_2c),.O_4(cout2_2d));

comp_3bit com9(.A0(cout5a),.A1(cout5b),.A2(cout5c),.B0(cout6a),.B1(cout6b),.B2(cout6c),.Valid_1(cout5d),.Valid_2(cout6d),.O_1(cout2_3a),.O_2(cout2_3b),.O_3(cout2_3c),.O_4(cout2_3d));

//level 3 comparator
comp_3bit com10(.A0(cout2_1a),.A1(cout2_1b),.A2(cout2_1c),.B0(cout2_2a),.B1(cout2_2b),.B2(cout2_2c),.Valid_1(cout2_1d),.Valid_2(cout2_2d),.O_1(cout3_1a),.O_2(cout3_1b),.O_3(cout3_1c),.O_4(cout3_1d));

comp_3bit com11(.A0(cout2_3a),.A1(cout2_3b),.A2(cout2_3c),.B0(1'b0),.B1(1'b0),.B2(1'b0),.Valid_1(cout2_3d),.Valid_2(1'b1),.O_1(cout3_2a),.O_2(cout3_2b),.O_3(cout3_2c),.O_4(cout3_2d));

//level 4 comparator
comp_3bit com12(.A0(cout3_1a),.A1(cout3_1b),.A2(cout3_1c),.B0(cout3_2a),.B1(cout3_2b),.B2(cout3_2c),.Valid_1(cout3_1d),.Valid_2(cout3_2d),.O_1(L0),.O_2(L1),.O_3(L2),.O_4(L3));


endmodule 




