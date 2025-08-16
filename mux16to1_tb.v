`timescale 1ns / 1ps  //in general 

module mux16to1_tb; //done have ( ... )

    // 1. Inputs (reg) and outputs(wire) * no need to mention output and input 
    reg [15:0] din;
    reg [3:0] sel;
    wire y;

    // 2. Instantiate DUT
    mux16to1 M (.din(din), .sel(sel), .out(out)); //outside is testbench 

    // 3. Stimulus for inputs 
    initial begin
        din = 16'h3f0a; sel = 4'b0000;
        #5 sel = 4'b0001;
        #5 sel = 4'b0010;
        #5 sel = 4'b0011;
        #5 $finish;   //must 
    end

    // Waveform dump
    initial begin
        $dumpfile("mux16to1.vcd");
        $dumpvars(0, mux16to1_tb); //testbench name 
    end

    // Monitor signals
    initial begin
        $monitor("Time=%0t | din=%b | sel=%b | y=%b", $time, din, sel, out);
    end

endmodule
