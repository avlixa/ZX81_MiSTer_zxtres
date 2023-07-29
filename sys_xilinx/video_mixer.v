//
//
// Copyright (c) 2017,2021 Alexey Melnikov
//
// This program is GPL Licensed. See COPYING for the full license.
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

//
// LINE_LENGTH: Length of  display line in pixels
//              Usually it's length from HSync to HSync.
//              May be less if line_start is used.
//
// HALF_DEPTH:  If =1 then color dept is 4 bits per component
//
// altera message_off 10720 
// altera message_off 12161

module video_mixer
#(
	parameter LINE_LENGTH  = 768,
	parameter HALF_DEPTH   = 0
)
(
	input            reset,
	input            CLK_VIDEO, // should be multiple by (ce_pix*4)
	input            CLK_PIXVGA, //Clock pixel VGA
	output reg       CE_PIXEL,  // output pixel clock enable

	input            ce_pix,    // input pixel clock or clock_enable

	input            scandoubler,
	input            vfreq50hz,


	// color
	`ifndef ZX3
	input [DWIDTH:0] R,
	input [DWIDTH:0] G,
	input [DWIDTH:0] B,
	`else
	input I,
	input R,
	input G,
	input B,
	`endif

	// Positive pulses.
	input            HSync,
	input            VSync,
	input            HBlank,
	input            VBlank,
   
   //ZPUFlex OSD
   input wire   osd_window,
   input wire   osd_pixel,
   input wire [2:0]  osd_bkgr,

	// video output signals
`ifndef ZX1
	output wire [5:0] VGA_R,
	output wire [5:0] VGA_G,
	output wire [5:0] VGA_B,
`else
	output wire [2:0] VGA_R,
	output wire [2:0] VGA_G,
	output wire [2:0] VGA_B,
	//output wire       PAL,
	//output wire       NTSC,
`endif
	output reg       VGA_VS,
	output reg       VGA_HS,
	output reg       VGA_DE
);

   localparam DWIDTH = HALF_DEPTH ? 3 : 5;
   localparam DWIDTH_SD =  DWIDTH;
   localparam HALF_DEPTH_SD =  HALF_DEPTH;


    //señal fija vga para ZX3
    wire hsyncvgan,vsyncvgan,devga;
    wire [9:0] cx, cy;


  `ifndef ZX3
   wire [DWIDTH:0] R_in  = R;
   wire [DWIDTH:0] G_in  = G;
   wire [DWIDTH:0] B_in  = B;
   wire framebuffer = 1'b0;
   `else
   wire [DWIDTH:0] R_in  = {R,{DWIDTH{I & R}}};
   wire [DWIDTH:0] G_in  = {G,{DWIDTH{I & G}}};
   wire [DWIDTH:0] B_in  = {B,{DWIDTH{I & B}}};
   
   wire [DWIDTH_SD:0] R_fb  = {data_b[2],{DWIDTH_SD{data_b[3] & data_b[2]}}};
   wire [DWIDTH_SD:0] G_fb  = {data_b[1],{DWIDTH_SD{data_b[3] & data_b[1]}}};
   wire [DWIDTH_SD:0] B_fb  = {data_b[0],{DWIDTH_SD{data_b[3] & data_b[0]}}};
   wire framebuffer = scandoubler;
   `endif

   wire hs_g, vs_g;
   wire hb_g, vb_g;
   wire [DWIDTH_SD:0] R_gamma, G_gamma, B_gamma;

   generate
      assign {R_gamma,G_gamma,B_gamma} = {R_in,G_in,B_in};
      assign {hs_g, vs_g, hb_g, vb_g} = {HSync, VSync, HBlank, VBlank};
   endgenerate

   wire [DWIDTH_SD:0] R_sd;
   wire [DWIDTH_SD:0] G_sd;
   wire [DWIDTH_SD:0] B_sd;
   wire hs_sd, vs_sd, hb_sd, vb_sd, ce_pix_sd;

   scandoubler #(.LENGTH(LINE_LENGTH), .HALF_DEPTH(HALF_DEPTH_SD)) sd
   (
      .clk_vid(CLK_VIDEO),
      .hq2x(1'b0),

      .ce_pix(ce_pix),
      .hs_in(hs_g),
      .vs_in(vs_g),
      .hb_in(hb_g),
      .vb_in(vb_g),
      .r_in(R_gamma),
      .g_in(G_gamma),
      .b_in(B_gamma),

      .ce_pix_out(ce_pix_sd),
      .hs_out(hs_sd),
      .vs_out(vs_sd),
      .hb_out(hb_sd),
      .vb_out(vb_sd),
      .r_out(R_sd),
      .g_out(G_sd),
      .b_out(B_sd)
   );

   wire [DWIDTH_SD:0] rt = framebuffer? R_fb : (scandoubler ? R_sd : R_gamma);
   wire [DWIDTH_SD:0] gt = framebuffer? G_fb : (scandoubler ? G_sd : G_gamma);
   wire [DWIDTH_SD:0] bt = framebuffer? B_fb : (scandoubler ? B_sd : B_gamma);

   reg [7:0] vga_red_i, vga_green_i, vga_blue_i;

   always @(posedge CLK_VIDEO) begin :block_video
      reg [5:0] r,g,b;
      reg hde,vde,hs,vs, old_vs;
      reg old_hde;
      reg old_ce;
      reg ce_osc, fs_osc;
      
      old_ce <= ce_pix;
      ce_osc <= ce_osc | (old_ce ^ ce_pix);

      old_vs <= vs;
      if(~old_vs & vs) begin
         fs_osc <= ce_osc;
         ce_osc <= 0;
      end

      CE_PIXEL <= framebuffer? CLK_PIXVGA :  scandoubler ? ce_pix_sd : fs_osc ? (~old_ce & ce_pix) : ce_pix;

      if( HALF_DEPTH) begin
         r <= {rt,rt[DWIDTH_SD:DWIDTH_SD-1]};
         g <= {gt,gt[DWIDTH_SD:DWIDTH_SD-1]};
         b <= {bt,bt[DWIDTH_SD:DWIDTH_SD-1]};
      end
      else begin
         r <= rt;
         g <= gt;
         b <= bt;
      end

      hde <= framebuffer? devga : scandoubler ? ~hb_sd : ~hb_g;
      vde <= framebuffer? devga : scandoubler ?  vb_sd :  vb_g;
      vs  <= framebuffer? vsyncvgan : scandoubler ?  vs_sd :  vs_g;
      hs  <= framebuffer? hsyncvgan : scandoubler ?  hs_sd :  hs_g;

      if(CE_PIXEL) begin
         vga_red_i   <= (!hde || !vde) ? 0 : {r,2'b0};
         vga_green_i <= (!hde || !vde) ? 0 : {g,2'b0};
         vga_blue_i  <= (!hde || !vde) ? 0 : {b,2'b0};

         VGA_VS <= vs;
         VGA_HS <= hs;

         old_hde <= hde;
         if(old_hde ^ hde) VGA_DE <= vde & hde;
      end
   end
   

   // ZPUFLEX OSD Overlay
   wire [7:0] vga_red_o, vga_green_o, vga_blue_o;

   OSD_Overlay ZPUFlex_overlay (
      .clk(CLK_VIDEO),
      .red_in(vga_red_i),
      .green_in(vga_green_i),
      .blue_in(vga_blue_i),
      .window_in(1'b1),
      .osd_window_in(osd_window),
      .osd_pixel_in(osd_pixel),
      .osd_bkgr_in(osd_bkgr),      
      .hsync_in(hs),
      .red_out(vga_red_o),
      .green_out(vga_green_o),
      .blue_out(vga_blue_o),
      .window_out( ),
      .scanline_ena(1'b0)
   );   

`ifndef ZX1   
   assign VGA_R = vga_red_o[7:2];
   assign VGA_G = vga_green_o[7:2];
   assign VGA_B = vga_blue_o[7:2];
