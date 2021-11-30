`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/01/2020 09:52:40 PM
// Design Name: 
// Module Name: RightShifter
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


module RightShifter(
    input logic [15:0] in,
    input logic [3:0] shift,
    output logic [15:0] y
    );
    logic [15:0] s0, s1, s2;
    //stage 0, shift 0 or 1 bit
    assign s0 = shift[0] ? {in[0], in[15:1]} : in;
     //stage 1, shift 0 or 2 bits
    assign s1 = shift[1] ? {s0[1:0], s0[15:2]} : s0;
    //stage 2, shift 0 or 4 bits
    assign s2 = shift[2] ? {s1[3:0], s1[15:4]} : s1;
    //stage 3, shift 0 or 8 bits
    assign y = shift[3] ? {s1[7:0], s1[15:8]} : s2;  

endmodule
