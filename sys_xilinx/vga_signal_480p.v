`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2023 09:25:34 AM
// Design Name: 
// Module Name: vga_signal_480p
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Generate a VGA 640x480 60Hz signal
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// Señal horizontal
// ------------------------------------------
// |   Area visible      |H.FP| HSync  |H.BP|
// |                     |    |        |    |
// ------------------------------------------
// Señal vertical
// |    V.FP             |    |        |    |
// ------------------------------------------
// |    VSync            |    |        |    |
// ------------------------------------------
// |    V.BP             |    |        |    |
// ------------------------------------------
// Pixels:              Hor.    Vert.
// Visible              640     480
// Front Porch          16      10
// Sincronismo          96      2
// Back Porch           48      33
// Total                800     525
// Total blank          160     45
//////////////////////////////////////////////////////////////////////////////////


module vga_signal_480p(
    input wire  clk_pix,
    input wire  reset_pix,
    output wire [9:0] sx,
    output wire [9:0] sy,
    output wire  hsyncn,
    output wire  vsyncn,
    output wire  de
    );
    
    // horizontal timings
    parameter HVIS_FIN = 639;             // end of active pixels
    parameter HSYN_INI = HVIS_FIN + 16;   // sync starts after front porch
    parameter HSYN_END = HSYN_INI + 96;   // sync ends
    parameter HOR_FIN  = 799;            // last pixel on line (after back porch)

    // vertical timings
    parameter VVIS_FIN = 479;             // end of active pixels
    parameter VSYN_INI = VVIS_FIN + 10;   // sync starts after front porch
    parameter VSYN_FIN = VSYN_INI + 2;    // sync ends
    parameter VER_FIN  = 524;             // last line on screen (after back porch)
    
    //reg for x,y pixel coord
    reg [9:0] cx_r;
    reg [9:0] cy_r;
    
    //x,y pixel output
    assign sx = cx_r;
    assign sy = cy_r;
    
    //sync and de signal
    assign hsyncn = ~(cx_r >= HSYN_INI && cx_r < HSYN_END);  // hsync: negative polarity
    assign vsyncn = ~(cy_r >= VSYN_INI && cy_r < VSYN_FIN);  // invert: negative polarity
    assign de = (cx_r <= HVIS_FIN && cy_r <= VVIS_FIN);

    // calculate horizontal and vertical screen position
    always @(posedge clk_pix) begin
        if (reset_pix) begin
            cx_r <= 10'd0;
            cy_r <= 10'd0;
        end 
        else if (cx_r == HOR_FIN) begin  // last pixel on line?
            cx_r <= 0;
            cy_r <= (cy_r == VER_FIN) ? 0 : cy_r + 1'b1;  // last line on screen?
        end else begin
            cx_r <= cx_r + 1'b1;
        end

    end

endmodule
