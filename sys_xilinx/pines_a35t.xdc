# Pines y estandares de niveles logicos
set_property CFGBVS VCCO [current_design]

##Clock
set_property -dict {PACKAGE_PIN Y18 IOSTANDARD LVCMOS33} [get_ports CLK50]

##Leds y Botones
set_property -dict {PACKAGE_PIN H13 IOSTANDARD LVCMOS33} [get_ports LED1]
set_property -dict {PACKAGE_PIN G15 IOSTANDARD LVCMOS33} [get_ports LED2]
#set_property -dict {PACKAGE_PIN G15 IOSTANDARD LVCMOS33} [get_ports BT]]  #compartido LED
#set_property PULLUP true [get_ports BTN]

#Keyboard and mouse
#set_property -dict {PACKAGE_PIN P4 IOSTANDARD LVCMOS33} [get_ports PS2_MOUSE_CLK]
#set_property -dict {PACKAGE_PIN N5 IOSTANDARD LVCMOS33} [get_ports PS2_MOUSE_DATA]
set_property -dict {PACKAGE_PIN U1 IOSTANDARD LVCMOS33} [get_ports PS2_KEYB_CLK]
set_property -dict {PACKAGE_PIN T1 IOSTANDARD LVCMOS33} [get_ports PS2_KEYB_DATA]
set_property PULLUP true [get_ports PS2_*]

## Video output
set_property -dict {PACKAGE_PIN V18 IOSTANDARD LVCMOS33} [get_ports VGA_HS]
set_property -dict {PACKAGE_PIN P19 IOSTANDARD LVCMOS33} [get_ports VGA_VS]

set_property -dict {PACKAGE_PIN T6 IOSTANDARD LVCMOS33} [get_ports VGA_B[0]]
set_property -dict {PACKAGE_PIN U5 IOSTANDARD LVCMOS33} [get_ports VGA_B[1]]
set_property -dict {PACKAGE_PIN T20 IOSTANDARD LVCMOS33} [get_ports VGA_B[2]]
set_property -dict {PACKAGE_PIN AB21 IOSTANDARD LVCMOS33} [get_ports VGA_B[3]]
set_property -dict {PACKAGE_PIN Y21 IOSTANDARD LVCMOS33} [get_ports VGA_B[4]]
set_property -dict {PACKAGE_PIN AA20 IOSTANDARD LVCMOS33} [get_ports VGA_B[5]]
set_property -dict {PACKAGE_PIN W19 IOSTANDARD LVCMOS33} [get_ports VGA_B[6]]
set_property -dict {PACKAGE_PIN W21 IOSTANDARD LVCMOS33} [get_ports VGA_B[7]]

set_property -dict {PACKAGE_PIN V5 IOSTANDARD LVCMOS33} [get_ports VGA_G[0]]
set_property -dict {PACKAGE_PIN V4 IOSTANDARD LVCMOS33} [get_ports VGA_G[1]]
set_property -dict {PACKAGE_PIN V17 IOSTANDARD LVCMOS33} [get_ports VGA_G[2]]
set_property -dict {PACKAGE_PIN W20 IOSTANDARD LVCMOS33} [get_ports VGA_G[3]]
set_property -dict {PACKAGE_PIN AB22 IOSTANDARD LVCMOS33} [get_ports VGA_G[4]]
set_property -dict {PACKAGE_PIN Y22 IOSTANDARD LVCMOS33} [get_ports VGA_G[5]]
set_property -dict {PACKAGE_PIN AA21 IOSTANDARD LVCMOS33} [get_ports VGA_G[6]]
set_property -dict {PACKAGE_PIN W22 IOSTANDARD LVCMOS33} [get_ports VGA_G[7]]

set_property -dict {PACKAGE_PIN R6 IOSTANDARD LVCMOS33} [get_ports VGA_R[0]]
set_property -dict {PACKAGE_PIN T5 IOSTANDARD LVCMOS33} [get_ports VGA_R[1]]
set_property -dict {PACKAGE_PIN P20 IOSTANDARD LVCMOS33} [get_ports VGA_R[2]]
set_property -dict {PACKAGE_PIN Y19 IOSTANDARD LVCMOS33} [get_ports VGA_R[3]]
set_property -dict {PACKAGE_PIN V20 IOSTANDARD LVCMOS33} [get_ports VGA_R[4]]
set_property -dict {PACKAGE_PIN AB20 IOSTANDARD LVCMOS33} [get_ports VGA_R[5]]
set_property -dict {PACKAGE_PIN AA19 IOSTANDARD LVCMOS33} [get_ports VGA_R[6]]
set_property -dict {PACKAGE_PIN W17 IOSTANDARD LVCMOS33} [get_ports VGA_R[7]]

