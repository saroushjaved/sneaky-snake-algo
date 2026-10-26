module longestescape #(parameter LENGTH=8) (

input clk,
input [0:LENGTH-1] dna_main, dna_up_1, dna_up_2 , dna_up_3, dna_up_4, dna_up_5, dna_down_1,
dna_down_2,dna_down_3,dna_down_4,dna_down_5, 
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
wire comp1_1A, comp1_1B, comp1_1C, comp1_1D, comp1_2A, comp1_2B, comp1_2C, comp1_2D, comp1_3A, comp1_3B, comp1_3C, comp1_3D, comp1_4A, comp1_4B, comp1_4C, comp1_4D, comp1_5A, comp1_5B, comp1_5C, comp1_5D, comp1_6A, comp1_6B, comp1_6C, comp1_6D;
wire comp2_1A, comp2_1B, comp2_1C, comp2_1D, comp2_2A, comp2_2B, comp2_2C, comp2_2D, comp2_3A, comp2_3B, comp2_3C, comp2_3D;
wire comp3_1A, comp3_1B, comp3_1C, comp3_1D, comp3_2A, comp3_2B, comp3_2C, comp3_2D;

// leading zero counters 
leading_zero_8 lzc1(.A0(dna_main[0]),.A1(dna_main[1]),.A2(dna_main[2]),.A3(dna_main[3]),.A4(dna_main[4]),.A5(dna_main[5]),.A6(dna_main[6]),.A7(dna_main[7]), .Z0(A0), .Z1(A1), .Z2(A2), .Valid(Valid_A));

leading_zero_8 lzc2(.A0(dna_up_1[0]),.A1(dna_up_1[1]),.A2(dna_up_1[2]),.A3(dna_up_1[3]),.A4(dna_up_1[4]),.A5(dna_up_1[5]),.A6(dna_up_1[6]),
.A7(dna_up_1[7]),.Z0(B0),.Z1(B1),.Z2(B2), .Valid(Valid_B));

leading_zero_8 lzc3(.A0(dna_up_2[0]),.A1(dna_up_2[1]),.A2(dna_up_2[2]),.A3(dna_up_2[3]),.A4(dna_up_2[4]),.A5(dna_up_2[5]),.A6(dna_up_2[6]),
.A7(dna_up_2[7]),.Z0(C0),.Z1(C1),.Z2(C2), .Valid(Valid_C));

leading_zero_8 lzc4(.A0(dna_up_3[0]),.A1(dna_up_3[1]),.A2(dna_up_3[2]),.A3(dna_up_3[3]),.A4(dna_up_3[4]),.A5(dna_up_3[5]),.A6(dna_up_3[6]),
.A7(dna_up_3[7]),.Z0(D0),.Z1(D1),.Z2(D2), .Valid(Valid_D));

leading_zero_8 lzc5(.A0(dna_up_4[0]),.A1(dna_up_4[1]),.A2(dna_up_4[2]),.A3(dna_up_4[3]),.A4(dna_up_4[4]),.A5(dna_up_4[5]),.A6(dna_up_4[6]),
.A7(dna_up_4[7]),.Z0(E0),.Z1(E1),.Z2(E2), .Valid(Valid_E));

leading_zero_8 lzc6(.A0(dna_up_5[0]),.A1(dna_up_5[1]),.A2(dna_up_5[2]),.A3(dna_up_5[3]),.A4(dna_up_5[4]),.A5(dna_up_5[5]),.A6(dna_up_5[6]),
.A7(dna_up_5[7]),.Z0(F0),.Z1(F1),.Z2(F2), .Valid(Valid_F));

leading_zero_8 lzc7(.A0(dna_down_1[0]),.A1(dna_down_1[1]),.A2(dna_down_1[2]),.A3(dna_down_1[3]),.A4(dna_down_1[4]),.A5(dna_down_1[5]),.A6(dna_down_1[6]),
.A7(dna_down_1[7]),.Z0(G0),.Z1(G1),.Z2(G2), .Valid(Valid_G));

leading_zero_8 lzc8(.A0(dna_down_2[0]),.A1(dna_down_2[1]),.A2(dna_down_2[2]),.A3(dna_down_2[3]),.A4(dna_down_2[4]),.A5(dna_down_2[5]),.A6(dna_down_2[6]),
.A7(dna_down_2[7]),.Z0(H0),.Z1(H1),.Z2(H2), .Valid(Valid_H));

leading_zero_8 lzc9(.A0(dna_down_3[0]),.A1(dna_down_3[1]),.A2(dna_down_3[2]),.A3(dna_down_3[3]),.A4(dna_down_3[4]),.A5(dna_down_3[5]),.A6(dna_down_3[6]),
.A7(dna_down_3[7]),.Z0(I0),.Z1(I1),.Z2(I2), .Valid(Valid_I));

