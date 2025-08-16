
module mux16to1 (  // write one by one instead of straight line 
    input  [15:0] din,   
    input  [3:0]  sel,   
    output   out   // now its not reg unlike in behavorial method ,bcz we are using instance   
);

//   16:1 MUX BEHAVOURIAL MODEL

// not valid in Verilog but in SV  ---> assign out  = in[sel]; ---> out is  wire here eventhough it is output so reg  

//     always @(*) begin
//         case (sel)
//             4'b0000: out = din[0];
//             4'b0001: out = din[1];
//             4'b0010: out = din[2];
//             4'b0011: out = din[3];
//             4'b0100: out = din[4];
//             4'b0101: out = din[5];
//             4'b0110: out = din[6];
//             4'b0111: out = din[7];
//             4'b1000: out = din[8];
//             4'b1001: out = din[9];
//             4'b1010: out = din[10];
//             4'b1011: out = din[11];
//             4'b1100: out = din[12];
//             4'b1101: out = din[13];
//             4'b1110: out = din[14];
//             4'b1111: out = din[15];
//             default: out = 1'b0;
//         endcase
//     end 


// 16x1 USING 4x1 MUXES

        wire [3:0] t;  // its wire even it 4to1 module out was reg

    // First stage (4 x 4-to-1 MUX)
    mux4to1 M0 (.din(din[3:0]),   .sel(sel[1:0]), .out(t[0]));  // MUST USE EXPLICIT 
    mux4to1 M1 (.din(din[7:4]),   .sel(sel[1:0]), .out(t[1]));
    mux4to1 M2 (.din(din[11:8]),  .sel(sel[1:0]), .out(t[2]));
    mux4to1 M3 (.din(din[15:12]), .sel(sel[1:0]), .out(t[3]));

    // Second stage (final 4-to-1 MUX)
    mux4to1 M4 (.din(t), .sel(sel[3:2]), .out(out));
                

endmodule