set_property -dict {PACKAGE_PIN R19 IOSTANDARD LVCMOS33} [get_ports PAL_N]

#Audio
set_property -dict {PACKAGE_PIN V19 IOSTANDARD LVCMOS33} [get_ports AUDIO_L]
set_property -dict {PACKAGE_PIN U17 IOSTANDARD LVCMOS33} [get_ports AUDIO_R]
set_property -dict {PACKAGE_PIN B1 IOSTANDARD LVCMOS33} [get_ports EAR]


#Joystick
set_property -dict {PACKAGE_PIN G1 IOSTANDARD LVCMOS33} [get_ports JOY_SELECT]
set_property -dict {PACKAGE_PIN U2 IOSTANDARD LVCMOS33} [get_ports JOY_LOAD_N]
set_property -dict {PACKAGE_PIN W2 IOSTANDARD LVCMOS33} [get_ports JOY_DATA]
set_property -dict {PACKAGE_PIN V2 IOSTANDARD LVCMOS33} [get_ports JOY_CLK]

##JAMMA
#set_property -dict {PACKAGE_PIN AA4 IOSTANDARD LVCMOS33} [get_ports JAMMA_LOAD_N]
#set_property -dict {PACKAGE_PIN AA6 IOSTANDARD LVCMOS33} [get_ports JAMMA_DATA]
#set_property -dict {PACKAGE_PIN AB5 IOSTANDARD LVCMOS33} [get_ports JAMMA_CLK]

#SRAM
set_property SLEW SLOW [get_ports {SRAM_*}]
set_property -dict {PACKAGE_PIN G2 IOSTANDARD LVCMOS33} [get_ports SRAM_A[19]]
set_property -dict {PACKAGE_PIN V3 IOSTANDARD LVCMOS33} [get_ports SRAM_A[18]]
set_property -dict {PACKAGE_PIN W1 IOSTANDARD LVCMOS33} [get_ports SRAM_A[17]]
set_property -dict {PACKAGE_PIN Y1 IOSTANDARD LVCMOS33} [get_ports SRAM_A[16]]
set_property -dict {PACKAGE_PIN Y2 IOSTANDARD LVCMOS33} [get_ports SRAM_A[15]]
set_property -dict {PACKAGE_PIN AA18 IOSTANDARD LVCMOS33} [get_ports SRAM_A[14]]
set_property -dict {PACKAGE_PIN AB2 IOSTANDARD LVCMOS33} [get_ports SRAM_A[13]]
set_property -dict {PACKAGE_PIN P17 IOSTANDARD LVCMOS33} [get_ports SRAM_A[12]]
set_property -dict {PACKAGE_PIN AA3 IOSTANDARD LVCMOS33} [get_ports SRAM_A[11]]
set_property -dict {PACKAGE_PIN P16 IOSTANDARD LVCMOS33} [get_ports SRAM_A[10]]
set_property -dict {PACKAGE_PIN T3 IOSTANDARD LVCMOS33} [get_ports SRAM_A[9]]
set_property -dict {PACKAGE_PIN R14 IOSTANDARD LVCMOS33} [get_ports SRAM_A[8]]
set_property -dict {PACKAGE_PIN Y3 IOSTANDARD LVCMOS33} [get_ports SRAM_A[7]]
set_property -dict {PACKAGE_PIN AB3 IOSTANDARD LVCMOS33} [get_ports SRAM_A[6]]
set_property -dict {PACKAGE_PIN P14 IOSTANDARD LVCMOS33} [get_ports SRAM_A[5]]
set_property -dict {PACKAGE_PIN R17 IOSTANDARD LVCMOS33} [get_ports SRAM_A[4]]
set_property -dict {PACKAGE_PIN T18 IOSTANDARD LVCMOS33} [get_ports SRAM_A[3]]
set_property -dict {PACKAGE_PIN P15 IOSTANDARD LVCMOS33} [get_ports SRAM_A[2]]
set_property -dict {PACKAGE_PIN AB18 IOSTANDARD LVCMOS33} [get_ports SRAM_A[1]]
set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVCMOS33} [get_ports SRAM_A[0]]

