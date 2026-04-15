`include "src/top.sv"
`timescale 1ns/1ps         // Set tick to 1ns. Set sim resolution to 1ps.

/**
 * Note:
 *  The TB below is only an example of a testbench written in SV.
 *  Adapt this for your lab assignments as you see fit.
 *  An example clk signal has been added to show what a signal decl and usage looks like.
 *     You are welcome to delete the clk signal if it's not needed.
 *     For instance, purely combinational circuits do not need clks.
 *     So for labs without sequential elements, you can remove them.
 */

module top_tb;

/** declare tb signals below */
    reg [3:0] r_val1;
    reg [3:0] r_val2; 

    wire [7:0] w_seg7; 

/** declare module(s) below */
top dut                    // declare an inst of top called "dut" (device under test)
(
    /** hook up tb signals to dut signals */
    .val1(r_val1),
    .val2(r_val2),
    .seg7(w_seg7)
);

initial begin
    $dumpfile("build/top.vcd"); // intermediate file for waveform generation
    $dumpvars(0, top_tb);       // capture all signals under top_tb
end

initial begin
    /** testbench logic goes below */
    r_val1 = 4'd0;
    r_val2 = 4'd0;
    #200000

    r_val1 = 4'd0;
    r_val2 = 4'd15;
    #200000

    r_val1 = 4'd7;
    r_val2 = 4'd8;
    #200000

    r_val1 = 4'd4;
    r_val2 = 4'd5;
    #200000

    r_val1 = 4'd8;
    r_val2 = 4'd8;
    #200000

    r_val1 = 4'd15;
    r_val2 = 4'd1;
    #200000

    r_val1 = 4'd6;
    r_val2 = 4'd7;
    #200000

    r_val1 = 4'd10;
    r_val2 = 4'd10;
    #200000

    r_val1 = 4'd3;
    r_val2 = 4'd12;
    #200000

    r_val1 = 4'd6;
    r_val2 = 4'd10;
    #200000

    r_val1 = 4'd11;
    r_val2 = 4'd14;
    #200000

    r_val1 = 4'd15;
    r_val2 = 4'd15;
    #200000

    $finish;            // end simulation, otherwise it runs indefinitely
end

endmodule
