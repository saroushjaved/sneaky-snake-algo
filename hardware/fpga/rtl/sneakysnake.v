
module SneakySnake #(parameter LENGTH = 100)(
input clk,
input [0:LENGTH-1] dna_read, dna_ref,
output reg Accepted,
output [0:(LENGTH/2)-1] dna_main, dna_up_1, dna_up_2, dna_up_3, dna_up_4, dna_up_5, dna_down_1, dna_down_2, dna_down_3, dna_down_4, dna_down_5
); 



ChipMaze #(.LENGTH(LENGTH)) instl(clk, dna_read, dna_ref, dna_main, dna_up_1, dna_up_2 , dna_up_3, dna_up_4, dna_up_5, dna_down_1,dna_down_2,dna_down_3,dna_down_4,dna_down_5 );

integer ErrorTh = 5; 

wire [0:99] dna_main_tl, dna_up_1_tl, dna_up_2_tl, dna_up_3_tl, dna_up_4_tl, dna_up_5_tl, dna_down_1_tl, dna_down_2_tl, dna_down_3_tl, dna_down_4_tl, dna_down_5_tl; 
wire [0:99] dna_main_tl_one, dna_up_1_tl_one, dna_up_2_tl_one, dna_up_3_tl_one, dna_up_4_tl_one, dna_up_5_tl_one, dna_down_1_tl_one, dna_down_2_tl_one, dna_down_3_tl_one, dna_down_4_tl_one, dna_down_5_tl_one; 
wire [0:99] dna_main_tl_two, dna_up_1_tl_two, dna_up_2_tl_two, dna_up_3_tl_two, dna_up_4_tl_two, dna_up_5_tl_two, dna_down_1_tl_two, dna_down_2_tl_two, dna_down_3_tl_two, dna_down_4_tl_two, dna_down_5_tl_two; 
reg [0:6] MinEdit;



wire [0:3] Sum1,Sum2,Sum3, Sum4, Sum5, Sum6, Sum7, Sum8, Sum9, Sum10, Sum11, Sum12, Sum13, Sum14, Sum15, Sum16, Sum17, Sum18, Sum19, Sum20,
Sum21,Sum22, Sum23, Sum24, Sum25,Sum26, Sum27, Sum28, Sum29, Sum30, Sum31, Sum32, Sum33, Sum34, Sum35, Sum36;
wire [0:1] Live1,Live2,Live3, Live4, Live5, Live6, Live7, Live8, Live9, Live10, Live11, Live12, Live13, Live14, Live15, Live16, Live17, Live18, Live19, Live20,
Live21,Live22, Live23, Live24, Live25,Live26, Live27, Live28, Live29, Live30, Live31, Live32, Live33, Live34, Live35, Live36;

eightbitSneakySnake eightoneA(
.SumIn(0),
.EditIn(0),
.clk(clk), 
.A(dna_main[0:7]), .B(dna_up_1[0:7]), .C(dna_up_2[0:7]), .D(dna_up_3[0:7]), .E(dna_up_4[0:7]), .F(dna_up_5[0:7]), .G(dna_down_1[0:7]), .H(dna_down_2[0:7]), .I(dna_down_3[0:7]) ,.J(dna_down_4[0:7]), .K(dna_down_5[0:7]), 
.Ao(dna_main_tl[0:7]), .Bo(dna_up_1_tl[0:7]), .Co(dna_up_2_tl[0:7]), .Do(dna_up_3_tl[0:7]), .Eo(dna_up_4_tl[0:7]), .Fo(dna_up_5_tl[0:7]), .Go(dna_down_1_tl[0:7]), .Ho(dna_down_2_tl[0:7]), .Io(dna_down_3_tl[0:7]), .Jo(dna_down_4_tl[0:7]), .Ko(dna_down_5_tl[0:7]), 
.SumOut(Sum1),
.Lives(Live1));

eightbitSneakySnake eightoneB(
.SumIn(Sum1),
.EditIn(Live1),
.clk(clk), 
.A(dna_main_tl[0:7]), .B(dna_up_1_tl[0:7]), .C(dna_up_2_tl[0:7]), .D(dna_up_3_tl[0:7]), .E(dna_up_4_tl[0:7]), .F(dna_up_5_tl[0:7]), .G(dna_down_1_tl[0:7]), .H(dna_down_2_tl[0:7]), .I(dna_down_3_tl[0:7]) ,.J(dna_down_4_tl[0:7]), .K(dna_down_5_tl[0:7]), 
.Ao(dna_main_tl_one[0:7]), .Bo(dna_up_1_tl_one[0:7]), .Co(dna_up_2_tl_one[0:7]), .Do(dna_up_3_tl_one[0:7]), .Eo(dna_up_4_tl_one[0:7]), .Fo(dna_up_5_tl_one[0:7]), .Go(dna_down_1_tl_one[0:7]), .Ho(dna_down_2_tl_one[0:7]), .Io(dna_down_3_tl_one[0:7]), .Jo(dna_down_4_tl_one[0:7]), .Ko(dna_down_5_tl_one[0:7]), 
.SumOut(Sum2),
.Lives(Live2));


eightbitSneakySnake eightoneC(
.SumIn(Sum2),
.EditIn(Live2),
.clk(clk), 
.A(dna_main_tl_one[0:7]), .B(dna_up_1_tl_one[0:7]), .C(dna_up_2_tl_one[0:7]), .D(dna_up_3_tl_one[0:7]), .E(dna_up_4_tl_one[0:7]), .F(dna_up_5_tl_one[0:7]), .G(dna_down_1_tl_one[0:7]), .H(dna_down_2_tl_one[0:7]), .I(dna_down_3_tl_one[0:7]) ,.J(dna_down_4_tl_one[0:7]), .K(dna_down_5_tl_one[0:7]), 
.Ao(dna_main_tl_two[0:7]), .Bo(dna_up_1_tl_two[0:7]), .Co(dna_up_2_tl_two[0:7]), .Do(dna_up_3_tl_two[0:7]), .Eo(dna_up_4_tl_two[0:7]), .Fo(dna_up_5_tl_two[0:7]), .Go(dna_down_1_tl_two[0:7]), .Ho(dna_down_2_tl_two[0:7]), .Io(dna_down_3_tl_two[0:7]), .Jo(dna_down_4_tl_two[0:7]), .Ko(dna_down_5_tl_two[0:7]), 
.SumOut(Sum3),
.EditOut(EditOutl));

