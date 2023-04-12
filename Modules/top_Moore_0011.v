`timescale 1ns / 1ps
module top_Moore_0011(clk_in , reset,  din, dout, clk_out);
    input clk_in,reset,din;
    output dout, clk_out;
    clock_divider c1(clk_in, clk_out);
    parameter S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4=3'b100 ;//5 states required in Moore FSM for detection of 4-bit number
    reg [2:0]Y; //next state
    reg [2:0]y; //present state
    
     always @(din, y)
      begin
       case(y)
        
            S0:if(din) Y<=S0;
                else Y<=S1;
              
            S1:if(din) Y<=S0;
                else Y<=S2;
    
            S2:if(din) Y<=S3;
                else Y<=S2;
    
            S3:if(din) Y<=S4;
                else Y<=S1;
    
            S4:if(din) Y<=S0;
                else Y<=S1;
            
            default: Y<=2'bxx; 
                                     
    endcase
      end
    
 always @(posedge clk_out or negedge reset)
    begin
        if(reset)//active high reset
            y <= S0;//go to first state S0 on reset
        else
            y <= Y; 
    end

assign dout=(y==S4);

endmodule
