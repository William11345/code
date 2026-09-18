`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/28 23:18:22
// Design Name: 
// Module Name: rstn_time
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rstn_time(
    input wClk   ,
    output reg nwReset

    );
//20ns 50  = 1us   50000 = 1ms
localparam  TIME_CNT_START = 32'd50000_000;
localparam  TIME_CNT_OVER  = 32'd100000_000;

reg [31:0] time_cnt = 0  ;


always @(posedge wClk) begin
    if(time_cnt < TIME_CNT_START)begin
        time_cnt <= time_cnt + 1 ;
        nwReset  <= 1 ;
    end
    else if( (time_cnt >= TIME_CNT_START) && (time_cnt < TIME_CNT_OVER) )begin
        time_cnt <= time_cnt + 1 ;
        nwReset  <= 0 ;
    end
    else begin
        time_cnt <= time_cnt ;
         nwReset  <= 1 ;
    end

    
end


endmodule