#set_property -dict {PACKAGE_PIN K4 IOSTANDARD LVCMOS33} [get_ports SRAM_D[15]]
#set_property -dict {PACKAGE_PIN M1 IOSTANDARD LVCMOS33} [get_ports SRAM_D[14]]
#set_property -dict {PACKAGE_PIN L1 IOSTANDARD LVCMOS33} [get_ports SRAM_D[13]]
#set_property -dict {PACKAGE_PIN K6 IOSTANDARD LVCMOS33} [get_ports SRAM_D[12]]
#set_property -dict {PACKAGE_PIN R1 IOSTANDARD LVCMOS33} [get_ports SRAM_D[11]]
#set_property -dict {PACKAGE_PIN P1 IOSTANDARD LVCMOS33} [get_ports SRAM_D[10]]
#set_property -dict {PACKAGE_PIN P2 IOSTANDARD LVCMOS33} [get_ports SRAM_D[9]]
#set_property -dict {PACKAGE_PIN N2 IOSTANDARD LVCMOS33} [get_ports SRAM_D[8]]
set_property -dict {PACKAGE_PIN U3 IOSTANDARD LVCMOS33} [get_ports SRAM_D[7]]
set_property -dict {PACKAGE_PIN AB1 IOSTANDARD LVCMOS33} [get_ports SRAM_D[6]]
set_property -dict {PACKAGE_PIN AA1 IOSTANDARD LVCMOS33} [get_ports SRAM_D[5]]
set_property -dict {PACKAGE_PIN R16 IOSTANDARD LVCMOS33} [get_ports SRAM_D[4]]
set_property -dict {PACKAGE_PIN N13 IOSTANDARD LVCMOS33} [get_ports SRAM_D[3]]
set_property -dict {PACKAGE_PIN N14 IOSTANDARD LVCMOS33} [get_ports SRAM_D[2]]
set_property -dict {PACKAGE_PIN AA5 IOSTANDARD LVCMOS33} [get_ports SRAM_D[1]]
set_property -dict {PACKAGE_PIN N17 IOSTANDARD LVCMOS33} [get_ports SRAM_D[0]]

set_property -dict {PACKAGE_PIN N15 IOSTANDARD LVCMOS33} [get_ports SRAM_WE_N]
set_property -dict {PACKAGE_PIN E1 IOSTANDARD LVCMOS33} [get_ports SRAM_OE_N]
set_property -dict {PACKAGE_PIN U20 IOSTANDARD LVCMOS33} [get_ports SRAM_UB_N]
set_property -dict {PACKAGE_PIN N4 IOSTANDARD LVCMOS33} [get_ports SRAM_LB_N]


#SD
set_property -dict {PACKAGE_PIN M5 IOSTANDARD LVCMOS33 PULLUP true} [get_ports SD_MISO]
set_property -dict {PACKAGE_PIN L4 IOSTANDARD LVCMOS33} [get_ports SD_MOSI]
set_property -dict {PACKAGE_PIN M6 IOSTANDARD LVCMOS33} [get_ports SD_CLK]
set_property -dict {PACKAGE_PIN L5 IOSTANDARD LVCMOS33} [get_ports SD_CS]

##set_property PULLUP true [get_ports sd_miso]


##Flash SPI
#set_property -dict {PACKAGE_PIN T19 IOSTANDARD LVCMOS33} [get_ports FLASH_CS]
#set_property -dict {PACKAGE_PIN L12 IOSTANDARD LVCMOS33} [get_ports FLASH_SCLK] #L12/T4
#set_property -dict {PACKAGE_PIN P22 IOSTANDARD LVCMOS33} [get_ports FLASH_MOSI]
#set_property -dict {PACKAGE_PIN R22 IOSTANDARD LVCMOS33} [get_ports FLASH_MISO]
#set_property -dict {PACKAGE_PIN P21 IOSTANDARD LVCMOS33} [get_ports FLASH_WP ]
#set_property -dict {PACKAGE_PIN R21 IOSTANDARD LVCMOS33} [get_ports FLASH_HOLD]


##
## SDRAM signals
##
#set_property -dict {PACKAGE_PIN G20 IOSTANDARD LVCMOS33} [get_ports SDRAM_CLK ]
#set_property -dict {PACKAGE_PIN H22 IOSTANDARD LVCMOS33} [get_ports SDRAM_CKE ]

