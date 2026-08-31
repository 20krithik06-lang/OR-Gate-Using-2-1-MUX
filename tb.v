module tb_magnitude_comparator;

reg [3:0] A, B;
wire A_greater, A_equal, A_less;

magnitude_comparator uut (
    .A(A),
        .B(B),
            .A_greater(A_greater),
                .A_equal(A_equal),
                    .A_less(A_less)
                    );

                    initial begin
                        $dumpfile("magnitude_comparator.vcd");
                            $dumpvars(0, tb_magnitude_comparator);

                                // Equal
                                    A = 4'b0101; B = 4'b0101; #10;

                                        // A > B
                                            A = 4'b1001; B = 4'b0110; #10;

                                                // A < B
                                                    A = 4'b0011; B = 4'b1010; #10;

                                                        // More test cases
                                                            A = 4'b1111; B = 4'b1111; #10;
                                                                A = 4'b1100; B = 4'b1011; #10;
                                                                    A = 4'b0010; B = 4'b0101; #10;

                                                                        $finish;
                                                                        end

                                                                        initial
                                                                            $monitor("A=%b B=%b | A>B=%b A=B=%b A<B=%b",
                                                                                         A, B, A_greater, A_equal, A_less);

                                                                                         endmodule