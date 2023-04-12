module top_RCA_8_bit (A, B, cin, Sum, cout);//structural code for 8-bit RCA using fullsdders
    input [7:0]A, B;
    input cin;
    output [7:0]Sum;
    output cout;
    wire carry[7:0];
    fulladder FA1(.a(A[0]), .b(B[0]), .cin(cin), .sum(Sum[0]), .cout(carry[0]));
    fulladder FA2(.a(A[1]), .b(B[1]), .cin(carry[0]), .sum(Sum[1]), .cout(carry[1]));//output carry of previous FA is input for next FA
    fulladder FA3(.a(A[2]), .b(B[2]), .cin(carry[1]), .sum(Sum[2]), .cout(carry[2]));
    fulladder FA4(.a(A[3]), .b(B[3]), .cin(carry[2]), .sum(Sum[3]), .cout(carry[3]));
    fulladder FA5(.a(A[4]), .b(B[4]), .cin(carry[3]), .sum(Sum[4]), .cout(carry[4]));
    fulladder FA6(.a(A[5]), .b(B[5]), .cin(carry[4]), .sum(Sum[5]), .cout(carry[5]));
    fulladder FA7(.a(A[6]), .b(B[6]), .cin(carry[5]), .sum(Sum[6]), .cout(carry[6]));
    fulladder FA8(.a(A[7]), .b(B[7]), .cin(carry[6]), .sum(Sum[7]), .cout(carry[7]));
    assign cout = carry[7]; //final carry[7] is cout

endmodule