`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2020 05:20:32 PM
// Design Name: 
// Module Name: reg_file
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


module reg_file
    #(parameter ADDR_WIDTH = 3, DATA_WIDTH = 8)
    (
        input logic clk,
        input logic w_en,
        input logic r_count,
        input logic [ADDR_WIDTH - 1: 0] r_addr, // reading address
        input logic [ADDR_WIDTH - 1: 0] w_addr, // writing address
        input logic [DATA_WIDTH*2 - 1: 0] w_data,
        output logic [DATA_WIDTH - 1: 0] r_data
    );
  
    // signal declaration
    logic [DATA_WIDTH*2 - 1: 0] memory [0: 2 ** ADDR_WIDTH - 1];
  
    // write operation
    always_ff @(posedge clk)
    begin
        if (w_en)
            memory[w_addr] <= w_data;       
    end
    // read operation
    assign r_data = (r_count == 0) ? memory[r_addr][DATA_WIDTH-1:0] : memory[r_addr][DATA_WIDTH*2-1:DATA_WIDTH];
endmodule