module magnitude_comparator(
        input  [3:0] A,
            input  [3:0] B,
                output       A_greater,
                    output       A_equal,
                        output       A_less
                        );

                        wire e3, e2, e1, e0;

                        assign e3 = ~(A[3] ^ B[3]);
                        assign e2 = ~(A[2] ^ B[2]);
                        assign e1 = ~(A[1] ^ B[1]);
                        assign e0 = ~(A[0] ^ B[0]);

                        assign A_greater =
                               ( A[3] & ~B[3]) |
                                      ( e3 &  A[2] & ~B[2]) |
                                             ( e3 & e2 & A[1] & ~B[1]) |
                                                    ( e3 & e2 & e1 & A[0] & ~B[0]);

                                                    assign A_less =
                                                           (~A[3] & B[3]) |
                                                                  ( e3 & ~A[2] & B[2]) |
                                                                         ( e3 & e2 & ~A[1] & B[1]) |
                                                                                ( e3 & e2 & e1 & ~A[0] & B[0]);

                                                                                assign A_equal = e3 & e2 & e1 & e0;

                                                                                endmodule