eightbitSneakySnake eightoneD(
.SumIn(0),
.EditIn(0),
.clk(clk), 
.A(dna_main[8:15]), .B(dna_up_1[8:15]), .C(dna_up_2[8:15]), .D(dna_up_3[8:15]), .E(dna_up_4[8:15]), .F(dna_up_5[8:15]), .G(dna_down_1[8:15]), .H(dna_down_2[8:15]), .I(dna_down_3[8:15]) ,.J(dna_down_4[8:15]), .K(dna_down_5[8:15]), 
.Ao(dna_main_tl[8:15]), .Bo(dna_up_1_tl[8:15]), .Co(dna_up_2_tl[8:15]), .Do(dna_up_3_tl[8:15]), .Eo(dna_up_4_tl[8:15]), .Fo(dna_up_5_tl[8:15]), .Go(dna_down_1_tl[8:15]), .Ho(dna_down_2_tl[8:15]), .Io(dna_down_3_tl[8:15]), .Jo(dna_down_4_tl[8:15]), .Ko(dna_down_5_tl[8:15]), 
.SumOut(Sum4),
.Lives(Live4));

eightbitSneakySnake eightoneE(
.SumIn(Sum4),
.EditIn(Live4),
.clk(clk), 
.A(dna_main_tl[8:15]), .B(dna_up_1_tl[8:15]), .C(dna_up_2_tl[8:15]), .D(dna_up_3_tl[8:15]), .E(dna_up_4_tl[8:15]), .F(dna_up_5_tl[8:15]), .G(dna_down_1_tl[8:15]), .H(dna_down_2_tl[8:15]), .I(dna_down_3_tl[8:15]) ,.J(dna_down_4_tl[8:15]), .K(dna_down_5_tl[8:15]), 
.Ao(dna_main_tl_one[8:15]), .Bo(dna_up_1_tl_one[8:15]), .Co(dna_up_2_tl_one[8:15]), .Do(dna_up_3_tl_one[8:15]), .Eo(dna_up_4_tl_one[8:15]), .Fo(dna_up_5_tl_one[8:15]), .Go(dna_down_1_tl_one[8:15]), .Ho(dna_down_2_tl_one[8:15]), .Io(dna_down_3_tl_one[8:15]), .Jo(dna_down_4_tl_one[8:15]), .Ko(dna_down_5_tl_one[8:15]), 
.SumOut(Sum5),
.Lives(Live5));


eightbitSneakySnake eightoneF(
.SumIn(Sum5),
.EditIn(Live5),
.clk(clk), 
.A(dna_main_tl_one[8:15]), .B(dna_up_1_tl_one[8:15]), .C(dna_up_2_tl_one[8:15]), .D(dna_up_3_tl_one[8:15]), .E(dna_up_4_tl_one[8:15]), .F(dna_up_5_tl_one[8:15]), .G(dna_down_1_tl_one[8:15]), .H(dna_down_2_tl_one[8:15]), .I(dna_down_3_tl_one[8:15]) ,.J(dna_down_4_tl_one[8:15]), .K(dna_down_5_tl_one[8:15]), 
.Ao(dna_main_tl_two[8:15]), .Bo(dna_up_1_tl_two[8:15]), .Co(dna_up_2_tl_two[8:15]), .Do(dna_up_3_tl_two[8:15]), .Eo(dna_up_4_tl_two[8:15]), .Fo(dna_up_5_tl_two[8:15]), .Go(dna_down_1_tl_two[8:15]), .Ho(dna_down_2_tl_two[8:15]), .Io(dna_down_3_tl_two[8:15]), .Jo(dna_down_4_tl_two[8:15]), .Ko(dna_down_5_tl_two[8:15]), 
.SumOut(Sum6),
.EditOut(EditOut2));


eightbitSneakySnake eightoneG(
.SumIn(0),
.EditIn(0),
.clk(clk), 
.A(dna_main[16:23]), .B(dna_up_1[16:23]), .C(dna_up_2[16:23]), .D(dna_up_3[16:23]), .E(dna_up_4[16:23]), .F(dna_up_5[16:23]), .G(dna_down_1[16:23]), .H(dna_down_2[16:23]), .I(dna_down_3[16:23]) ,.J(dna_down_4[16:23]), .K(dna_down_5[16:23]), 
.Ao(dna_main_tl[16:23]), .Bo(dna_up_1_tl[16:23]), .Co(dna_up_2_tl[16:23]), .Do(dna_up_3_tl[16:23]), .Eo(dna_up_4_tl[16:23]), .Fo(dna_up_5_tl[16:23]), .Go(dna_down_1_tl[16:23]), .Ho(dna_down_2_tl[16:23]), .Io(dna_down_3_tl[16:23]), .Jo(dna_down_4_tl[16:23]), .Ko(dna_down_5_tl[16:23]), 
.SumOut(Sum7),
.Lives(Live7));

eightbitSneakySnake eightoneH(
.SumIn(Sum7),
.EditIn(Live7),
.clk(clk), 
.A(dna_main_tl[16:23]), .B(dna_up_1_tl[16:23]), .C(dna_up_2_tl[16:23]), .D(dna_up_3_tl[16:23]), .E(dna_up_4_tl[16:23]), .F(dna_up_5_tl[16:23]), .G(dna_down_1_tl[16:23]), .H(dna_down_2_tl[16:23]), .I(dna_down_3_tl[16:23]) ,.J(dna_down_4_tl[16:23]), .K(dna_down_5_tl[16:23]), 
.Ao(dna_main_tl_one[16:23]), .Bo(dna_up_1_tl_one[16:23]), .Co(dna_up_2_tl_one[16:23]), .Do(dna_up_3_tl_one[16:23]), .Eo(dna_up_4_tl_one[16:23]), .Fo(dna_up_5_tl_one[16:23]), .Go(dna_down_1_tl_one[16:23]), .Ho(dna_down_2_tl_one[16:23]), .Io(dna_down_3_tl_one[16:23]), .Jo(dna_down_4_tl_one[16:23]), .Ko(dna_down_5_tl_one[16:23]), 
.SumOut(Sum8),
.Lives(Live8));


