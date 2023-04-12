module clock_divider(clk_in, clk_out);
  output reg clk_out;
  input clk_in;
    reg[26:0]counter=27'd0;
    
parameter DIVISOR= 27'd100000000;//the internal clock frequency of Basys-3 board is 100MHz
always @(posedge clk_in)
begin
 counter <= counter + 27'd1;
 if(counter>=(DIVISOR-1))
  counter <= 27'd0;
 clk_out <= (counter<DIVISOR/2)?1'b1:1'b0;//duty cycle of 50% for the output signal clk_out
end

endmodule 
