`timescale 1ns / 1ps

module top_array_multiplier(A, B, P);
    input [3:0]A, B;
    output [7:0]P;//product of two 4-bit numbers is 8-bits
 
    wire [11:0]cy; //intermediate carries
    wire [5:0]sum; //intermediate sums
    
    //structural code for array multiplier using halfadders and fulladders//
    assign P[0]= A[0]*B[0];
    halfadder h1(.a(A[0]&B[1]), .b(A[1]&B[0]), .sum(P[1]), .carry(cy[0]));
    fulladder fa1(.a(A[2]&B[0]), .b(A[1]&B[1]), .cin(cy[0]), .sum(sum[0]), .cout(cy[1]));
    fulladder fa2(.a(A[2]&B[1]), .b(A[3]&B[0]), .cin(cy[1]), .sum(sum[1]), .cout(cy[2]));
    halfadder h2(.a(A[0]&B[2]), .b(sum[0]), .sum(P[2]), .carry(cy[3]));
    fulladder fa3(.a(A[1]&B[2]), .b(sum[1]), .cin(cy[3]), .sum(sum[2]), .cout(cy[4]));
    fulladder fa4(.a(A[3]&B[1]), .b(cy[2]), .cin(cy[4]), .sum(sum[3]), .cout(cy[5]));
    halfadder h3(.a(A[0]&B[3]), .b(sum[2]), .sum(P[3]), .carry(cy[6]));
    fulladder fa5(.a(A[2]&B[2]), .b(sum[3]), .cin(cy[6]), .sum(sum[4]), .cout(cy[7]));
    fulladder fa6(.a(A[3]&B[2]), .b(cy[7]), .cin(cy[5]), .sum(sum[5]), .cout(cy[8]));
    halfadder h4(.a(A[1]&B[3]), .b(sum[4]), .sum(P[4]), .carry(cy[9]));
    fulladder fa7(.a(A[2]&B[3]), .b(sum[5]), .cin(cy[9]), .sum(P[5]), .cout(cy[10]));
    fulladder fa8(.a(A[3]&B[3]), .b(cy[10]), .cin(cy[8]), .sum(P[6]), .cout(P[7]));
    
endmodule