eightbitSneakySnake eightoneI(
.SumIn(Sum8),
.EditIn(Live8),
.clk(clk), 
.A(dna_main_tl_one[16:23]), .B(dna_up_1_tl_one[16:23]), .C(dna_up_2_tl_one[16:23]), .D(dna_up_3_tl_one[16:23]), .E(dna_up_4_tl_one[16:23]), .F(dna_up_5_tl_one[16:23]), .G(dna_down_1_tl_one[16:23]), .H(dna_down_2_tl_one[16:23]), .I(dna_down_3_tl_one[16:23]) ,.J(dna_down_4_tl_one[16:23]), .K(dna_down_5_tl_one[16:23]), 
.Ao(dna_main_tl_two[16:23]), .Bo(dna_up_1_tl_two[16:23]), .Co(dna_up_2_tl_two[16:23]), .Do(dna_up_3_tl_two[16:23]), .Eo(dna_up_4_tl_two[16:23]), .Fo(dna_up_5_tl_two[16:23]), .Go(dna_down_1_tl_two[16:23]), .Ho(dna_down_2_tl_two[16:23]), .Io(dna_down_3_tl_two[16:23]), .Jo(dna_down_4_tl_two[16:23]), .Ko(dna_down_5_tl_two[16:23]), 
.SumOut(Sum9),
.EditOut(EditOut3));



eightbitSneakySnake eightoneJ(
.SumIn(0),
.EditIn(0),
.clk(clk), 
.A(dna_main[24:31]), .B(dna_up_1[24:31]), .C(dna_up_2[24:31]), .D(dna_up_3[24:31]), .E(dna_up_4[24:31]), .F(dna_up_5[24:31]), .G(dna_down_1[24:31]), .H(dna_down_2[24:31]), .I(dna_down_3[24:31]) ,.J(dna_down_4[24:31]), .K(dna_down_5[24:31]), 
.Ao(dna_main_tl[24:31]), .Bo(dna_up_1_tl[24:31]), .Co(dna_up_2_tl[24:31]), .Do(dna_up_3_tl[24:31]), .Eo(dna_up_4_tl[24:31]), .Fo(dna_up_5_tl[24:31]), .Go(dna_down_1_tl[24:31]), .Ho(dna_down_2_tl[24:31]), .Io(dna_down_3_tl[24:31]), .Jo(dna_down_4_tl[24:31]), .Ko(dna_down_5_tl[24:31]), 
.SumOut(Sum10),
.Lives(Live10));

eightbitSneakySnake eightoneK(
.SumIn(Sum10),
.EditIn(Live10),
.clk(clk), 
.A(dna_main_tl[24:31]), .B(dna_up_1_tl[24:31]), .C(dna_up_2_tl[24:31]), .D(dna_up_3_tl[24:31]), .E(dna_up_4_tl[24:31]), .F(dna_up_5_tl[24:31]), .G(dna_down_1_tl[24:31]), .H(dna_down_2_tl[24:31]), .I(dna_down_3_tl[24:31]) ,.J(dna_down_4_tl[24:31]), .K(dna_down_5_tl[24:31]), 
.Ao(dna_main_tl_one[24:31]), .Bo(dna_up_1_tl_one[24:31]), .Co(dna_up_2_tl_one[24:31]), .Do(dna_up_3_tl_one[24:31]), .Eo(dna_up_4_tl_one[24:31]), .Fo(dna_up_5_tl_one[24:31]), .Go(dna_down_1_tl_one[24:31]), .Ho(dna_down_2_tl_one[24:31]), .Io(dna_down_3_tl_one[24:31]), .Jo(dna_down_4_tl_one[24:31]), .Ko(dna_down_5_tl_one[24:31]), 
.SumOut(Sum11),
.Lives(Live11));


eightbitSneakySnake eightoneL(
.SumIn(Sum11),
.EditIn(Live11),
.clk(clk), 
.A(dna_main_tl_one[24:31]), .B(dna_up_1_tl_one[24:31]), .C(dna_up_2_tl_one[24:31]), .D(dna_up_3_tl_one[24:31]), .E(dna_up_4_tl_one[24:31]), .F(dna_up_5_tl_one[24:31]), .G(dna_down_1_tl_one[24:31]), .H(dna_down_2_tl_one[24:31]), .I(dna_down_3_tl_one[24:31]) ,.J(dna_down_4_tl_one[24:31]), .K(dna_down_5_tl_one[24:31]), 
.Ao(dna_main_tl_two[24:31]), .Bo(dna_up_1_tl_two[24:31]), .Co(dna_up_2_tl_two[24:31]), .Do(dna_up_3_tl_two[24:31]), .Eo(dna_up_4_tl_two[24:31]), .Fo(dna_up_5_tl_two[24:31]), .Go(dna_down_1_tl_two[24:31]), .Ho(dna_down_2_tl_two[24:31]), .Io(dna_down_3_tl_two[24:31]), .Jo(dna_down_4_tl_two[24:31]), .Ko(dna_down_5_tl_two[24:31]), 
.SumOut(Sum12),
.EditOut(EditOut4));


