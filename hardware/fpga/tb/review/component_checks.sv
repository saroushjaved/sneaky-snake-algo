`timescale 1ns/1ps
// New review checks; the imported RTL remains unchanged.
module component_checks;
    reg clk = 0;
    reg [0:199] query, reference;
    wire [0:99] rows [0:10];
    ChipMaze #(.LENGTH(200)) maze (
        .clk(clk), .dna_read(query), .dna_ref(reference),
        .dna_main(rows[5]),
        .dna_up_1(rows[6]), .dna_up_2(rows[7]), .dna_up_3(rows[8]),
        .dna_up_4(rows[9]), .dna_up_5(rows[10]),
        .dna_down_1(rows[4]), .dna_down_2(rows[3]), .dna_down_3(rows[2]),
        .dna_down_4(rows[1]), .dna_down_5(rows[0]));

    reg [2:0] a, b;
    reg va, vb;
    wire o0, o1, o2, valid;
    comp_3bit comparator (.A0(a[0]), .A1(a[1]), .A2(a[2]),
        .B0(b[0]), .B1(b[1]), .B2(b[2]), .Valid_1(va), .Valid_2(vb),
        .O_1(o0), .O_2(o1), .O_3(o2), .O_4(valid));
    integer trial, i, shift, source_index, j;
    integer seed = 20261026;
    reg expected;
    reg [3:0] expected_comp;

    initial begin
        // Exhaustive comparator truth table, including both validity inputs.
        // A zero validity propagates the all-zero/8-leading-zero sentinel.
        for (j = 0; j < 256; j = j + 1) begin
            {va, vb, a, b} = j;
            #1;
            if (va && vb) expected_comp = {1'b1, (a > b ? a : b)};
            else expected_comp = 4'b0000;
            if ({valid, o2, o1, o0} !== expected_comp)
                $fatal(1, "Comparator mismatch for vector %0d", j);
        end
        // Check 100-base maps at every shift, including masked boundaries.
        for (trial = 0; trial < 64; trial = trial + 1) begin
            for (i = 0; i < 200; i = i + 1) begin
                query[i] = $random(seed);
                reference[i] = $random(seed);
            end
            if (trial == 0) begin query = 0; reference = 0; end
            if (trial == 1) begin query = 0; reference = {200{1'b1}}; end
            if (trial == 2) reference = query;
            if (trial == 3) begin
                reference = query;
                reference[192:199] = ~query[192:199];
            end
            #5; clk = 1; #1;
            for (shift = -5; shift <= 5; shift = shift + 1) begin
                for (i = 0; i < 100; i = i + 1) begin
                    source_index = i + shift;
                    if (source_index < 0 || source_index >= 100) expected = 1;
                    else expected = (query[2*source_index +: 2] != reference[2*i +: 2]);
                    if (rows[shift+5][i] !== expected)
                        $fatal(1, "ChipMaze mismatch: trial=%0d shift=%0d base=%0d", trial, shift, i);
                end
            end
            clk = 0; #4;
        end
        $display("PASS: 256 comparator vectors and 70400 ChipMaze bit checks");
        $finish;
    end
endmodule