#set_property -dict {PACKAGE_PIN M18 IOSTANDARD LVCMOS33} [get_ports SDRAM_LDQM]
#set_property -dict {PACKAGE_PIN L21 IOSTANDARD LVCMOS33} [get_ports SDRAM_UDQM]

#set_property -dict {PACKAGE_PIN L18 IOSTANDARD LVCMOS33} [get_ports SDRAM_CAS ]
#set_property -dict {PACKAGE_PIN K19 IOSTANDARD LVCMOS33} [get_ports SDRAM_RAS ]
#set_property -dict {PACKAGE_PIN N22 IOSTANDARD LVCMOS33} [get_ports SDRAM_CS  ]
#set_property -dict {PACKAGE_PIN J17 IOSTANDARD LVCMOS33} [get_ports SDRAM_WE  ]

#set_property -dict {PACKAGE_PIN J19 IOSTANDARD LVCMOS33} [get_ports SDRAM_BA[0]]
#set_property -dict {PACKAGE_PIN H20 IOSTANDARD LVCMOS33} [get_ports SDRAM_BA[1]]

#set_property -dict {PACKAGE_PIN J22 IOSTANDARD LVCMOS33} [get_ports SDRAM_A[12]]
#set_property -dict {PACKAGE_PIN J15 IOSTANDARD LVCMOS33} [get_ports SDRAM_A[11]]
#set_property -dict {PACKAGE_PIN K21 IOSTANDARD LVCMOS33} [get_ports SDRAM_A[10]]
#set_property -dict {PACKAGE_PIN H15 IOSTANDARD LVCMOS33} [get_ports SDRAM_A[9]]
#set_property -dict {PACKAGE_PIN G18 IOSTANDARD LVCMOS33} [get_ports SDRAM_A[8]]
#set_property -dict {PACKAGE_PIN G17 IOSTANDARD LVCMOS33} [get_ports SDRAM_A[7]]
#set_property -dict {PACKAGE_PIN H14 IOSTANDARD LVCMOS33} [get_ports SDRAM_A[6]]
#set_property -dict {PACKAGE_PIN J14 IOSTANDARD LVCMOS33} [get_ports SDRAM_A[5]]
#set_property -dict {PACKAGE_PIN G16 IOSTANDARD LVCMOS33} [get_ports SDRAM_A[4]]
#set_property -dict {PACKAGE_PIN J20 IOSTANDARD LVCMOS33} [get_ports SDRAM_A[3]]
#set_property -dict {PACKAGE_PIN J21 IOSTANDARD LVCMOS33} [get_ports SDRAM_A[2]]
#set_property -dict {PACKAGE_PIN K22 IOSTANDARD LVCMOS33} [get_ports SDRAM_A[1]]
#set_property -dict {PACKAGE_PIN H19 IOSTANDARD LVCMOS33} [get_ports SDRAM_A[0]]
#set_property -dict {PACKAGE_PIN L15 IOSTANDARD LVCMOS33} [get_ports SDRAM_D[15]]
#set_property -dict {PACKAGE_PIN M16 IOSTANDARD LVCMOS33} [get_ports SDRAM_D[14]]
#set_property -dict {PACKAGE_PIN N20 IOSTANDARD LVCMOS33} [get_ports SDRAM_D[13]]
#set_property -dict {PACKAGE_PIN N18 IOSTANDARD LVCMOS33} [get_ports SDRAM_D[12]]
#set_property -dict {PACKAGE_PIN M20 IOSTANDARD LVCMOS33} [get_ports SDRAM_D[11]]
#set_property -dict {PACKAGE_PIN N19 IOSTANDARD LVCMOS33} [get_ports SDRAM_D[10]]
#set_property -dict {PACKAGE_PIN M22 IOSTANDARD LVCMOS33} [get_ports SDRAM_D[9]]
#set_property -dict {PACKAGE_PIN M21 IOSTANDARD LVCMOS33} [get_ports SDRAM_D[8]]
#set_property -dict {PACKAGE_PIN K14 IOSTANDARD LVCMOS33} [get_ports SDRAM_D[7]]
#set_property -dict {PACKAGE_PIN K17 IOSTANDARD LVCMOS33} [get_ports SDRAM_D[6]]
#set_property -dict {PACKAGE_PIN L14 IOSTANDARD LVCMOS33} [get_ports SDRAM_D[5]]
#set_property -dict {PACKAGE_PIN K16 IOSTANDARD LVCMOS33} [get_ports SDRAM_D[4]]
#set_property -dict {PACKAGE_PIN M15 IOSTANDARD LVCMOS33} [get_ports SDRAM_D[3]]
#set_property -dict {PACKAGE_PIN L16 IOSTANDARD LVCMOS33} [get_ports SDRAM_D[2]]
#set_property -dict {PACKAGE_PIN L13 IOSTANDARD LVCMOS33} [get_ports SDRAM_D[1]]
#set_property -dict {PACKAGE_PIN M13 IOSTANDARD LVCMOS33} [get_ports SDRAM_D[0]]


