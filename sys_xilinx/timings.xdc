#create_property iob port -type string

# Contraints de tiempo
create_clock -period 20.000 -name CLK50 [get_ports CLK50]
#create_generated_clock -name clk25r -source [get_ports CLK50] -divide_by 2 [get_pins clk25r_reg/Q]

#set_property IOB TRUE [all_inputs]
#set_property IOB TRUE [all_outputs]

set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN PULLUP [current_design]
#set_property BITSTREAM.CONFIG.CONFIGFALLBACK ENABLE [current_design]
#set_property BITSTREAM.CONFIG.NEXT_CONFIG_ADDR 0x0100000 [current_design]


