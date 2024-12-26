`timescale 1ns/100ps

module tb_arbiter;
    // Inputs
    reg clk, reset_n, m0_req, m1_req, m2_req;

    // Outputs
    wire m0_grant, m1_grant, m2_grant;

    // Instantiate the arbiter module
    arbiter uut (
        .clk(clk),
        .reset_n(reset_n),
        .m0_req(m0_req),
        .m1_req(m1_req),
        .m2_req(m2_req),
        .m0_grant(m0_grant),
        .m1_grant(m1_grant),
        .m2_grant(m2_grant)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Testbench logic
    initial begin
        // Initialize inputs
        reset_n = 0; m0_req = 0; m1_req = 0; m2_req = 0;

        // Apply reset
        #10 reset_n = 1;

        // Test case 1: Reset condition, m0 has priority
        #10 reset_n = 0;
        #10 reset_n = 1;

        // Test case 2: m0 requests
        #10 m0_req = 1; m1_req = 0; m2_req = 0;

        // Test case 3: m1 requests, m0 does not request
        #10 m0_req = 0; m1_req = 1; m2_req = 0;

        // Test case 4: m2 requests, m0 and m1 do not request
        #10 m0_req = 0; m1_req = 0; m2_req = 1;

        // Test case 5: No requests, default to m0
        #10 m0_req = 0; m1_req = 0; m2_req = 0;

        // Test case 6: Multiple requests (m0 and m1)
        #10 m0_req = 1; m1_req = 1; m2_req = 1;

        // Finish simulation
        #50 $finish;
    end


endmodule