eightbitSneakySnake eightoneM(
.SumIn(0),
.EditIn(0),
.clk(clk), 
.A(dna_main[32:39]), .B(dna_up_1[32:39]), .C(dna_up_2[32:39]), .D(dna_up_3[32:39]), .E(dna_up_4[32:39]), .F(dna_up_5[32:39]), .G(dna_down_1[32:39]), .H(dna_down_2[32:39]), .I(dna_down_3[32:39]) ,.J(dna_down_4[32:39]), .K(dna_down_5[32:39]), 
.Ao(dna_main_tl[32:39]), .Bo(dna_up_1_tl[32:39]), .Co(dna_up_2_tl[32:39]), .Do(dna_up_3_tl[32:39]), .Eo(dna_up_4_tl[32:39]), .Fo(dna_up_5_tl[32:39]), .Go(dna_down_1_tl[32:39]), .Ho(dna_down_2_tl[32:39]), .Io(dna_down_3_tl[32:39]), .Jo(dna_down_4_tl[32:39]), .Ko(dna_down_5_tl[32:39]), 
.SumOut(Sum13),
.Lives(Live13));

eightbitSneakySnake eightoneN(
.SumIn(Sum13),
.EditIn(Live13),
.clk(clk), 
.A(dna_main_tl[32:39]), .B(dna_up_1_tl[32:39]), .C(dna_up_2_tl[32:39]), .D(dna_up_3_tl[32:39]), .E(dna_up_4_tl[32:39]), .F(dna_up_5_tl[32:39]), .G(dna_down_1_tl[32:39]), .H(dna_down_2_tl[32:39]), .I(dna_down_3_tl[32:39]) ,.J(dna_down_4_tl[32:39]), .K(dna_down_5_tl[32:39]), 
.Ao(dna_main_tl_one[32:39]), .Bo(dna_up_1_tl_one[32:39]), .Co(dna_up_2_tl_one[32:39]), .Do(dna_up_3_tl_one[32:39]), .Eo(dna_up_4_tl_one[32:39]), .Fo(dna_up_5_tl_one[32:39]), .Go(dna_down_1_tl_one[32:39]), .Ho(dna_down_2_tl_one[32:39]), .Io(dna_down_3_tl_one[32:39]), .Jo(dna_down_4_tl_one[32:39]), .Ko(dna_down_5_tl_one[32:39]), 
.SumOut(Sum14),
.Lives(Live14));


eightbitSneakySnake eightoneO(
.SumIn(Sum14),
.EditIn(Live14),
.clk(clk), 
.A(dna_main_tl_one[32:39]), .B(dna_up_1_tl_one[32:39]), .C(dna_up_2_tl_one[32:39]), .D(dna_up_3_tl_one[32:39]), .E(dna_up_4_tl_one[32:39]), .F(dna_up_5_tl_one[32:39]), .G(dna_down_1_tl_one[32:39]), .H(dna_down_2_tl_one[32:39]), .I(dna_down_3_tl_one[32:39]) ,.J(dna_down_4_tl_one[32:39]), .K(dna_down_5_tl_one[32:39]), 
.Ao(dna_main_tl_two[32:39]), .Bo(dna_up_1_tl_two[32:39]), .Co(dna_up_2_tl_two[32:39]), .Do(dna_up_3_tl_two[32:39]), .Eo(dna_up_4_tl_two[32:39]), .Fo(dna_up_5_tl_two[32:39]), .Go(dna_down_1_tl_two[32:39]), .Ho(dna_down_2_tl_two[32:39]), .Io(dna_down_3_tl_two[32:39]), .Jo(dna_down_4_tl_two[32:39]), .Ko(dna_down_5_tl_two[32:39]), 
.SumOut(Sum15),
.EditOut(EditOut5));


eightbitSneakySnake eightoneP(
.SumIn(0),
.EditIn(0),
.clk(clk), 
.A(dna_main[40:47]), .B(dna_up_1[40:47]), .C(dna_up_2[40:47]), .D(dna_up_3[40:47]), .E(dna_up_4[40:47]), .F(dna_up_5[40:47]), .G(dna_down_1[40:47]), .H(dna_down_2[40:47]), .I(dna_down_3[40:47]) ,.J(dna_down_4[40:47]), .K(dna_down_5[40:47]), 
.Ao(dna_main_tl[40:47]), .Bo(dna_up_1_tl[40:47]), .Co(dna_up_2_tl[40:47]), .Do(dna_up_3_tl[40:47]), .Eo(dna_up_4_tl[40:47]), .Fo(dna_up_5_tl[40:47]), .Go(dna_down_1_tl[40:47]), .Ho(dna_down_2_tl[40:47]), .Io(dna_down_3_tl[40:47]), .Jo(dna_down_4_tl[40:47]), .Ko(dna_down_5_tl[40:47]), 
.SumOut(Sum16),
.Lives(Live16));

eightbitSneakySnake eightoneQ(
.SumIn(Sum16),
.EditIn(Live16),
.clk(clk), 
.A(dna_main_tl[40:47]), .B(dna_up_1_tl[40:47]), .C(dna_up_2_tl[40:47]), .D(dna_up_3_tl[40:47]), .E(dna_up_4_tl[40:47]), .F(dna_up_5_tl[40:47]), .G(dna_down_1_tl[40:47]), .H(dna_down_2_tl[40:47]), .I(dna_down_3_tl[40:47]) ,.J(dna_down_4_tl[40:47]), .K(dna_down_5_tl[40:47]), 
.Ao(dna_main_tl_one[40:47]), .Bo(dna_up_1_tl_one[40:47]), .Co(dna_up_2_tl_one[40:47]), .Do(dna_up_3_tl_one[40:47]), .Eo(dna_up_4_tl_one[40:47]), .Fo(dna_up_5_tl_one[40:47]), .Go(dna_down_1_tl_one[40:47]), .Ho(dna_down_2_tl_one[40:47]), .Io(dna_down_3_tl_one[40:47]), .Jo(dna_down_4_tl_one[40:47]), .Ko(dna_down_5_tl_one[40:47]), 
.SumOut(Sum17),
.Lives(Live17));