leading_zero_8 lzc10(.A0(dna_down_4[0]),.A1(dna_down_4[1]),.A2(dna_down_4[2]),.A3(dna_down_4[3]),.A4(dna_down_4[4]),.A5(dna_down_4[5]),.A6(dna_down_4[6]),
.A7(dna_down_4[7]),.Z0(J0),.Z1(J1),.Z2(J2), .Valid(Valid_J));

leading_zero_8 lzc11(.A0(dna_down_5[0]),.A1(dna_down_5[1]),.A2(dna_down_5[2]),.A3(dna_down_5[3]),.A4(dna_down_5[4]),.A5(dna_down_5[5]),.A6(dna_down_5[6]),
.A7(dna_down_5[7]),.Z0(K0),.Z1(K1),.Z2(K2), .Valid(Valid_K));


//level one comparators
comp_3bit comp_1(.A0(A0),.A1(A1),.A2(A2),.B0(B0),.B1(B1),.B2(B2),.Valid_1(Valid_A),.Valid_2(Valid_B),.O_1(comp1_1A),.O_2(comp1_1B),.O_3(comp1_1C),.O_4(comp1_1D));

comp_3bit comp_2(.A0(C0),.A1(C1),.A2(C2),.B0(D0),.B1(D1),.B2(D2),.Valid_1(Valid_C),.Valid_2(Valid_D),.O_1(comp1_2A),.O_2(comp1_2B),.O_3(comp1_2C),.O_4(comp1_2D));

comp_3bit comp_3(.A0(E0),.A1(E1),.A2(E2),.B0(F0),.B1(F1),.B2(F2),.Valid_1(Valid_E),.Valid_2(Valid_F),.O_1(comp1_3A),.O_2(comp1_3B),.O_3(comp1_3C),.O_4(comp1_3D));

comp_3bit comp_4(.A0(G0),.A1(G1),.A2(G2),.B0(H0),.B1(H1),.B2(H2),.Valid_1(Valid_G),.Valid_2(Valid_H),.O_1(comp1_4A),.O_2(comp1_4B),.O_3(comp1_4C),.O_4(comp1_4D));

comp_3bit comp_5(.A0(I0),.A1(I1),.A2(I2),.B0(J0),.B1(J1),.B2(J2),.Valid_1(Valid_I),.Valid_2(Valid_J),.O_1(comp1_5A),.O_2(comp1_5B),.O_3(comp1_5C),.O_4(comp1_5D));

comp_3bit comp_6(.A0(K0),.A1(K1),.A2(K2),.B0(1'b0),.B1(1'b0),.B2(1'b0),.Valid_1(Valid_K),.Valid_2(1'b1),.O_1(comp1_6A),.O_2(comp1_6B),.O_3(comp1_6C),.O_4(comp1_6D));

//level two comparators
comp_3bit comp_7(.A0(comp1_1A),.A1(comp1_1B),.A2(comp1_1C),.B0(comp1_2A),.B1(comp1_2B),.B2(comp1_2C),.Valid_1(comp1_1D),.Valid_2(comp1_2D),.O_1(comp2_1A),.O_2(comp2_1B),.O_3(comp2_1C),.O_4(comp2_1D));

comp_3bit comp_8(.A0(comp1_3A),.A1(comp1_3B),.A2(comp1_3C),.B0(comp1_4A),.B1(comp1_4B),.B2(comp1_4C),.Valid_1(comp1_3D),.Valid_2(comp1_4D),.O_1(comp2_2A),.O_2(comp2_2B),.O_3(comp2_2C),.O_4(comp2_2D));

comp_3bit comp_9(.A0(comp1_5A),.A1(comp1_5B),.A2(comp1_5C),.B0(comp1_6A),.B1(comp1_6B),.B2(comp1_6C),.Valid_1(comp1_5D),.Valid_2(comp1_6D),.O_1(comp2_3A),.O_2(comp2_3B),.O_3(comp2_3C),.O_4(comp2_3D));

//level three comparators
comp_3bit comp_10(.A0(comp2_1A),.A1(comp2_1B),.A2(comp2_1C),.B0(comp2_2A),.B1(comp2_2B),.B2(comp2_2C),.Valid_1(comp2_1D),.Valid_2(comp2_2D),.O_1(comp3_1A),.O_2(comp3_1B),.O_3(comp3_1C),.O_4(comp3_1D));

comp_3bit comp_11(.A0(comp2_3A),.A1(comp2_3B),.A2(comp2_3B),.B0(1'b0),.B1(1'b0),.B2(1'b0),.Valid_1(comp2_3D),.Valid_2(1'b1),.O_1(comp3_2A),.O_2(comp3_2B),.O_3(comp3_2C),.O_4(comp3_2D));

//leve four comparator
comp_3bit comp_12(.A0(comp3_1A),.A1(comp3_1B),.A2(comp3_1C),.B0(comp3_2A),.B1(comp3_2B),.B2(comp3_2C),.Valid_1(comp3_1D),.Valid_2(comp3_2D),.O_1(L0),.O_2(L1),.O_3(L2),.O_4(L3));

endmodule