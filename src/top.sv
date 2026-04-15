`include "src/decoder.sv"
`include "src/adder.sv"


module top(
    //Input Ports
    val1,
    val2,
    //Output 
    seg7
);

input wire [3:0] val1;
input wire [3:0] val2;

output logic [7:0] seg7;
logic [4:0] result;

adder add(
    .val1(val1),
    .val2(val2),
    .res(result)
);

decoder decode(
    .bcd(result[3:0]),
    .seg7(seg7[6:0])
);

    always@(*)
        begin
            //inverted for common anode 7-seg
            if (result[4]) begin
                seg7[7] = 1'b0;
            end else begin
                seg7[7] = 1'b1;
            end
        end
endmodule