eightbitSneakySnake eightoneR(
.SumIn(Sum18),
.EditIn(Live18),
.clk(clk), 
.A(dna_main_tl_one[40:47]), .B(dna_up_1_tl_one[40:47]), .C(dna_up_2_tl_one[40:47]), .D(dna_up_3_tl_one[40:47]), .E(dna_up_4_tl_one[40:47]), .F(dna_up_5_tl_one[40:47]), .G(dna_down_1_tl_one[40:47]), .H(dna_down_2_tl_one[40:47]), .I(dna_down_3_tl_one[40:47]) ,.J(dna_down_4_tl_one[40:47]), .K(dna_down_5_tl_one[40:47]), 
.Ao(dna_main_tl_two[40:47]), .Bo(dna_up_1_tl_two[40:47]), .Co(dna_up_2_tl_two[40:47]), .Do(dna_up_3_tl_two[40:47]), .Eo(dna_up_4_tl_two[40:47]), .Fo(dna_up_5_tl_two[40:47]), .Go(dna_down_1_tl_two[40:47]), .Ho(dna_down_2_tl_two[40:47]), .Io(dna_down_3_tl_two[40:47]), .Jo(dna_down_4_tl_two[40:47]), .Ko(dna_down_5_tl_two[40:47]), 
.SumOut(Sum19),
.EditOut(EditOut6));



eightbitSneakySnake eightoneS(
.SumIn(0),
.EditIn(0),
.clk(clk), 
.A(dna_main[48:55]), .B(dna_up_1[48:55]), .C(dna_up_2[48:55]), .D(dna_up_3[48:55]), .E(dna_up_4[48:55]), .F(dna_up_5[48:55]), .G(dna_down_1[48:55]), .H(dna_down_2[48:55]), .I(dna_down_3[48:55]) ,.J(dna_down_4[48:55]), .K(dna_down_5[48:55]), 
.Ao(dna_main_tl[48:55]), .Bo(dna_up_1_tl[48:55]), .Co(dna_up_2_tl[48:55]), .Do(dna_up_3_tl[48:55]), .Eo(dna_up_4_tl[48:55]), .Fo(dna_up_5_tl[48:55]), .Go(dna_down_1_tl[48:55]), .Ho(dna_down_2_tl[48:55]), .Io(dna_down_3_tl[48:55]), .Jo(dna_down_4_tl[48:55]), .Ko(dna_down_5_tl[48:55]), 
.SumOut(Sum20),
.Lives(Live20));

eightbitSneakySnake eightoneT(
.SumIn(Sum20),
.EditIn(Live20),
.clk(clk), 
.A(dna_main_tl[48:55]), .B(dna_up_1_tl[48:55]), .C(dna_up_2_tl[48:55]), .D(dna_up_3_tl[48:55]), .E(dna_up_4_tl[48:55]), .F(dna_up_5_tl[48:55]), .G(dna_down_1_tl[48:55]), .H(dna_down_2_tl[48:55]), .I(dna_down_3_tl[48:55]) ,.J(dna_down_4_tl[48:55]), .K(dna_down_5_tl[48:55]), 
.Ao(dna_main_tl_one[48:55]), .Bo(dna_up_1_tl_one[48:55]), .Co(dna_up_2_tl_one[48:55]), .Do(dna_up_3_tl_one[48:55]), .Eo(dna_up_4_tl_one[48:55]), .Fo(dna_up_5_tl_one[48:55]), .Go(dna_down_1_tl_one[48:55]), .Ho(dna_down_2_tl_one[48:55]), .Io(dna_down_3_tl_one[48:55]), .Jo(dna_down_4_tl_one[48:55]), .Ko(dna_down_5_tl_one[48:55]), 
.SumOut(Sum21),
.Lives(Live21));


eightbitSneakySnake eightoneU(
.SumIn(Sum21),
.EditIn(Live21),
.clk(clk), 
.A(dna_main_tl_one[48:55]), .B(dna_up_1_tl_one[48:55]), .C(dna_up_2_tl_one[48:55]), .D(dna_up_3_tl_one[48:55]), .E(dna_up_4_tl_one[48:55]), .F(dna_up_5_tl_one[48:55]), .G(dna_down_1_tl_one[48:55]), .H(dna_down_2_tl_one[48:55]), .I(dna_down_3_tl_one[48:55]) ,.J(dna_down_4_tl_one[48:55]), .K(dna_down_5_tl_one[48:55]), 
.Ao(dna_main_tl_two[48:55]), .Bo(dna_up_1_tl_two[48:55]), .Co(dna_up_2_tl_two[48:55]), .Do(dna_up_3_tl_two[48:55]), .Eo(dna_up_4_tl_two[48:55]), .Fo(dna_up_5_tl_two[48:55]), .Go(dna_down_1_tl_two[48:55]), .Ho(dna_down_2_tl_two[48:55]), .Io(dna_down_3_tl_two[48:55]), .Jo(dna_down_4_tl_two[48:55]), .Ko(dna_down_5_tl_two[48:55]), 
.SumOut(Sum22),
.EditOut(EditOut7));

eightbitSneakySnake eightoneW(
.SumIn(0),
.EditIn(0),
.clk(clk), 
.A(dna_main[56:63]), .B(dna_up_1[56:63]), .C(dna_up_2[56:63]), .D(dna_up_3[56:63]), .E(dna_up_4[56:63]), .F(dna_up_5[56:63]), .G(dna_down_1[56:63]), .H(dna_down_2[56:63]), .I(dna_down_3[56:63]) ,.J(dna_down_4[56:63]), .K(dna_down_5[56:63]), 
.Ao(dna_main_tl[56:63]), .Bo(dna_up_1_tl[56:63]), .Co(dna_up_2_tl[56:63]), .Do(dna_up_3_tl[56:63]), .Eo(dna_up_4_tl[56:63]), .Fo(dna_up_5_tl[56:63]), .Go(dna_down_1_tl[56:63]), .Ho(dna_down_2_tl[56:63]), .Io(dna_down_3_tl[56:63]), .Jo(dna_down_4_tl[56:63]), .Ko(dna_down_5_tl[56:63]), 
.SumOut(Sum23),
.Lives(Live22));

