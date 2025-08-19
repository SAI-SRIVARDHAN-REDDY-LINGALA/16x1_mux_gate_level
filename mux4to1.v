module mux4to1 (
    input [3:0] din,  
    input [1:0] sel,  
    output  out    // now its wire   not out since using 2to1 to make it 
);

    // always @(*) begin
    //     case (sel)
    //         2'b00: out = din[0];
    //         2'b01: out = din[1];
    //         2'b10: out = din[2];
    //         2'b11: out = din[3];
    //         default: out = 1'b0;
    //     endcase
    // end

 // 4to1 using 2to1 
     wire  [1:0] t;
 mux2to1 M0 (.din(din[1:0]),.sel(sel[0]),.out(t[0]));
 mux2to1 M1 (.din(din[3:2]),.sel(sel[0]),.out(t[1]));
 mux2to1 M2 (.din(t[1:0]),.sel(sel[1]),.out(out));


 // udp 

  input s0, s1, i0, i1, i2, i3;
 output f;
 table
        // s0 s1 i0 i1 i2 i3 : f
        0 0 0 ? ? ? : 0;
        0 0 1 ? ? ? : 1;
        1 0 ? 0 ? ? : 0;
        1 0 ? 1 ? ? : 1;
        0 1 ? ? 0 ? : 0;
        0 1 ? ? 1 ? : 1;
        1 1 ? ? ? 0 : 0;
        1 1 ? ? ? 1 : 1;
 endtable

endmodule
