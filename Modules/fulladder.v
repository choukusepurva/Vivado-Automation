module fulladder(a, b, cin, sum, cout); //structural code for fulladder using halfadders
    input a, b, cin;
    output sum, cout;
    wire w1, carry1, carry2; //w1-> sum of HA1; carry1, carry2-> carry of HA1 & HA2 respectively
    halfadder h1(.a(a), .b(b), .sum(w1), .carry(carry1));
    halfadder h2(.a(cin), .b(w1), .sum(sum), .carry(carry2));
    assign cout= carry1 | carry2; //final carry = carry1 OR carry2
endmodule