eightbitSneakySnake eightoneX(
.SumIn(Sum23),
.EditIn(Live22),
.clk(clk), 
.A(dna_main_tl[56:63]), .B(dna_up_1_tl[56:63]), .C(dna_up_2_tl[56:63]), .D(dna_up_3_tl[56:63]), .E(dna_up_4_tl[56:63]), .F(dna_up_5_tl[56:63]), .G(dna_down_1_tl[56:63]), .H(dna_down_2_tl[56:63]), .I(dna_down_3_tl[56:63]) ,.J(dna_down_4_tl[56:63]), .K(dna_down_5_tl[56:63]), 
.Ao(dna_main_tl_one[56:63]), .Bo(dna_up_1_tl_one[56:63]), .Co(dna_up_2_tl_one[56:63]), .Do(dna_up_3_tl_one[56:63]), .Eo(dna_up_4_tl_one[56:63]), .Fo(dna_up_5_tl_one[56:63]), .Go(dna_down_1_tl_one[56:63]), .Ho(dna_down_2_tl_one[56:63]), .Io(dna_down_3_tl_one[56:63]), .Jo(dna_down_4_tl_one[56:63]), .Ko(dna_down_5_tl_one[56:63]), 
.SumOut(Sum24),
.Lives(Live23));


eightbitSneakySnake eightoneY(
.SumIn(Sum24),
.EditIn(Live23),
.clk(clk), 
.A(dna_main_tl_one[56:63]), .B(dna_up_1_tl_one[56:63]), .C(dna_up_2_tl_one[56:63]), .D(dna_up_3_tl_one[56:63]), .E(dna_up_4_tl_one[56:63]), .F(dna_up_5_tl_one[56:63]), .G(dna_down_1_tl_one[56:63]), .H(dna_down_2_tl_one[56:63]), .I(dna_down_3_tl_one[56:63]) ,.J(dna_down_4_tl_one[56:63]), .K(dna_down_5_tl_one[56:63]), 
.Ao(dna_main_tl_two[56:63]), .Bo(dna_up_1_tl_two[56:63]), .Co(dna_up_2_tl_two[56:63]), .Do(dna_up_3_tl_two[56:63]), .Eo(dna_up_4_tl_two[56:63]), .Fo(dna_up_5_tl_two[56:63]), .Go(dna_down_1_tl_two[56:63]), .Ho(dna_down_2_tl_two[56:63]), .Io(dna_down_3_tl_two[56:63]), .Jo(dna_down_4_tl_two[56:63]), .Ko(dna_down_5_tl_two[56:63]), 
.SumOut(Sum25),
.EditOut(EditOut8));


eightbitSneakySnake eightoneZ(
.SumIn(0),
.EditIn(0),
.clk(clk), 
.A(dna_main[64:71]), .B(dna_up_1[64:71]), .C(dna_up_2[64:71]), .D(dna_up_3[64:71]), .E(dna_up_4[64:71]), .F(dna_up_5[64:71]), .G(dna_down_1[64:71]), .H(dna_down_2[64:71]), .I(dna_down_3[64:71]) ,.J(dna_down_4[64:71]), .K(dna_down_5[64:71]), 
.Ao(dna_main_tl[64:71]), .Bo(dna_up_1_tl[64:71]), .Co(dna_up_2_tl[64:71]), .Do(dna_up_3_tl[64:71]), .Eo(dna_up_4_tl[64:71]), .Fo(dna_up_5_tl[64:71]), .Go(dna_down_1_tl[64:71]), .Ho(dna_down_2_tl[64:71]), .Io(dna_down_3_tl[64:71]), .Jo(dna_down_4_tl[64:71]), .Ko(dna_down_5_tl[64:71]), 
.SumOut(Sum26),
.Lives(Live25));

eightbitSneakySnake eightoneAA(
.SumIn(Sum26),
.EditIn(Live25),
.clk(clk), 
.A(dna_main_tl[64:71]), .B(dna_up_1_tl[64:71]), .C(dna_up_2_tl[64:71]), .D(dna_up_3_tl[64:71]), .E(dna_up_4_tl[64:71]), .F(dna_up_5_tl[64:71]), .G(dna_down_1_tl[64:71]), .H(dna_down_2_tl[64:71]), .I(dna_down_3_tl[64:71]) ,.J(dna_down_4_tl[64:71]), .K(dna_down_5_tl[64:71]), 
.Ao(dna_main_tl_one[64:71]), .Bo(dna_up_1_tl_one[64:71]), .Co(dna_up_2_tl_one[64:71]), .Do(dna_up_3_tl_one[64:71]), .Eo(dna_up_4_tl_one[64:71]), .Fo(dna_up_5_tl_one[64:71]), .Go(dna_down_1_tl_one[64:71]), .Ho(dna_down_2_tl_one[64:71]), .Io(dna_down_3_tl_one[64:71]), .Jo(dna_down_4_tl_one[64:71]), .Ko(dna_down_5_tl_one[64:71]), 
.SumOut(Sum27),
.Lives(Live26));


eightbitSneakySnake eightoneBB(
.SumIn(Sum27),
.EditIn(Live26),
.clk(clk), 
.A(dna_main_tl_one[64:71]), .B(dna_up_1_tl_one[64:71]), .C(dna_up_2_tl_one[64:71]), .D(dna_up_3_tl_one[64:71]), .E(dna_up_4_tl_one[64:71]), .F(dna_up_5_tl_one[64:71]), .G(dna_down_1_tl_one[64:71]), .H(dna_down_2_tl_one[64:71]), .I(dna_down_3_tl_one[64:71]) ,.J(dna_down_4_tl_one[64:71]), .K(dna_down_5_tl_one[64:71]), 
.Ao(dna_main_tl_two[64:71]), .Bo(dna_up_1_tl_two[64:71]), .Co(dna_up_2_tl_two[64:71]), .Do(dna_up_3_tl_two[64:71]), .Eo(dna_up_4_tl_two[64:71]), .Fo(dna_up_5_tl_two[64:71]), .Go(dna_down_1_tl_two[64:71]), .Ho(dna_down_2_tl_two[64:71]), .Io(dna_down_3_tl_two[64:71]), .Jo(dna_down_4_tl_two[64:71]), .Ko(dna_down_5_tl_two[64:71]), 
.SumOut(Sum28),
.EditOut(EditOut9));


