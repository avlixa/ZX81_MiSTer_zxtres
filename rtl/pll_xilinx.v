// pll.v

`timescale 1 ps / 1 ps
module pll (
		input  wire  refclk,   //  refclk.clk   //50Mhz
		input  wire  rst,      //   reset.reset
		output wire  outclk_0, // outclk0.clk   //52Mhz // 52.083 ZXUNO
        output wire  outclk_1, // outclk1.clk   //156.25Mhz ZXUNO // 25,2 ZXTRES
		output wire  locked    //  locked.export
	);
   
   wire clk50, clk52, clk156, clkfbout, clkfbin;

   assign outclk_0 = clk52;
   assign outclk_1 = clk156;

  // Input buffering
  //------------------------------------
  IBUFG clkin1_buf
   (.O (clk50),
    .I (refclk));

  `ifdef ZX2
     `define ZX2_ZXD
  `elsif ZXD
     `define ZX2_ZXD
  `endif

  `ifdef ZX3
  // Clocking primitive for ZXTRES
  //------------------------------------
  wire locked_int;
  wire clkfb;
  wire clk0,clk1;
  wire clkfx;
    
    // MMCME2_ADV: Advanced Mixed Mode Clock Manager
   //             Artix-7
   // Xilinx HDL Language Template, version 2022.2

   MMCME2_ADV #(
      .BANDWIDTH("OPTIMIZED"),        // Jitter programming (OPTIMIZED, HIGH, LOW)
      .CLKFBOUT_MULT_F(26.0),          // Multiply value for all CLKOUT (2.000-64.000).
      //.CLKFBOUT_PHASE(0.0),           // Phase offset in degrees of CLKFB (-360.000-360.000).
      // CLKIN_PERIOD: Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
      .CLKIN1_PERIOD(20.0),
      //.CLKIN2_PERIOD(0.0),
      // CLKOUT0_DIVIDE - CLKOUT6_DIVIDE: Divide amount for CLKOUT (1-128)
      .CLKOUT1_DIVIDE(25),
      //.CLKOUT2_DIVIDE(1),
      //.CLKOUT3_DIVIDE(1),
      //.CLKOUT4_DIVIDE(1),
      //.CLKOUT5_DIVIDE(1),
      //.CLKOUT6_DIVIDE(1),
      .CLKOUT0_DIVIDE_F(51.625),         // Divide amount for CLKOUT0 (1.000-128.000). multiplo 0.125
      // CLKOUT0_DUTY_CYCLE - CLKOUT6_DUTY_CYCLE: Duty cycle for CLKOUT outputs (0.01-0.99).
      .CLKOUT0_DUTY_CYCLE(0.5),
      //.CLKOUT1_DUTY_CYCLE(0.5),
      //.CLKOUT2_DUTY_CYCLE(0.5),
      //.CLKOUT3_DUTY_CYCLE(0.5),
      //.CLKOUT4_DUTY_CYCLE(0.5),
      //.CLKOUT5_DUTY_CYCLE(0.5),
      //.CLKOUT6_DUTY_CYCLE(0.5),
      // CLKOUT0_PHASE - CLKOUT6_PHASE: Phase offset for CLKOUT outputs (-360.000-360.000).
      .CLKOUT0_PHASE(0.0),
      //.CLKOUT1_PHASE(0.0),
      //.CLKOUT2_PHASE(0.0),
      //.CLKOUT3_PHASE(0.0),
      //.CLKOUT4_PHASE(0.0),
      //.CLKOUT5_PHASE(0.0),
      //.CLKOUT6_PHASE(0.0),
      //.CLKOUT4_CASCADE("FALSE"),      // Cascade CLKOUT4 counter with CLKOUT6 (FALSE, TRUE)
      .COMPENSATION("ZHOLD"),         // ZHOLD, BUF_IN, EXTERNAL, INTERNAL
      .DIVCLK_DIVIDE(1),              // Master division value (1-106)
      // REF_JITTER: Reference input jitter in UI (0.000-0.999).
      .REF_JITTER1(0.0),
      //.REF_JITTER2(0.0),
      .STARTUP_WAIT("FALSE"),         // Delays DONE until MMCM is locked (FALSE, TRUE)
      // Spread Spectrum: Spread Spectrum Attributes
      .SS_EN("FALSE"),                // Enables spread spectrum (FALSE, TRUE)
      .SS_MODE("CENTER_HIGH"),        // CENTER_HIGH, CENTER_LOW, DOWN_HIGH, DOWN_LOW
      .SS_MOD_PERIOD(10000),          // Spread spectrum modulation period (ns) (VALUES)
      // USE_FINE_PS: Fine phase shift enable (TRUE/FALSE)
      .CLKFBOUT_USE_FINE_PS("FALSE"),
      .CLKOUT0_USE_FINE_PS("FALSE")
      //.CLKOUT1_USE_FINE_PS("FALSE"),
      //.CLKOUT2_USE_FINE_PS("FALSE"),
      //.CLKOUT3_USE_FINE_PS("FALSE"),
      //.CLKOUT4_USE_FINE_PS("FALSE"),
      //.CLKOUT5_USE_FINE_PS("FALSE"),
      //.CLKOUT6_USE_FINE_PS("FALSE")
   )
   MMCME2_ADV_inst (
      // Clock Outputs: 1-bit (each) output: User configurable clock outputs
      .CLKOUT0(clk1),             // 1-bit output: CLKOUT0
      //.CLKOUT0B(CLKOUT0B),         // 1-bit output: Inverted CLKOUT0
      .CLKOUT1(clkfx),           // 1-bit output: CLKOUT1
      //.CLKOUT1B(CLKOUT1B),         // 1-bit output: Inverted CLKOUT1
      //.CLKOUT2(CLKOUT2),           // 1-bit output: CLKOUT2
      //.CLKOUT2B(CLKOUT2B),         // 1-bit output: Inverted CLKOUT2
      //.CLKOUT3(CLKOUT3),           // 1-bit output: CLKOUT3
      //.CLKOUT3B(CLKOUT3B),         // 1-bit output: Inverted CLKOUT3
      //.CLKOUT4(CLKOUT4),           // 1-bit output: CLKOUT4
      //.CLKOUT5(CLKOUT5),           // 1-bit output: CLKOUT5
      //.CLKOUT6(CLKOUT6),           // 1-bit output: CLKOUT6
      // DRP Ports: 16-bit (each) output: Dynamic reconfiguration ports
      //.DO(DO),                     // 16-bit output: DRP data
      //.DRDY(DRDY),                 // 1-bit output: DRP ready
      // Dynamic Phase Shift Ports: 1-bit (each) output: Ports used for dynamic phase shifting of the outputs
      //.PSDONE(PSDONE),             // 1-bit output: Phase shift done
      // Feedback Clocks: 1-bit (each) output: Clock feedback ports
      .CLKFBOUT(clk0),         // 1-bit output: Feedback clock
      //.CLKFBOUTB(CLKFBOUTB),       // 1-bit output: Inverted CLKFBOUT
      // Status Ports: 1-bit (each) output: MMCM status ports
      //.CLKFBSTOPPED(CLKFBSTOPPED), // 1-bit output: Feedback clock stopped
      //.CLKINSTOPPED(CLKINSTOPPED), // 1-bit output: Input clock stopped
      .LOCKED(locked_int),           // 1-bit output: LOCK
      // Clock Inputs: 1-bit (each) input: Clock inputs
      .CLKIN1(clk50),             // 1-bit input: Primary clock
      //.CLKIN2(CLKIN2),             // 1-bit input: Secondary clock
      // Control Ports: 1-bit (each) input: MMCM control ports
      .CLKINSEL(1'b1),              // 1-bit input: Clock select, High=CLKIN1 Low=CLKIN2
      .PWRDWN(1'b0),                // 1-bit input: Power-down
      .RST(1'b0),                   // 1-bit input: Reset
      // DRP Ports: 7-bit (each) input: Dynamic reconfiguration ports
      .DADDR(),                     // 7-bit input: DRP address
      .DCLK(1'b0),                  // 1-bit input: DRP clock
      .DEN(1'b0),                   // 1-bit input: DRP enable
      .DI(),                        // 16-bit input: DRP data
      .DWE(1'b0),                   // 1-bit input: DRP write enable
      // Dynamic Phase Shift Ports: 1-bit (each) input: Ports used for dynamic phase shifting of the outputs
      .PSCLK(1'b0),              // 1-bit input: Phase shift clock
      .PSEN(1'b0),               // 1-bit input: Phase shift enable
      .PSINCDEC(1'b0),           // 1-bit input: Phase shift increment/decrement
      // Feedback Clocks: 1-bit (each) input: Clock feedback ports
      .CLKFBIN(clkfb)            // 1-bit input: Feedback clock
   );
   // End of MMCME2_ADV_inst instantiation
 
   assign locked = locked_int;

 
   // Output buffering
   //-----------------------------------
   BUFG clkf_buf
    (.O (clkfb),
     .I (clk0));
   BUFG clkout1_buf
   (.O   (clk52),
    .I   (clkfx));
   BUFG clkout2_buf
   (.O   (clk156),
    .I   (clk1));
    
  `elsif ZX2_ZXD
  // Clocking primitive for ZXDOS/ZXDOS+
  //------------------------------------

  // Instantiation of the DCM primitive
  //    * Unused inputs are tied off
  //    * Unused outputs are labeled unused
  wire        psdone_unused;
  wire        locked_int;
  wire [7:0]  status_int;
  wire clkfb;
  wire clk0;
  wire clkfx;
  DCM_SP
  #(.CLKDV_DIVIDE          (2.000),
    .CLKFX_DIVIDE          (25),
    .CLKFX_MULTIPLY        (26),
    .CLKIN_DIVIDE_BY_2     ("FALSE"),
    .CLKIN_PERIOD          (20.0),
    .CLKOUT_PHASE_SHIFT    ("NONE"),
    .CLK_FEEDBACK          ("1X"),
    .DESKEW_ADJUST         ("SYSTEM_SYNCHRONOUS"),
    .PHASE_SHIFT           (0),
    .STARTUP_WAIT          ("FALSE"))
  dcm_sp_inst
    // Input clock
   (.CLKIN                 (clk50),
    .CLKFB                 (clkfb),
    // Output clocks
    .CLK0                  (clk0),
    .CLK90                 (),
    .CLK180                (),
    .CLK270                (),
    .CLK2X                 (),
    .CLK2X180              (),
    .CLKFX                 (clkfx),
    .CLKFX180              (),
    .CLKDV                 (),
    // Ports for dynamic phase shift
    .PSCLK                 (1'b0),
    .PSEN                  (1'b0),
    .PSINCDEC              (1'b0),
    .PSDONE                (),
    // Other control and status signals
    .LOCKED                (locked_int),
    .STATUS                (status_int),
 
    .RST                   (rst),
    // Unused pin- tie low
    .DSSEN                 (1'b0));

    assign locked = locked_int;

  // Output buffering
  //-----------------------------------
  BUFG clkf_buf
   (.O (clkfb),
    .I (clk0));

  BUFG clkout1_buf
   (.O   (clk52),
    .I   (clkfx));
  
  assign clk156 = 1'b0;
    
  `else
  
  // Clocking primitive for ZXUNO
  //------------------------------------
  // Instantiation of the PLL primitive
  //    * Unused inputs are tied off
  //    * Unused outputs are labeled unused
  wire [15:0] do_unused;
  wire        drdy_unused;
  wire        clkfbout_buf;
  wire        clkout2_unused;
  wire        clkout3_unused;
  wire        clkout4_unused;
  wire        clkout5_unused;

  PLL_BASE
  #(.BANDWIDTH              ("OPTIMIZED"),
    .CLK_FEEDBACK           ("CLKFBOUT"),
    .COMPENSATION           ("SYSTEM_SYNCHRONOUS"),
    .DIVCLK_DIVIDE          (2),
    .CLKFBOUT_MULT          (25),
    .CLKFBOUT_PHASE         (0.000),
    .CLKOUT0_DIVIDE         (12),
    .CLKOUT0_PHASE          (0.000),
    .CLKOUT0_DUTY_CYCLE     (0.500),
    .CLKOUT1_DIVIDE         (4),
    .CLKOUT1_PHASE          (0.000),
    .CLKOUT1_DUTY_CYCLE     (0.500),
    .CLKIN_PERIOD           (20.000),
    .REF_JITTER             (0.010))
  pll_base_inst
    // Output clocks
   (.CLKFBOUT              (clkfbout),
    .CLKOUT0               (clkout0),
    .CLKOUT1               (clkout1),
    .CLKOUT2               (clkout2_unused),
    .CLKOUT3               (clkout3_unused),
    .CLKOUT4               (clkout4_unused),
    .CLKOUT5               (clkout5_unused),
    // Status and control signals
    .LOCKED                (locked),
    .RST                   (rst),
     // Input clock control
    .CLKFBIN               (clkfbout_buf),
    .CLKIN                 (clk50));


  // Output buffering
  //-----------------------------------
  BUFG clkf_buf
   (.O (clkfbout_buf),
    .I (clkfbout));

  BUFG clkout1_buf
   (.O   (clk52),
    .I   (clkout0));

  BUFG clkout2_buf
   (.O   (clk156),
    .I   (clkout1));
  `endif
endmodule