`else
   assign VGA_R = vga_red_o[7:5];
   assign VGA_G = vga_green_o[7:5];
   assign VGA_B = vga_blue_o[7:5];
`endif

`ifdef ZX3 
//framebuffer 256x192=49152x4=196.608  2^16=65536 2^18 = 262144 // 328x¿308? =101024x4=404096  2^17=131072 
    vga_signal_480p vga_signal_480p(
        .clk_pix( CLK_PIXVGA ),
        .reset_pix( reset ),
        .sx( cx ),
        .sy( cy ),
        .hsyncn( hsyncvgan ),
        .vsyncn( vsyncvgan ),
        .de( devga )
        );
        reg [8:0] row,col;
        reg [16:0] add_a,add_b;
        reg [3:0] data_a;
        wire [3:0] data_b;
        reg [1:0] wren_a;
        
        
        dpram #(.DATAWIDTH(4), .ADDRWIDTH(17)) framebuffer_dpram
        (
            .clocka(CLK_VIDEO),
            .clockb(CLK_PIXVGA),
            .address_a(add_a),
            .wren_a(wren_a[0]),
            .data_a(data_a),
            //.q_a(),
            
            .address_b(add_b),
            //.data_b(),
            .wren_b(1'b0),
            .q_b(data_b)
        );

    always @(posedge CLK_VIDEO) begin :block_fbin
      reg old_hblank;
      wren_a[1] <= wren_a[0]; 
      if (reset) begin
        row <= 9'b0;
        col <= 9'b0;
        wren_a <= 2'b0;
      end
      else if (ce_pix) begin
        old_hblank <= HBlank;
        if (~VBlank) row <= vfreq50hz ? 9'h1e7 : 9'h1ff;
        else if (~HBlank & old_hblank) begin
            row <= row + 1'b1; 
            col <= 9'b0;
        end
        else col <= col + 1'b1;
        //if (HBlank) col <= 9'b0;
        //else col <= col + 1'b1;
        
        add_a <= {row[7:0],col};
        data_a <= {I,R,G,B};
        wren_a[0] <= 1'b1;
      end else begin
        wren_a[0] <= 1'b0;
      end 
    end

    always @(posedge CLK_PIXVGA) begin :block_fbout
      reg old_hblank;
      
      if (reset) begin
        add_b <= 17'b0;
        //data_b <= 4'b0;
      end
      else begin
        add_b <= {cy[8:1],cx[9:1]};
        //data_b <= {I,R,G,B};
      end 
    end    
      
`endif        

endmodule