eightbitSneakySnake eightoneCC(
.SumIn(0),
.EditIn(0),
.clk(clk), 
.A(dna_main[72:79]), .B(dna_up_1[72:79]), .C(dna_up_2[72:79]), .D(dna_up_3[72:79]), .E(dna_up_4[72:79]), .F(dna_up_5[72:79]), .G(dna_down_1[72:79]), .H(dna_down_2[72:79]), .I(dna_down_3[72:79]) ,.J(dna_down_4[72:79]), .K(dna_down_5[72:79]), 
.Ao(dna_main_tl[72:79]), .Bo(dna_up_1_tl[72:79]), .Co(dna_up_2_tl[72:79]), .Do(dna_up_3_tl[72:79]), .Eo(dna_up_4_tl[72:79]), .Fo(dna_up_5_tl[72:79]), .Go(dna_down_1_tl[72:79]), .Ho(dna_down_2_tl[72:79]), .Io(dna_down_3_tl[72:79]), .Jo(dna_down_4_tl[72:79]), .Ko(dna_down_5_tl[72:79]), 
.SumOut(Sum29),
.Lives(Live27));

eightbitSneakySnake eightoneDD(
.SumIn(Sum29),
.EditIn(Live27),
.clk(clk), 
.A(dna_main_tl[72:79]), .B(dna_up_1_tl[72:79]), .C(dna_up_2_tl[72:79]), .D(dna_up_3_tl[72:79]), .E(dna_up_4_tl[72:79]), .F(dna_up_5_tl[72:79]), .G(dna_down_1_tl[72:79]), .H(dna_down_2_tl[72:79]), .I(dna_down_3_tl[72:79]) ,.J(dna_down_4_tl[72:79]), .K(dna_down_5_tl[72:79]), 
.Ao(dna_main_tl_one[72:79]), .Bo(dna_up_1_tl_one[72:79]), .Co(dna_up_2_tl_one[72:79]), .Do(dna_up_3_tl_one[72:79]), .Eo(dna_up_4_tl_one[72:79]), .Fo(dna_up_5_tl_one[72:79]), .Go(dna_down_1_tl_one[72:79]), .Ho(dna_down_2_tl_one[72:79]), .Io(dna_down_3_tl_one[72:79]), .Jo(dna_down_4_tl_one[72:79]), .Ko(dna_down_5_tl_one[72:79]), 
.SumOut(Sum30),
.Lives(Live28));


eightbitSneakySnake eightoneEE(
.SumIn(Sum30),
.EditIn(Live28),
.clk(clk), 
.A(dna_main_tl_one[72:79]), .B(dna_up_1_tl_one[72:79]), .C(dna_up_2_tl_one[72:79]), .D(dna_up_3_tl_one[72:79]), .E(dna_up_4_tl_one[72:79]), .F(dna_up_5_tl_one[72:79]), .G(dna_down_1_tl_one[72:79]), .H(dna_down_2_tl_one[72:79]), .I(dna_down_3_tl_one[72:79]) ,.J(dna_down_4_tl_one[72:79]), .K(dna_down_5_tl_one[72:79]), 
.Ao(dna_main_tl_two[72:79]), .Bo(dna_up_1_tl_two[72:79]), .Co(dna_up_2_tl_two[72:79]), .Do(dna_up_3_tl_two[72:79]), .Eo(dna_up_4_tl_two[72:79]), .Fo(dna_up_5_tl_two[72:79]), .Go(dna_down_1_tl_two[72:79]), .Ho(dna_down_2_tl_two[72:79]), .Io(dna_down_3_tl_two[72:79]), .Jo(dna_down_4_tl_two[72:79]), .Ko(dna_down_5_tl_two[72:79]), 
.SumOut(Sum31),
.EditOut(EditOutl0));


eightbitSneakySnake eightoneFF(
.SumIn(0),
.EditIn(0),
.clk(clk), 
.A(dna_main[80:87]), .B(dna_up_1[80:87]), .C(dna_up_2[80:87]), .D(dna_up_3[80:87]), .E(dna_up_4[80:87]), .F(dna_up_5[80:87]), .G(dna_down_1[80:87]), .H(dna_down_2[80:87]), .I(dna_down_3[80:87]) ,.J(dna_down_4[80:87]), .K(dna_down_5[80:87]), 
.Ao(dna_main_tl[80:87]), .Bo(dna_up_1_tl[80:87]), .Co(dna_up_2_tl[80:87]), .Do(dna_up_3_tl[80:87]), .Eo(dna_up_4_tl[80:87]), .Fo(dna_up_5_tl[80:87]), .Go(dna_down_1_tl[80:87]), .Ho(dna_down_2_tl[80:87]), .Io(dna_down_3_tl[80:87]), .Jo(dna_down_4_tl[80:87]), .Ko(dna_down_5_tl[80:87]), 
.SumOut(Sum32),
.Lives(Live30));

eightbitSneakySnake eightoneGG(
.SumIn(Sum32),
.EditIn(Live30),
.clk(clk), 
.A(dna_main_tl[80:87]), .B(dna_up_1_tl[80:87]), .C(dna_up_2_tl[80:87]), .D(dna_up_3_tl[80:87]), .E(dna_up_4_tl[80:87]), .F(dna_up_5_tl[80:87]), .G(dna_down_1_tl[80:87]), .H(dna_down_2_tl[80:87]), .I(dna_down_3_tl[80:87]) ,.J(dna_down_4_tl[80:87]), .K(dna_down_5_tl[80:87]), 
.Ao(dna_main_tl_one[80:87]), .Bo(dna_up_1_tl_one[80:87]), .Co(dna_up_2_tl_one[80:87]), .Do(dna_up_3_tl_one[80:87]), .Eo(dna_up_4_tl_one[80:87]), .Fo(dna_up_5_tl_one[80:87]), .Go(dna_down_1_tl_one[80:87]), .Ho(dna_down_2_tl_one[80:87]), .Io(dna_down_3_tl_one[80:87]), .Jo(dna_down_4_tl_one[80:87]), .Ko(dna_down_5_tl_one[80:87]), 
.SumOut(Sum33),
.Lives(Live31));


