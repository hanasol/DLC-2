module tb_bus;
    // 입력 신호
    reg clk, reset_n;
    reg m0_req, m0_wr, m1_req, m1_wr, m2_req, m2_wr;
    reg [7:0] m0_address, m1_address, m2_address;
    reg [31:0] m0_dout, m1_dout, m2_dout;
    reg [31:0] s0_dout, s1_dout, s2_dout, s3_dout, s4_dout, s5_dout, s6_dout, s7_dout;

    // 출력 신호
    wire m0_grant, m1_grant, m2_grant, s_wr;
    wire [31:0] m_din, s_din;
    wire [7:0] s_sel, s_address;

    // 모듈 인스턴스화
    bus uut (
        .clk(clk),
        .reset_n(reset_n),
        .m0_req(m0_req), .m0_wr(m0_wr), .m0_address(m0_address), .m0_dout(m0_dout),
        .m1_req(m1_req), .m1_wr(m1_wr), .m1_address(m1_address), .m1_dout(m1_dout),
        .m2_req(m2_req), .m2_wr(m2_wr), .m2_address(m2_address), .m2_dout(m2_dout),
        .s0_dout(s0_dout), .s1_dout(s1_dout), .s2_dout(s2_dout), .s3_dout(s3_dout),
        .s4_dout(s4_dout), .s5_dout(s5_dout), .s6_dout(s6_dout), .s7_dout(s7_dout),
        .m0_grant(m0_grant), .m1_grant(m1_grant), .m2_grant(m2_grant),
        .m_din(m_din), .s_sel(s_sel), .s_address(s_address), .s_wr(s_wr), .s_din(s_din)
    );

    // Clock 생성
    always #5 clk = ~clk;

    // 테스트 케이스
    initial begin
        // 초기화
        clk=1; reset_n = 0;
        m0_req = 0; m0_wr = 0; m0_address = 0; m0_dout = 0;
        m1_req = 0; m1_wr = 0; m1_address = 0; m1_dout = 0;
        m2_req = 0; m2_wr = 0; m2_address = 0; m2_dout = 0;
        s0_dout = 32'hAAAA_AAAA; s1_dout = 32'hBBBB_BBBB;
        s2_dout = 32'hCCCC_CCCC; s3_dout = 32'hDDDD_DDDD;
        s4_dout = 32'hEEEE_EEEE; s5_dout = 32'hFFFF_FFFF;
        s6_dout = 32'h1234_5678; s7_dout = 32'h8765_4321;

        #10 reset_n = 1; // Reset 해제

        // 테스트 1: m0가 요청을 보냄
        m0_req = 1; m0_wr = 1; m0_address = 8'b0000_0001; m0_dout = 32'h1111_1111;
        #20;

        // 테스트 2: m1이 요청을 보냄
        m0_req = 0; m1_req = 1; m1_wr = 0; m1_address = 8'b0010_0001; m1_dout = 32'h2222_2222;
        #20;

        // 테스트 3: m2가 요청을 보냄
        m1_req = 0; m2_req = 1; m2_wr = 1; m2_address = 8'b0100_0001; m2_dout = 32'h3333_3333;
        #20;

        // 테스트 4: s_sel과 m_din 확인
        m2_req = 0; m0_address=8'b1100_0001;
        #20;

        // 테스트 종료
        $finish;
    end
endmodule
