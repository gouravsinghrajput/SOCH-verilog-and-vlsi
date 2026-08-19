// =========================================================
//  Workshop: Basic Logic Gates in Verilog
//  File    : logic_gates_tb.v
//  Purpose : Stimulates logic_gates_design.v with all four
//            input combinations and dumps waveforms for
//            viewing in GTKWave.
// =========================================================

`timescale 1ns/1ps

module logic_gates_tb;

    reg  a, b;
    wire y_and, y_or, y_not, y_nand, y_nor, y_xor, y_xnor;

    // ---------------------------------------------------
    // Instantiate the student's design (DUT)
    // ---------------------------------------------------
    logic_gates dut (
        .a      (a),
        .b      (b),
        .y_and  (y_and),
        .y_or   (y_or),
        .y_not  (y_not),
        .y_nand (y_nand),
        .y_nor  (y_nor),
        .y_xor  (y_xor),
        .y_xnor (y_xnor)
    );

    // ---------------------------------------------------
    // Waveform dump for GTKWave
    // ---------------------------------------------------
    initial begin
        $dumpfile("logic_gates.vcd");
        $dumpvars(0, logic_gates_tb);
    end

    // ---------------------------------------------------
    // Stimulus: cycle through all 4 input combinations
    // ---------------------------------------------------
    initial begin
        a = 0; b = 0;
        #10 a = 0; b = 1;
        #10 a = 1; b = 0;
        #10 a = 1; b = 1;
        #10 a = 0; b = 0;
        #10 $finish;
    end

    // ---------------------------------------------------
    // Console log for quick sanity check (optional)
    // ---------------------------------------------------
    initial begin
        $display(" time  a b | and or not nand nor xor xnor");
        $monitor(" %4t  %b %b |  %b   %b   %b   %b    %b   %b   %b",
                  $time, a, b, y_and, y_or, y_not, y_nand, y_nor, y_xor, y_xnor);
    end

endmodule
