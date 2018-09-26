###################################################################

# Created by write_sdc on Wed Sep 12 12:01:00 2018

###################################################################
set sdc_version 1.3

create_clock [get_ports DLX_clk]  -name DLX_CLK  -period 5  -waveform {0 2.5}
set_max_delay 10  -from [list [get_ports DLX_clk] [get_ports DLX_reset] [get_ports DLX_enable]  \
[get_ports {DLX_IR[31]}] [get_ports {DLX_IR[30]}] [get_ports {DLX_IR[29]}]     \
[get_ports {DLX_IR[28]}] [get_ports {DLX_IR[27]}] [get_ports {DLX_IR[26]}]     \
[get_ports {DLX_IR[25]}] [get_ports {DLX_IR[24]}] [get_ports {DLX_IR[23]}]     \
[get_ports {DLX_IR[22]}] [get_ports {DLX_IR[21]}] [get_ports {DLX_IR[20]}]     \
[get_ports {DLX_IR[19]}] [get_ports {DLX_IR[18]}] [get_ports {DLX_IR[17]}]     \
[get_ports {DLX_IR[16]}] [get_ports {DLX_IR[15]}] [get_ports {DLX_IR[14]}]     \
[get_ports {DLX_IR[13]}] [get_ports {DLX_IR[12]}] [get_ports {DLX_IR[11]}]     \
[get_ports {DLX_IR[10]}] [get_ports {DLX_IR[9]}] [get_ports {DLX_IR[8]}]       \
[get_ports {DLX_IR[7]}] [get_ports {DLX_IR[6]}] [get_ports {DLX_IR[5]}]        \
[get_ports {DLX_IR[4]}] [get_ports {DLX_IR[3]}] [get_ports {DLX_IR[2]}]        \
[get_ports {DLX_IR[1]}] [get_ports {DLX_IR[0]}] [get_ports                     \
{DLX_read_data[31]}] [get_ports {DLX_read_data[30]}] [get_ports                \
{DLX_read_data[29]}] [get_ports {DLX_read_data[28]}] [get_ports                \
{DLX_read_data[27]}] [get_ports {DLX_read_data[26]}] [get_ports                \
{DLX_read_data[25]}] [get_ports {DLX_read_data[24]}] [get_ports                \
{DLX_read_data[23]}] [get_ports {DLX_read_data[22]}] [get_ports                \
{DLX_read_data[21]}] [get_ports {DLX_read_data[20]}] [get_ports                \
{DLX_read_data[19]}] [get_ports {DLX_read_data[18]}] [get_ports                \
{DLX_read_data[17]}] [get_ports {DLX_read_data[16]}] [get_ports                \
{DLX_read_data[15]}] [get_ports {DLX_read_data[14]}] [get_ports                \
{DLX_read_data[13]}] [get_ports {DLX_read_data[12]}] [get_ports                \
{DLX_read_data[11]}] [get_ports {DLX_read_data[10]}] [get_ports                \
{DLX_read_data[9]}] [get_ports {DLX_read_data[8]}] [get_ports                  \
{DLX_read_data[7]}] [get_ports {DLX_read_data[6]}] [get_ports                  \
{DLX_read_data[5]}] [get_ports {DLX_read_data[4]}] [get_ports                  \
{DLX_read_data[3]}] [get_ports {DLX_read_data[2]}] [get_ports                  \
{DLX_read_data[1]}] [get_ports {DLX_read_data[0]}]]  -to [list [get_ports {DLX_written_data[31]}] [get_ports                       \
{DLX_written_data[30]}] [get_ports {DLX_written_data[29]}] [get_ports          \
{DLX_written_data[28]}] [get_ports {DLX_written_data[27]}] [get_ports          \
{DLX_written_data[26]}] [get_ports {DLX_written_data[25]}] [get_ports          \
{DLX_written_data[24]}] [get_ports {DLX_written_data[23]}] [get_ports          \
{DLX_written_data[22]}] [get_ports {DLX_written_data[21]}] [get_ports          \
{DLX_written_data[20]}] [get_ports {DLX_written_data[19]}] [get_ports          \
{DLX_written_data[18]}] [get_ports {DLX_written_data[17]}] [get_ports          \
{DLX_written_data[16]}] [get_ports {DLX_written_data[15]}] [get_ports          \
{DLX_written_data[14]}] [get_ports {DLX_written_data[13]}] [get_ports          \
{DLX_written_data[12]}] [get_ports {DLX_written_data[11]}] [get_ports          \
{DLX_written_data[10]}] [get_ports {DLX_written_data[9]}] [get_ports           \
{DLX_written_data[8]}] [get_ports {DLX_written_data[7]}] [get_ports            \
{DLX_written_data[6]}] [get_ports {DLX_written_data[5]}] [get_ports            \
{DLX_written_data[4]}] [get_ports {DLX_written_data[3]}] [get_ports            \
{DLX_written_data[2]}] [get_ports {DLX_written_data[1]}] [get_ports            \
{DLX_written_data[0]}] [get_ports {DLX_address_written_data[31]}] [get_ports   \
{DLX_address_written_data[30]}] [get_ports {DLX_address_written_data[29]}]     \
[get_ports {DLX_address_written_data[28]}] [get_ports                          \
{DLX_address_written_data[27]}] [get_ports {DLX_address_written_data[26]}]     \
[get_ports {DLX_address_written_data[25]}] [get_ports                          \
{DLX_address_written_data[24]}] [get_ports {DLX_address_written_data[23]}]     \
[get_ports {DLX_address_written_data[22]}] [get_ports                          \
{DLX_address_written_data[21]}] [get_ports {DLX_address_written_data[20]}]     \
[get_ports {DLX_address_written_data[19]}] [get_ports                          \
{DLX_address_written_data[18]}] [get_ports {DLX_address_written_data[17]}]     \
[get_ports {DLX_address_written_data[16]}] [get_ports                          \
{DLX_address_written_data[15]}] [get_ports {DLX_address_written_data[14]}]     \
[get_ports {DLX_address_written_data[13]}] [get_ports                          \
{DLX_address_written_data[12]}] [get_ports {DLX_address_written_data[11]}]     \
[get_ports {DLX_address_written_data[10]}] [get_ports                          \
{DLX_address_written_data[9]}] [get_ports {DLX_address_written_data[8]}]       \
[get_ports {DLX_address_written_data[7]}] [get_ports                           \
{DLX_address_written_data[6]}] [get_ports {DLX_address_written_data[5]}]       \
[get_ports {DLX_address_written_data[4]}] [get_ports                           \
{DLX_address_written_data[3]}] [get_ports {DLX_address_written_data[2]}]       \
[get_ports {DLX_address_written_data[1]}] [get_ports                           \
{DLX_address_written_data[0]}] [get_ports {DLX_PC[31]}] [get_ports             \
{DLX_PC[30]}] [get_ports {DLX_PC[29]}] [get_ports {DLX_PC[28]}] [get_ports     \
{DLX_PC[27]}] [get_ports {DLX_PC[26]}] [get_ports {DLX_PC[25]}] [get_ports     \
{DLX_PC[24]}] [get_ports {DLX_PC[23]}] [get_ports {DLX_PC[22]}] [get_ports     \
{DLX_PC[21]}] [get_ports {DLX_PC[20]}] [get_ports {DLX_PC[19]}] [get_ports     \
{DLX_PC[18]}] [get_ports {DLX_PC[17]}] [get_ports {DLX_PC[16]}] [get_ports     \
{DLX_PC[15]}] [get_ports {DLX_PC[14]}] [get_ports {DLX_PC[13]}] [get_ports     \
{DLX_PC[12]}] [get_ports {DLX_PC[11]}] [get_ports {DLX_PC[10]}] [get_ports     \
{DLX_PC[9]}] [get_ports {DLX_PC[8]}] [get_ports {DLX_PC[7]}] [get_ports        \
{DLX_PC[6]}] [get_ports {DLX_PC[5]}] [get_ports {DLX_PC[4]}] [get_ports        \
{DLX_PC[3]}] [get_ports {DLX_PC[2]}] [get_ports {DLX_PC[1]}] [get_ports        \
{DLX_PC[0]}] [get_ports DLX_enable_DRAM] [get_ports DLX_RD_wr_DRAM] [get_ports \
DLX_error]]
