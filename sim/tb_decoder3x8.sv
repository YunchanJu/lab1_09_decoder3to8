`timescale 1ns/1ps

module tb_decoder3x8;

    reg a, b, c;
    wire [7:0] o;

    decoder3x8 dut(a, b, c, o);

    integer n, checked = 0;
    reg [7:0] expected;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_decoder3x8);

        for (n = 0; n < 8; n = n + 1) begin
            {a, b, c} = n;

            expected = 8'b00000001 << n;

            #10;

            if (o !== expected)
                $fatal(1,
                    "FAIL decoder3x8 vector=%0d expected=%b actual=%b",
                    n, expected, o);

            checked = checked + 1;
        end

        if (checked != 8)
            $fatal(1, "Incomplete test");

        $display("LAB1_PASS decoder3x8 cases=%0d", checked);
        $finish;
    end

    initial begin
        #100000;
        $fatal(1, "watchdog");
    end

endmodule