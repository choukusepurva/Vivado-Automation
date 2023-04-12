`timescale 1ns / 1ps

module top_priority_encoder_beh(A, Y,v); //behavioural code for 8:3 Priority Encoder

    input [8:0]Y;
    output reg [2:0]A;
    output reg v; //if all input bits are 0=>v=0; if any input bit is 1=>v=1

    always@(Y)
    begin
    casex(Y)
        8'b00000001:begin A = 3'b000; v=1; end
        8'b0000001x:begin A = 3'b001; v=1;end
        8'b000001xx:begin A = 3'b010; v=1; end
        8'b00001xxx:begin A = 3'b011; v=1; end
        8'b0001xxxx:begin A = 3'b100; v=1; end
        8'b001xxxxx:begin A = 3'b101; v=1; end
        8'b01xxxxxx:begin A = 3'b110; v=1; end
        8'b1xxxxxxx:begin A = 3'b111; v=1; end //priority given to the MSB bit in the encoder
        default: begin A=0; v=0; end
    endcase
    end
    
endmodule