#UART
#set_property -dict {PACKAGE_PIN D1 IOSTANDARD LVCMOS33} [get_ports UART_RX]
#set_property -dict {PACKAGE_PIN N3 IOSTANDARD LVCMOS33} [get_ports UART_TX]
#set_property -dict {PACKAGE_PIN H5 IOSTANDARD LVCMOS33} [get_ports UART_RTS]
#set_property -dict {PACKAGE_PIN J2 IOSTANDARD LVCMOS33} [get_ports UART_GPIO0]
#set_property -dict {PACKAGE_PIN L6 IOSTANDARD LVCMOS33} [get_ports UART_RESET]


#I2C
#set_property -dict {PACKAGE_PIN AB6 IOSTANDARD LVCMOS33} [get_ports I2C_SCL]
#set_property -dict {PACKAGE_PIN Y7 IOSTANDARD LVCMOS33} [get_ports I2C_SDA]


#MIDI
#set_property -dict {PACKAGE_PIN AA8 IOSTANDARD LVCMOS33} [get_ports MIDI_CLKBD]
#set_property -dict {PACKAGE_PIN Y8 IOSTANDARD LVCMOS33} [get_ports MIDI_WSBD]
#set_property -dict {PACKAGE_PIN AB8 IOSTANDARD LVCMOS33} [get_ports MIDI_DABD]
#set_property -dict {PACKAGE_PIN AB7 IOSTANDARD LVCMOS33} [get_ports MIDI_OUT]


