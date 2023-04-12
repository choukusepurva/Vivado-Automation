`timescale 1ns / 1ps

/*module top_mealy_0011(clk_in,rst,i,z, clk_out);
input clk_in,rst,i;
output reg z;
output clk_out;

clock_divider c1(clk_in, clk_out);
 
reg [1:0]y,Y;
parameter [1:0] A=2'b00,B=2'b01,C=2'b10,D=2'b11;
 
 
  always @(i or y)
   begin
   
          case(y)
             A:
                  begin
                      if(i)
                          begin
                            Y <= B;
                            z<=1'b0;
                          end  
                      else
                          begin
                          Y<=A;
                          z <=1'b0;  
                          end
                      end
             B:
                  begin
                      if(i)
                          begin
                            Y <= A;
                            z <=1'b0;
                          end
                      else
                          begin
                            Y <= C;
                            z <=1'b0;
                          end
                  end
             C:
              begin
                  if(i)
                  begin
                       Y <=D;
                       z <=1'b0;
                    end
                  else
                       begin
                        Y <= C;
                        z <=1'b0;
                      end
                         
                     
            end
            D :
            begin
              if(i)
                   begin
                    Y <= A;
                    z <=1'b1;
                   end  
              else
                    begin
                      Y <= B;
                      z <=1'b0;
                     end
           
            end
          endcase
   end
 
 always @(posedge clk_out or negedge rst)
 begin
     if(~rst)
             begin
              y <= A;  
             
             end
        else
              y<=Y;
 end
 
endmodule*/


module top_mealy_0011(out,clk_out,clk_in,rst,inp); //top module (Mealy Machine) 
  input clk_in,rst,inp; //Input Declaration 
  output out;        //Output Declaration 
  output clk_out;
  reg out ;      
  clock_divider c2(clk_in, clk_out);    
  reg [1:0] currentState,nextState; // 2-bit state numbers like                
                                    //00 corresponds to first/reset state
                                    //01 corresponds to second 
                                    //10 corresponds to third 
                                    //11 corresponds to fourth state 
  always @ (posedge clk_out or posedge rst)
   if (rst)
     currentState <= 0;  
   else
     currentState <= nextState;// update current state on positive clock

  always @ (posedge clk_out or posedge rst)
   if (rst)
     out <= 0;
   else
     out <= (currentState == 3) && inp; // sequence completed when current state is 3 and input is 1 so output 1
  
  always @ (*)
  begin
    case(currentState)
        0 :     nextState = inp ? 0 : 1 ; // If we are in state 0 and input = 1 then remain in state 0 and if input = 0 switch to next state  
        1 :     nextState = inp ? 0 : 2 ;
        2 :     nextState = inp ? 3 : 2 ;
        3 :     nextState = inp ? 0 : 1 ;
    endcase
  
  end
  
endmodule 


