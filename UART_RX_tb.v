`timescale 1ns/1ns

module UART_RX_tb #(
    parameter DATA_WIDTH=8,
    PRESCALE_8=8,

    START_BIT=0,
    STOP_BIT=1,

    IDLE=0,
    START_REC=1,
    DATA_REC=2,
    PAR_REC=3,
    STOP_REC=4
)();
integer i;
reg clk_flag;

reg SRL_data_tb;
reg [4:0] prescale_tb;
reg PAR_EN_tb;
reg PAR_TYP_tb;

reg clk_tb;
reg rst_tb;

wire [DATA_WIDTH-1:0] P_DATA_tb;
wire                  Data_Valid_reg_tb;

UART_RX U0_UART_RX(
    .SRL_data(SRL_data_tb),
    .prescale(prescale_tb),
    .PAR_EN(PAR_EN_tb),
    .PAR_TYP(PAR_TYP_tb),

    .clk(clk_tb),
    .rst(rst_tb),

    .P_DATA(P_DATA_tb),
    .Data_Valid_reg(Data_Valid_reg_tb)    
);

always #5  clk_tb=~clk_tb;


initial
begin
    clk_flag=0;
    clk_tb=0;
    rst_tb=0;
    PAR_EN_tb=1;
    PAR_TYP_tb=0;
    prescale_tb=PRESCALE_8;

    SRL_data_tb=STOP_BIT;
end


initial 
begin
    $dumpfile("serializer.vcd");
    $dumpvars;
    reset(); //2
    SRL_data_tb=STOP_BIT;
    #10

    //sending new data packets
    SRL_data_tb=START_BIT; //2
    #80
    send_serial_data('b101100111);
    SRL_data_tb=STOP_BIT;
    #80
    if(U0_UART_RX.stop_err == 0)
    begin
        $display("stop_bit is tarzsmitted successfully !!, @time=%d", $time);
    end

    else
    begin
        $display("stop_bit is NOT tarzsmitted successfully !! stop_error=%d, @time=%d",U0_UART_RX.stop_err, $time);
    end
    
    //glitch on serial data which is not a real start bit
    start_bit_glitch();
    #60
    
    //stop_bit is corrupted in this data packet
    SRL_data_tb=START_BIT;
    #80
    send_serial_data('b010000111);
    SRL_data_tb=0; //stop_bit is corrupted in this test
    #80
    if(U0_UART_RX.stop_err == 0)
    begin
        $display("stop_bit is tarzsmitted successfully !!@time=%d", $time);
    end

    else
    begin
        $display("stop_bit is NOT tarzsmitted successfully !! stop_error=%d, @time=%d",U0_UART_RX.stop_err, $time);
    end

    SRL_data_tb=STOP_BIT;
    #160
    SRL_data_tb=START_BIT;
    #80
    send_serial_data('b010000111);
    SRL_data_tb=STOP_BIT;
    #80
    if(U0_UART_RX.stop_err == 0)
    begin
        $display("stop_bit is tarzsmitted successfully !!@time=%d", $time);
    end

    else
    begin
        $display("stop_bit is NOT tarzsmitted successfully !! stop_error=%d, @time=%d",U0_UART_RX.stop_err, $time);
    end

    
    #160
    SRL_data_tb=START_BIT;
    #80
    send_serial_data('b011101110);
    SRL_data_tb=STOP_BIT;
    #80
    if(U0_UART_RX.stop_err == 0)
    begin
        $display("stop_bit is tarzsmitted successfully !!@time=%d", $time);
    end

    else
    begin
        $display("stop_bit is NOT tarzsmitted successfully !! stop_error=%d, @time=%d",U0_UART_RX.stop_err, $time);
    end


    #160
    SRL_data_tb=START_BIT;
    #80
    send_serial_data('b101100111);
    SRL_data_tb=STOP_BIT;
    #80
    if(U0_UART_RX.stop_err == 0)
    begin
        $display("stop_bit is tarzsmitted successfully !!@time=%d", $time);
    end

    else
    begin
        $display("stop_bit is NOT tarzsmitted successfully !! stop_error=%d, @time=%d",U0_UART_RX.stop_err, $time);
    end


    #160
    SRL_data_tb=START_BIT;
    #80
    send_serial_data('b000110011);
    SRL_data_tb=STOP_BIT;
    #80
    if(U0_UART_RX.stop_err == 0)
    begin
        $display("stop_bit is tarzsmitted successfully !!@time=%d", $time);
    end

    else
    begin
        $display("stop_bit is NOT tarzsmitted successfully !! stop_error=%d, @time=%d",U0_UART_RX.stop_err, $time);
    end


    #160
    SRL_data_tb=START_BIT;
    #80
    send_serial_data('b000110011);
    SRL_data_tb=STOP_BIT;
    #80
    if(U0_UART_RX.stop_err == 0)
    begin
        $display("stop_bit is tarzsmitted successfully !!@time=%d", $time);
    end

    else
    begin
        $display("stop_bit is NOT tarzsmitted successfully !! stop_error=%d, @time=%d",U0_UART_RX.stop_err, $time);
    end



    #160
    SRL_data_tb=START_BIT;
    #80
    send_serial_data('b000110011);
    SRL_data_tb=STOP_BIT;
    #80
    if(U0_UART_RX.stop_err == 0)
    begin
        $display("stop_bit is tarzsmitted successfully !!@time=%d", $time);
    end

    else
    begin
        $display("stop_bit is NOT tarzsmitted successfully !! stop_error=%d, @time=%d",U0_UART_RX.stop_err, $time);
    end



    #160
    SRL_data_tb=START_BIT;
    #80
    send_serial_data('b000110011);
    SRL_data_tb=STOP_BIT;
    #80
    if(U0_UART_RX.stop_err == 0)
    begin
        $display("stop_bit is tarzsmitted successfully !!@time=%d", $time);
    end

    else
    begin
        $display("stop_bit is NOT tarzsmitted successfully !! stop_error=%d, @time=%d",U0_UART_RX.stop_err, $time);
    end



    #160
    SRL_data_tb=START_BIT;
    #80
    send_serial_data('b100110111);
    SRL_data_tb=STOP_BIT;
    #80
    if(U0_UART_RX.stop_err == 0)
    begin
        $display("stop_bit is tarzsmitted successfully !!@time=%d", $time);
    end

    else
    begin
        $display("stop_bit is NOT tarzsmitted successfully !! stop_error=%d, @time=%d",U0_UART_RX.stop_err, $time);
    end


    #160
    SRL_data_tb=START_BIT;
    #80
    send_serial_data('b010000111);
    SRL_data_tb=STOP_BIT;
    #80
    if(U0_UART_RX.stop_err == 0)
    begin
        $display("stop_bit is tarzsmitted successfully !!@time=%d", $time);
    end

    else
    begin
        $display("stop_bit is NOT tarzsmitted successfully !! stop_error=%d, @time=%d",U0_UART_RX.stop_err, $time);
    end

    
    #160
    SRL_data_tb=START_BIT;
    #80
    send_serial_data('b011101110);
    SRL_data_tb=STOP_BIT;
    #80
    if(U0_UART_RX.stop_err == 0)
    begin
        $display("stop_bit is tarzsmitted successfully !!@time=%d", $time);
    end

    else
    begin
        $display("stop_bit is NOT tarzsmitted successfully !! stop_error=%d, @time=%d",U0_UART_RX.stop_err, $time);
    end


    #160
    SRL_data_tb=START_BIT;
    #80
    send_serial_data('b101100111);
    SRL_data_tb=STOP_BIT;
    #80
    if(U0_UART_RX.stop_err == 0)
    begin
        $display("stop_bit is tarzsmitted successfully !!@time=%d", $time);
    end

    else
    begin
        $display("stop_bit is NOT tarzsmitted successfully !! stop_error=%d, @time=%d",U0_UART_RX.stop_err, $time);
    end


    #160
    SRL_data_tb=START_BIT;
    #80
    send_serial_data('b000110011);
    SRL_data_tb=STOP_BIT;
    #80
    if(U0_UART_RX.stop_err == 0)
    begin
        $display("stop_bit is tarzsmitted successfully !!@time=%d", $time);
    end

    else
    begin
        $display("stop_bit is NOT tarzsmitted successfully !! stop_error=%d, @time=%d",U0_UART_RX.stop_err, $time);
    end


    #160
    SRL_data_tb=START_BIT;
    #80
    send_serial_data('b000110011);
    SRL_data_tb=STOP_BIT;
    #80
    if(U0_UART_RX.stop_err == 0)
    begin
        $display("stop_bit is tarzsmitted successfully !!@time=%d", $time);
    end

    else
    begin
        $display("stop_bit is NOT tarzsmitted successfully !! stop_error=%d, @time=%d",U0_UART_RX.stop_err, $time);
    end



    #160
    SRL_data_tb=START_BIT;
    #80
    send_serial_data('b000110011);
    SRL_data_tb=STOP_BIT;
    #80
    if(U0_UART_RX.stop_err == 0)
    begin
        $display("stop_bit is tarzsmitted successfully !!@time=%d", $time);
    end

    else
    begin
        $display("stop_bit is NOT tarzsmitted successfully !! stop_error=%d, @time=%d",U0_UART_RX.stop_err, $time);
    end



    #160
    SRL_data_tb=START_BIT;
    #80
    send_serial_data('b000110011);
    SRL_data_tb=STOP_BIT;
    #80
    if(U0_UART_RX.stop_err == 0)
    begin
        $display("stop_bit is tarzsmitted successfully !!@time=%d", $time);
    end

    else
    begin
        $display("stop_bit is NOT tarzsmitted successfully !! stop_error=%d, @time=%d",U0_UART_RX.stop_err, $time);
    end



    SRL_data_tb=START_BIT;
    #80
    send_serial_data('b001110010);
    SRL_data_tb=STOP_BIT;
    #80
    if(U0_UART_RX.stop_err == 0)
    begin
        $display("stop_bit is tarzsmitted successfully !!@time=%d", $time);
    end

    else
    begin
        $display("stop_bit is NOT tarzsmitted successfully !! stop_error=%d, @time=%d",U0_UART_RX.stop_err, $time);
    end


    

end



task reset();
begin
    rst_tb=0;
    #2
    rst_tb=1;
end
endtask

task send_serial_data(input [DATA_WIDTH:0] srl_data);
begin

    // #10 
    for(i=0; i<=DATA_WIDTH-1; i=i+1)
    begin
        SRL_data_tb=srl_data[i];   
        #80
        if(srl_data[i]==U0_UART_RX.U0_DESERIALIZER.P_DATA[DATA_WIDTH-1])
        begin
            $display("bit no %d is transmitted !! @time=%d",i, $time);
        end

        else
        begin
            $display("bit no %d is NOT transmitted !!@time=%d",i, $time);
        end 
    end
    SRL_data_tb=srl_data[8];
    #80
    if(U0_UART_RX.parity_err == 0)
    begin
        $display("parity_bit is tarzsmitted successfully !!@time=%d", $time);
    end

    else
    begin
        $display("parity_bit is NOT tarzsmitted successfully !! parity_error=%d, @time=%d",U0_UART_RX.parity_err, $time);
    end
end
endtask

task start_bit_glitch();
begin
    SRL_data_tb=START_BIT;
    #20 //start bit here is just a glitch
    SRL_data_tb=STOP_BIT;
    
end
endtask


endmodule