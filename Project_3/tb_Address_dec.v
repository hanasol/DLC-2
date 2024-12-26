module tb_Address_dec;
    // 입력 신호
    reg [7:0] input_addr;
    // 출력 신호
    wire [7:0] S_sel;

    // 모듈 인스턴스화
    Address_dec uut (
        .input_addr(input_addr),
        .S_sel(S_sel)
    );

    // 테스트 벡터 실행
    initial begin
        $display("Starting Address_dec Testbench...");
        $monitor("Time = %0d, input_addr = %b, S_sel = %b", $time, input_addr, S_sel);

        // 테스트 케이스
        input_addr = 8'b00000000; #10; // 000
        input_addr = 8'b00100000; #10; // 001
        input_addr = 8'b01000000; #10; // 010
        input_addr = 8'b01100000; #10; // 011
        input_addr = 8'b10000000; #10; // 100
        input_addr = 8'b10100000; #10; // 101
        input_addr = 8'b11000000; #10; // 110
        input_addr = 8'b11100000; #10; // 111

        // 예외 케이스
        input_addr = 8'b11111000; #10; // Should map to 111
        input_addr = 8'b00001000; #10; // Should map to 000

        // 테스트 종료
        $finish;
    end
endmodule