#EDGE
#set_property -dict {PACKAGE_PIN R2 IOSTANDARD LVCMOS33} [get_ports edge_A[15]]
#set_property -dict {PACKAGE_PIN P6 IOSTANDARD LVCMOS33} [get_ports edge_A[14]]
#set_property -dict {PACKAGE_PIN P5 IOSTANDARD LVCMOS33} [get_ports edge_A[12]]
#set_property -dict {PACKAGE_PIN J6 IOSTANDARD LVCMOS33} [get_ports edge_CLK]
#set_property -dict {PACKAGE_PIN K3 IOSTANDARD LVCMOS33} [get_ports edge_A[0]]
#set_property -dict {PACKAGE_PIN L3 IOSTANDARD LVCMOS33} [get_ports edge_A[1]]
#set_property -dict {PACKAGE_PIN J4 IOSTANDARD LVCMOS33} [get_ports edge_A[2]]
#set_property -dict {PACKAGE_PIN G3 IOSTANDARD LVCMOS33} [get_ports edge_A[3]]
#set_property -dict {PACKAGE_PIN H3 IOSTANDARD LVCMOS33} [get_ports edge_INT]
#set_property -dict {PACKAGE_PIN J5 IOSTANDARD LVCMOS33} [get_ports edge_NMI]
#set_property -dict {PACKAGE_PIN H2 IOSTANDARD LVCMOS33} [get_ports edge_MREQ]
#set_property -dict {PACKAGE_PIN G4 IOSTANDARD LVCMOS33} [get_ports edge_IORQ]
#set_property -dict {PACKAGE_PIN K1 IOSTANDARD LVCMOS33} [get_ports edge_RD]
#set_property -dict {PACKAGE_PIN B22 IOSTANDARD LVCMOS33} [get_ports edge_A[10]]
#set_property -dict {PACKAGE_PIN E2 IOSTANDARD LVCMOS33} [get_ports edge_RESET]
#set_property -dict {PACKAGE_PIN H4 IOSTANDARD LVCMOS33} [get_ports edge_WR]
#set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports edge_A[7]]
#set_property -dict {PACKAGE_PIN F1 IOSTANDARD LVCMOS33} [get_ports edge_A[6]]
#set_property -dict {PACKAGE_PIN F3 IOSTANDARD LVCMOS33} [get_ports edge_A[5]]
#set_property -dict {PACKAGE_PIN K2 IOSTANDARD LVCMOS33} [get_ports edge_M1]
#set_property -dict {PACKAGE_PIN M2 IOSTANDARD LVCMOS33} [get_ports edge_A[4]]
#set_property -dict {PACKAGE_PIN M3 IOSTANDARD LVCMOS33} [get_ports edge_ROMCS]
#set_property -dict {PACKAGE_PIN B2 IOSTANDARD LVCMOS33} [get_ports edge_A[8]]
#set_property -dict {PACKAGE_PIN R3 IOSTANDARD LVCMOS33} [get_ports edge_A[13]]
#set_property -dict {PACKAGE_PIN F4 IOSTANDARD LVCMOS33} [get_ports edge_A[9]]
#set_property -dict {PACKAGE_PIN C2 IOSTANDARD LVCMOS33} [get_ports edge_A[11]]
#set_property -dict {PACKAGE_PIN T21 IOSTANDARD LVCMOS33} [get_ports edge_D[0]]
#set_property -dict {PACKAGE_PIN M17 IOSTANDARD LVCMOS33} [get_ports edge_D[1]]
#set_property -dict {PACKAGE_PIN J16 IOSTANDARD LVCMOS33} [get_ports edge_D[2]]
#set_property -dict {PACKAGE_PIN L19 IOSTANDARD LVCMOS33} [get_ports edge_D[3]]
#set_property -dict {PACKAGE_PIN K18 IOSTANDARD LVCMOS33} [get_ports edge_D[4]]
#set_property -dict {PACKAGE_PIN L20 IOSTANDARD LVCMOS33} [get_ports edge_D[5]]
#set_property -dict {PACKAGE_PIN K13 IOSTANDARD LVCMOS33} [get_ports edge_D[6]]
#set_property -dict {PACKAGE_PIN U21 IOSTANDARD LVCMOS33} [get_ports edge_D[7]]
#set_property -dict {PACKAGE_PIN J1 IOSTANDARD LVCMOS33} [get_ports edge_HALT]
#set_property -dict {PACKAGE_PIN G13 IOSTANDARD LVCMOS33} [get_ports edge_BUSRQ]
#set_property -dict {PACKAGE_PIN D2 IOSTANDARD LVCMOS33} [get_ports edge_BUSAK]
#set_property -dict {PACKAGE_PIN H17 IOSTANDARD LVCMOS33} [get_ports edge_REFRESH]
#set_property -dict {PACKAGE_PIN H18 IOSTANDARD LVCMOS33} [get_ports edge_WAIT]


#Displayport
#set_property -dict {PACKAGE_PIN B4   } [get_ports {DP_lane0p}]
#set_property -dict {PACKAGE_PIN A4   } [get_ports {DP_lane0n}]
#set_property -dict {PACKAGE_PIN D5   } [get_ports {DP_lane1p}]
#set_property -dict {PACKAGE_PIN C5   } [get_ports {DP_lane1n}]
#set_property PACKAGE_PIN  [get_ports DP_lane2p]0
#set_property IOSTANDARD TMDS_33 [get_ports DP_lane2p]
#set_property PACKAGE_PIN  [get_ports DP_lane2n]
#set_property IOSTANDARD TMDS_33 [get_ports DP_lane2n]
#set_property PACKAGE_PIN  [get_ports DP_lane3p]
#set_property IOSTANDARD TMDS_33 [get_ports DP_lane3p]
#set_property PACKAGE_PIN  [get_ports DP_lane3n]
#set_property IOSTANDARD TMDS_33 [get_ports DP_lane3n]
#set_property PACKAGE_PIN A15 [get_ports DP_auxp]
#set_property IOSTANDARD LVCMOS33 [get_ports DP_auxp]
#set_property PACKAGE_PIN A16 [get_ports DP_auxn]
#set_property IOSTANDARD LVCMOS33 [get_ports DP_auxn]
#set_property PACKAGE_PIN A1 [get_ports DP_hotplug]
#set_property IOSTANDARD LVCMOS33 [get_ports DP_hotplug]