eightbitSneakySnake eightoneHH(
.SumIn(Sum33),
.EditIn(Live31),
.clk(clk), 
.A(dna_main_tl_one[80:87]), .B(dna_up_1_tl_one[80:87]), .C(dna_up_2_tl_one[80:87]), .D(dna_up_3_tl_one[80:87]), .E(dna_up_4_tl_one[80:87]), .F(dna_up_5_tl_one[80:87]), .G(dna_down_1_tl_one[80:87]), .H(dna_down_2_tl_one[80:87]), .I(dna_down_3_tl_one[80:87]) ,.J(dna_down_4_tl_one[80:87]), .K(dna_down_5_tl_one[80:87]), 
.Ao(dna_main_tl_two[80:87]), .Bo(dna_up_1_tl_two[80:87]), .Co(dna_up_2_tl_two[80:87]), .Do(dna_up_3_tl_two[80:87]), .Eo(dna_up_4_tl_two[80:87]), .Fo(dna_up_5_tl_two[80:87]), .Go(dna_down_1_tl_two[80:87]), .Ho(dna_down_2_tl_two[80:87]), .Io(dna_down_3_tl_two[80:87]), .Jo(dna_down_4_tl_two[80:87]), .Ko(dna_down_5_tl_two[80:87]), 
.SumOut(Sum34),
.EditOut(EditOutl1));



eightbitSneakySnake eightoneII(
.SumIn(0),
.EditIn(0),
.clk(clk), 
.A(dna_main[88:95]), .B(dna_up_1[88:95]), .C(dna_up_2[88:95]), .D(dna_up_3[88:95]), .E(dna_up_4[88:95]), .F(dna_up_5[88:95]), .G(dna_down_1[88:95]), .H(dna_down_2[88:95]), .I(dna_down_3[88:95]) ,.J(dna_down_4[88:95]), .K(dna_down_5[88:95]), 
.Ao(dna_main_tl[88:95]), .Bo(dna_up_1_tl[88:95]), .Co(dna_up_2_tl[88:95]), .Do(dna_up_3_tl[88:95]), .Eo(dna_up_4_tl[88:95]), .Fo(dna_up_5_tl[88:95]), .Go(dna_down_1_tl[88:95]), .Ho(dna_down_2_tl[88:95]), .Io(dna_down_3_tl[88:95]), .Jo(dna_down_4_tl[88:95]), .Ko(dna_down_5_tl[88:95]), 
.SumOut(Sum35),
.Lives(Live33));

eightbitSneakySnake eightoneJJ(
.SumIn(Sum35),
.EditIn(Live33),
.clk(clk), 
.A(dna_main_tl[88:95]), .B(dna_up_1_tl[88:95]), .C(dna_up_2_tl[88:95]), .D(dna_up_3_tl[88:95]), .E(dna_up_4_tl[88:95]), .F(dna_up_5_tl[88:95]), .G(dna_down_1_tl[88:95]), .H(dna_down_2_tl[88:95]), .I(dna_down_3_tl[88:95]) ,.J(dna_down_4_tl[88:95]), .K(dna_down_5_tl[88:95]), 
.Ao(dna_main_tl_one[88:95]), .Bo(dna_up_1_tl_one[88:95]), .Co(dna_up_2_tl_one[88:95]), .Do(dna_up_3_tl_one[88:95]), .Eo(dna_up_4_tl_one[88:95]), .Fo(dna_up_5_tl_one[88:95]), .Go(dna_down_1_tl_one[88:95]), .Ho(dna_down_2_tl_one[88:95]), .Io(dna_down_3_tl_one[88:95]), .Jo(dna_down_4_tl_one[88:95]), .Ko(dna_down_5_tl_one[88:95]), 
.SumOut(Sum36),
.Lives(Live34));


eightbitSneakySnake eightoneKK(
.SumIn(Sum36),
.EditIn(Live34),
.clk(clk), 
.A(dna_main_tl_one[88:95]), .B(dna_up_1_tl_one[88:95]), .C(dna_up_2_tl_one[88:95]), .D(dna_up_3_tl_one[88:95]), .E(dna_up_4_tl_one[88:95]), .F(dna_up_5_tl_one[88:95]), .G(dna_down_1_tl_one[88:95]), .H(dna_down_2_tl_one[88:95]), .I(dna_down_3_tl_one[88:95]) ,.J(dna_down_4_tl_one[88:95]), .K(dna_down_5_tl_one[88:95]), 
.Ao(dna_main_tl_two[88:95]), .Bo(dna_up_1_tl_two[88:95]), .Co(dna_up_2_tl_two[88:95]), .Do(dna_up_3_tl_two[88:95]), .Eo(dna_up_4_tl_two[88:95]), .Fo(dna_up_5_tl_two[88:95]), .Go(dna_down_1_tl_two[88:95]), .Ho(dna_down_2_tl_two[88:95]), .Io(dna_down_3_tl_two[88:95]), .Jo(dna_down_4_tl_two[88:95]), .Ko(dna_down_5_tl_two[88:95]), 
.SumOut(Sum37),
.EditOut(EditOutl2));


always @(posedge clk)
begin 
	MinEdit = EditOutl + EditOut2 + EditOut3 + EditOut4 + EditOut5 + EditOut6 + EditOut7 + EditOut8 + EditOut9 + EditOutl0 + EditOutl1 + EditOutl2;
	if(MinEdit <= ErrorTh)
		Accepted = 1'b1;
	else 
		Accepted = 1'b0;
end 


endmodule 

