module mux2to1 (
    input  [1:0] din,  
    input  sel,         
    output  out      
);
    // reg out ; 

    // always @(*) begin 
    //     case(sel)
    //         1'b0: out = din[0];
    //         1'b1: out = din[1];
    //     endcase   
    // end 

// Structural	modeling	of	2-to-1	MUX	// USE PRIMITIVE LOGIC GATES 


    wire t1, t2, t3; // intermediate wires

    not  G1 (t1, sel);       
    and  G2 (t2, din[0], t1); 
    and  G3 (t3, din[1], sel); 
    or   G4 (out, t2, t3);    
 
endmodule
