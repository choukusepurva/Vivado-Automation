`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IIT Gandhinagar
// Engineer: Purva Choukuse
// 
// Create Date: 05.01.2023 22:37:50
// Design Name: RCA_8bits
// Module Name: halfadder
// Project Name: Ripple Carry Adder (8 bits)

//////////////////////////////////////////////////////////////////////////////////


module halfadder(a, b, sum, carry); //structural code for halfadder
    input a, b;
    output sum, carry;
    assign sum = a ^ b; //sum= a XOR b
    assign carry = a & b; //carry = a AND b
endmodule
