////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: ControlUnit_translate.v
// /___/   /\     Timestamp: Mon Jul 02 11:51:21 2018
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/translate -ofmt verilog -sim ControlUnit.ngd ControlUnit_translate.v 
// Device	: 7a100tcsg324-3
// Input file	: ControlUnit.ngd
// Output file	: C:\Users\Alessandro\Documents\GitHub\MyDLX\DLX_plus_memories\netgen\translate\ControlUnit_translate.v
// # of Modules	: 1
// Design Name	: ControlUnit
// Xilinx        : C:\Xilinx\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module ControlUnit (
  CU_enable, CU_reset, CU_clk, CU_flush, CU_bubble, CU_error, CU_instr_opcode, CU_instr_func, CU_CW_DE, CU_CW_EX, CU_CW_MEM, CU_CW_WB
);
  input CU_enable;
  input CU_reset;
  input CU_clk;
  input CU_flush;
  input CU_bubble;
  output CU_error;
  input [5 : 0] CU_instr_opcode;
  input [10 : 0] CU_instr_func;
  output [1 : 9] CU_CW_DE;
  output [8 : 18] CU_CW_EX;
  output [19 : 22] CU_CW_MEM;
  output [23 : 26] CU_CW_WB;
  wire CU_instr_opcode_5_IBUF_3;
  wire CU_instr_opcode_4_IBUF_4;
  wire CU_instr_opcode_3_IBUF_5;
  wire CU_instr_opcode_2_IBUF_6;
  wire CU_instr_opcode_1_IBUF_7;
  wire CU_instr_opcode_0_IBUF_8;
  wire CU_instr_func_10_IBUF_9;
  wire CU_instr_func_9_IBUF_10;
  wire CU_instr_func_8_IBUF_11;
  wire CU_instr_func_7_IBUF_12;
  wire CU_instr_func_6_IBUF_13;
  wire CU_instr_func_5_IBUF_14;
  wire CU_instr_func_4_IBUF_15;
  wire CU_instr_func_3_IBUF_16;
  wire CU_instr_func_2_IBUF_17;
  wire CU_instr_func_1_IBUF_18;
  wire CU_instr_func_0_IBUF_19;
  wire CU_enable_IBUF_20;
  wire CU_reset_IBUF_21;
  wire CU_clk_BUFGP;
  wire CU_flush_IBUF_23;
  wire CU_bubble_IBUF_24;
  wire CU_enable_CU_reset_AND_1_o;
  wire \DE_CW/data_out[25] ;
  wire \DE_CW/data_out[24] ;
  wire \DE_CW/data_out[23] ;
  wire \DE_CW/data_out[22] ;
  wire \DE_CW/data_out[21] ;
  wire \DE_CW/data_out[20] ;
  wire \DE_CW/data_out[19] ;
  wire \DE_CW/data_out[18] ;
  wire \DE_CW/data_out[17] ;
  wire \DE_CW/data_out[16] ;
  wire \DE_CW/data_out[15] ;
  wire \DE_CW/data_out[14] ;
  wire \DE_CW/data_out[13] ;
  wire \DE_CW/data_out[12] ;
  wire \DE_CW/data_out[11] ;
  wire \DE_CW/data_out[10] ;
  wire \DE_CW/data_out[9] ;
  wire \DE_CW/data_out[8] ;
  wire \DE_CW/data_out[7] ;
  wire \DE_CW/data_out[6] ;
  wire \DE_CW/data_out[5] ;
  wire \DE_CW/data_out[4] ;
  wire \DE_CW/data_out[2] ;
  wire \DE_CW/data_out[1] ;
  wire \DE_CW/data_out[0] ;
  wire \EX_CW/data_out[18] ;
  wire \EX_CW/data_out[17] ;
  wire \EX_CW/data_out[16] ;
  wire \EX_CW/data_out[15] ;
  wire \EX_CW/data_out[14] ;
  wire \EX_CW/data_out[13] ;
  wire \EX_CW/data_out[12] ;
  wire \EX_CW/data_out[11] ;
  wire \EX_CW/data_out[10] ;
  wire \EX_CW/data_out[9] ;
  wire \EX_CW/data_out[8] ;
  wire \EX_CW/data_out[7] ;
  wire \EX_CW/data_out[6] ;
  wire \EX_CW/data_out[5] ;
  wire \EX_CW/data_out[4] ;
  wire \EX_CW/data_out[2] ;
  wire \EX_CW/data_out[1] ;
  wire \EX_CW/data_out[0] ;
  wire \MEM_CW/data_out[7] ;
  wire \MEM_CW/data_out[3] ;
  wire \MEM_CW/data_out[5] ;
  wire \MEM_CW/data_out[4] ;
  wire \MEM_CW/data_out[2] ;
  wire \MEM_CW/data_out[1] ;
  wire \MEM_CW/data_out[0] ;
  wire s_reset_regs;
  wire \s_cw_tmp[1] ;
  wire \s_cw_tmp[2] ;
  wire \s_cw_tmp[3] ;
  wire \s_cw_tmp[4] ;
  wire \s_cw_tmp[5] ;
  wire \s_cw_tmp[6] ;
  wire \s_cw_tmp[7] ;
  wire \s_cw_tmp[8] ;
  wire \s_cw_tmp[9] ;
  wire \s_cw_tmp[10] ;
  wire \s_cw_tmp[11] ;
  wire \s_cw_tmp[12] ;
  wire \s_cw_tmp[13] ;
  wire \s_cw_tmp[14] ;
  wire \s_cw_tmp[15] ;
  wire \s_cw_tmp[16] ;
  wire \s_cw_tmp[17] ;
  wire \s_cw_tmp[18] ;
  wire \s_cw_tmp[19] ;
  wire \s_cw_tmp[20] ;
  wire \s_cw_tmp[22] ;
  wire \s_cw_tmp[24] ;
  wire \s_cw_tmp[25] ;
  wire \s_cw_tmp[26] ;
  wire CU_error_OBUF_105;
  wire \CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<23>1 ;
  wire \CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<25>1_109 ;
  wire \CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<23>2 ;
  wire \CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<23>3 ;
  wire \CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<13>2 ;
  wire \BUBBLE_MUX/Mmux_portY141_113 ;
  wire \CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<13>3 ;
  wire \CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<12>21 ;
  wire Mmux_CU_error13_116;
  wire \CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<13>4 ;
  wire \CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<15>3 ;
  wire \CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<11>4 ;
  wire \BUBBLE_MUX/Mmux_portY143 ;
  wire N2;
  wire N4;
  wire \BUBBLE_MUX/Mmux_portY2 ;
  wire \BUBBLE_MUX/Mmux_portY21_124 ;
  wire N6;
  wire \BUBBLE_MUX/Mmux_portY3 ;
  wire \BUBBLE_MUX/Mmux_portY31_127 ;
  wire \BUBBLE_MUX/Mmux_portY4 ;
  wire \BUBBLE_MUX/Mmux_portY41_129 ;
  wire N8;
  wire N10;
  wire \BUBBLE_MUX/Mmux_portY51_132 ;
  wire \BUBBLE_MUX/Mmux_portY52_133 ;
  wire \BUBBLE_MUX/Mmux_portY53_134 ;
  wire \BUBBLE_MUX/Mmux_portY56 ;
  wire \BUBBLE_MUX/Mmux_portY57_136 ;
  wire Mmux_CU_error1;
  wire Mmux_CU_error11_138;
  wire Mmux_CU_error12_139;
  wire N12;
  wire N14;
  wire N16;
  wire \BUBBLE_MUX/Mmux_portY242 ;
  wire \BUBBLE_MUX/Mmux_portY261 ;
  wire \BUBBLE_MUX/Mmux_portY6 ;
  wire \BUBBLE_MUX/Mmux_portY61_146 ;
  wire N18;
  wire N20;
  wire \BUBBLE_MUX/Mmux_portY20 ;
  wire \BUBBLE_MUX/Mmux_portY202 ;
  wire \BUBBLE_MUX/Mmux_portY203_151 ;
  wire \BUBBLE_MUX/Mmux_portY7 ;
  wire N22;
  wire N24;
  wire N26;
  wire \DE_CW/data_out_18_1_207 ;
  wire \DE_CW/data_out_17_1_208 ;
  wire \CU_clk_BUFGP/IBUFG_2 ;
  wire GND;
  wire [3 : 0] \WB_CW/data_out ;
  wire [10 : 10] _n0452;
  wire [16 : 16] GND_4_o_PWR_4_o_select_26_OUT;
  X_FF #(
    .INIT ( 1'b0 ))
  \WB_CW/data_out_3  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(s_reset_regs),
    .I(\MEM_CW/data_out[3] ),
    .O(\WB_CW/data_out [3]),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \WB_CW/data_out_2  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(s_reset_regs),
    .I(\MEM_CW/data_out[2] ),
    .O(\WB_CW/data_out [2]),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \WB_CW/data_out_1  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(s_reset_regs),
    .I(\MEM_CW/data_out[1] ),
    .O(\WB_CW/data_out [1]),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \WB_CW/data_out_0  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(s_reset_regs),
    .I(\MEM_CW/data_out[0] ),
    .O(\WB_CW/data_out [0]),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \DE_CW/data_out_25  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(CU_reset_IBUF_21),
    .I(\s_cw_tmp[1] ),
    .O(\DE_CW/data_out[25] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \DE_CW/data_out_24  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(CU_reset_IBUF_21),
    .I(\s_cw_tmp[2] ),
    .O(\DE_CW/data_out[24] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \DE_CW/data_out_23  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(CU_reset_IBUF_21),
    .I(\s_cw_tmp[3] ),
    .O(\DE_CW/data_out[23] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \DE_CW/data_out_22  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(CU_reset_IBUF_21),
    .I(\s_cw_tmp[4] ),
    .O(\DE_CW/data_out[22] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \DE_CW/data_out_21  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(CU_reset_IBUF_21),
    .I(\s_cw_tmp[5] ),
    .O(\DE_CW/data_out[21] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \DE_CW/data_out_20  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(CU_reset_IBUF_21),
    .I(\s_cw_tmp[6] ),
    .O(\DE_CW/data_out[20] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \DE_CW/data_out_19  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(CU_reset_IBUF_21),
    .I(\s_cw_tmp[7] ),
    .O(\DE_CW/data_out[19] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \DE_CW/data_out_18  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(CU_reset_IBUF_21),
    .I(\s_cw_tmp[8] ),
    .O(\DE_CW/data_out[18] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \DE_CW/data_out_17  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(CU_reset_IBUF_21),
    .I(\s_cw_tmp[9] ),
    .O(\DE_CW/data_out[17] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \DE_CW/data_out_16  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(CU_reset_IBUF_21),
    .I(\s_cw_tmp[10] ),
    .O(\DE_CW/data_out[16] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \DE_CW/data_out_15  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(CU_reset_IBUF_21),
    .I(\s_cw_tmp[11] ),
    .O(\DE_CW/data_out[15] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \DE_CW/data_out_14  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(CU_reset_IBUF_21),
    .I(\s_cw_tmp[12] ),
    .O(\DE_CW/data_out[14] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \DE_CW/data_out_13  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(CU_reset_IBUF_21),
    .I(\s_cw_tmp[13] ),
    .O(\DE_CW/data_out[13] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \DE_CW/data_out_12  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(CU_reset_IBUF_21),
    .I(\s_cw_tmp[14] ),
    .O(\DE_CW/data_out[12] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \DE_CW/data_out_11  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(CU_reset_IBUF_21),
    .I(\s_cw_tmp[15] ),
    .O(\DE_CW/data_out[11] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \DE_CW/data_out_10  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(CU_reset_IBUF_21),
    .I(\s_cw_tmp[16] ),
    .O(\DE_CW/data_out[10] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \DE_CW/data_out_9  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(CU_reset_IBUF_21),
    .I(\s_cw_tmp[17] ),
    .O(\DE_CW/data_out[9] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \DE_CW/data_out_8  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(CU_reset_IBUF_21),
    .I(\s_cw_tmp[18] ),
    .O(\DE_CW/data_out[8] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \DE_CW/data_out_7  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(CU_reset_IBUF_21),
    .I(\s_cw_tmp[19] ),
    .O(\DE_CW/data_out[7] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \DE_CW/data_out_6  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(CU_reset_IBUF_21),
    .I(\s_cw_tmp[20] ),
    .O(\DE_CW/data_out[6] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \DE_CW/data_out_5  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(CU_reset_IBUF_21),
    .I(\BUBBLE_MUX/Mmux_portY143 ),
    .O(\DE_CW/data_out[5] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \DE_CW/data_out_4  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(CU_reset_IBUF_21),
    .I(\s_cw_tmp[22] ),
    .O(\DE_CW/data_out[4] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \DE_CW/data_out_2  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(CU_reset_IBUF_21),
    .I(\s_cw_tmp[24] ),
    .O(\DE_CW/data_out[2] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \DE_CW/data_out_1  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(CU_reset_IBUF_21),
    .I(\s_cw_tmp[25] ),
    .O(\DE_CW/data_out[1] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \DE_CW/data_out_0  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(CU_reset_IBUF_21),
    .I(\s_cw_tmp[26] ),
    .O(\DE_CW/data_out[0] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \EX_CW/data_out_18  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(s_reset_regs),
    .I(\DE_CW/data_out[18] ),
    .O(\EX_CW/data_out[18] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \EX_CW/data_out_17  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(s_reset_regs),
    .I(\DE_CW/data_out[17] ),
    .O(\EX_CW/data_out[17] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \EX_CW/data_out_16  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(s_reset_regs),
    .I(\DE_CW/data_out[16] ),
    .O(\EX_CW/data_out[16] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \EX_CW/data_out_15  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(s_reset_regs),
    .I(\DE_CW/data_out[15] ),
    .O(\EX_CW/data_out[15] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \EX_CW/data_out_14  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(s_reset_regs),
    .I(\DE_CW/data_out[14] ),
    .O(\EX_CW/data_out[14] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \EX_CW/data_out_13  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(s_reset_regs),
    .I(\DE_CW/data_out[13] ),
    .O(\EX_CW/data_out[13] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \EX_CW/data_out_12  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(s_reset_regs),
    .I(\DE_CW/data_out[12] ),
    .O(\EX_CW/data_out[12] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \EX_CW/data_out_11  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(s_reset_regs),
    .I(\DE_CW/data_out[11] ),
    .O(\EX_CW/data_out[11] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \EX_CW/data_out_10  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(s_reset_regs),
    .I(\DE_CW/data_out[10] ),
    .O(\EX_CW/data_out[10] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \EX_CW/data_out_9  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(s_reset_regs),
    .I(\DE_CW/data_out[9] ),
    .O(\EX_CW/data_out[9] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \EX_CW/data_out_8  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(s_reset_regs),
    .I(\DE_CW/data_out[8] ),
    .O(\EX_CW/data_out[8] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \EX_CW/data_out_7  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(s_reset_regs),
    .I(\DE_CW/data_out[7] ),
    .O(\EX_CW/data_out[7] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \EX_CW/data_out_6  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(s_reset_regs),
    .I(\DE_CW/data_out[6] ),
    .O(\EX_CW/data_out[6] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \EX_CW/data_out_5  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(s_reset_regs),
    .I(\DE_CW/data_out[5] ),
    .O(\EX_CW/data_out[5] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \EX_CW/data_out_4  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(s_reset_regs),
    .I(\DE_CW/data_out[4] ),
    .O(\EX_CW/data_out[4] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \EX_CW/data_out_2  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(s_reset_regs),
    .I(\DE_CW/data_out[2] ),
    .O(\EX_CW/data_out[2] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \EX_CW/data_out_1  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(s_reset_regs),
    .I(\DE_CW/data_out[1] ),
    .O(\EX_CW/data_out[1] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \EX_CW/data_out_0  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(s_reset_regs),
    .I(\DE_CW/data_out[0] ),
    .O(\EX_CW/data_out[0] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \MEM_CW/data_out_7  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(s_reset_regs),
    .I(\EX_CW/data_out[7] ),
    .O(\MEM_CW/data_out[7] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \MEM_CW/data_out_5  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(s_reset_regs),
    .I(\EX_CW/data_out[5] ),
    .O(\MEM_CW/data_out[5] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \MEM_CW/data_out_4  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(s_reset_regs),
    .I(\EX_CW/data_out[4] ),
    .O(\MEM_CW/data_out[4] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \MEM_CW/data_out_3  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(s_reset_regs),
    .I(\EX_CW/data_out[6] ),
    .O(\MEM_CW/data_out[3] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \MEM_CW/data_out_2  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(s_reset_regs),
    .I(\EX_CW/data_out[2] ),
    .O(\MEM_CW/data_out[2] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \MEM_CW/data_out_1  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(s_reset_regs),
    .I(\EX_CW/data_out[1] ),
    .O(\MEM_CW/data_out[1] ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \MEM_CW/data_out_0  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(s_reset_regs),
    .I(\EX_CW/data_out[0] ),
    .O(\MEM_CW/data_out[0] ),
    .SET(GND)
  );
  X_LUT2 #(
    .INIT ( 4'h2 ))
  CU_enable_CU_reset_AND_1_o1 (
    .ADR0(CU_enable_IBUF_20),
    .ADR1(CU_reset_IBUF_21),
    .O(CU_enable_CU_reset_AND_1_o)
  );
  X_LUT2 #(
    .INIT ( 4'hE ))
  s_reset_regs1 (
    .ADR0(CU_reset_IBUF_21),
    .ADR1(CU_flush_IBUF_23),
    .O(s_reset_regs)
  );
  X_LUT3 #(
    .INIT ( 8'h02 ))
  \BUBBLE_MUX/Mmux_portY1411  (
    .ADR0(CU_instr_opcode_5_IBUF_3),
    .ADR1(CU_instr_opcode_1_IBUF_7),
    .ADR2(CU_instr_opcode_4_IBUF_4),
    .O(\BUBBLE_MUX/Mmux_portY141_113 )
  );
  X_LUT3 #(
    .INIT ( 8'h02 ))
  \CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<13>31  (
    .ADR0(CU_instr_opcode_3_IBUF_5),
    .ADR1(CU_instr_opcode_5_IBUF_3),
    .ADR2(CU_instr_opcode_4_IBUF_4),
    .O(\CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<13>3 )
  );
  X_LUT5 #(
    .INIT ( 32'h00010000 ))
  \CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<13>21  (
    .ADR0(CU_instr_opcode_0_IBUF_8),
    .ADR1(CU_instr_opcode_1_IBUF_7),
    .ADR2(CU_instr_opcode_2_IBUF_6),
    .ADR3(CU_instr_opcode_4_IBUF_4),
    .ADR4(\CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<12>21 ),
    .O(\CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<13>2 )
  );
  X_LUT3 #(
    .INIT ( 8'h01 ))
  Mmux_CU_error131 (
    .ADR0(CU_instr_opcode_5_IBUF_3),
    .ADR1(CU_instr_opcode_2_IBUF_6),
    .ADR2(CU_instr_opcode_3_IBUF_5),
    .O(Mmux_CU_error13_116)
  );
  X_LUT5 #(
    .INIT ( 32'h02000000 ))
  \_n0452<10>1  (
    .ADR0(CU_instr_opcode_0_IBUF_8),
    .ADR1(CU_instr_opcode_1_IBUF_7),
    .ADR2(CU_instr_opcode_4_IBUF_4),
    .ADR3(GND_4_o_PWR_4_o_select_26_OUT[16]),
    .ADR4(Mmux_CU_error13_116),
    .O(_n0452[10])
  );
  X_LUT3 #(
    .INIT ( 8'h02 ))
  \CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<13>41  (
    .ADR0(\CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<13>2 ),
    .ADR1(CU_instr_opcode_5_IBUF_3),
    .ADR2(CU_instr_opcode_3_IBUF_5),
    .O(\CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<13>4 )
  );
  X_LUT5 #(
    .INIT ( 32'h00000001 ))
  out11 (
    .ADR0(CU_instr_func_10_IBUF_9),
    .ADR1(CU_instr_func_9_IBUF_10),
    .ADR2(CU_instr_func_8_IBUF_11),
    .ADR3(CU_instr_func_7_IBUF_12),
    .ADR4(CU_instr_func_6_IBUF_13),
    .O(\CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<12>21 )
  );
  X_LUT5 #(
    .INIT ( 32'h08800888 ))
  \CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<11>41  (
    .ADR0(CU_instr_opcode_3_IBUF_5),
    .ADR1(CU_instr_opcode_4_IBUF_4),
    .ADR2(CU_instr_opcode_1_IBUF_7),
    .ADR3(CU_instr_opcode_2_IBUF_6),
    .ADR4(CU_instr_opcode_5_IBUF_3),
    .O(\CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<11>4 )
  );
  X_LUT6 #(
    .INIT ( 64'h31D5040035D50404 ))
  \CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<23>11  (
    .ADR0(CU_instr_func_4_IBUF_15),
    .ADR1(CU_instr_func_2_IBUF_17),
    .ADR2(CU_instr_func_3_IBUF_16),
    .ADR3(CU_instr_func_1_IBUF_18),
    .ADR4(CU_instr_func_5_IBUF_14),
    .ADR5(CU_instr_func_0_IBUF_19),
    .O(\CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<23>1 )
  );
  X_LUT2 #(
    .INIT ( 4'h2 ))
  \BUBBLE_MUX/Mmux_portY141  (
    .ADR0(\BUBBLE_MUX/Mmux_portY143 ),
    .ADR1(CU_instr_opcode_0_IBUF_8),
    .O(\s_cw_tmp[22] )
  );
  X_LUT5 #(
    .INIT ( 32'h049C0414 ))
  \CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<23>31  (
    .ADR0(CU_instr_opcode_2_IBUF_6),
    .ADR1(CU_instr_opcode_3_IBUF_5),
    .ADR2(CU_instr_opcode_5_IBUF_3),
    .ADR3(CU_instr_opcode_1_IBUF_7),
    .ADR4(CU_instr_opcode_4_IBUF_4),
    .O(\CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<23>3 )
  );
  X_LUT6 #(
    .INIT ( 64'h0000000800000000 ))
  \BUBBLE_MUX/Mmux_portY211  (
    .ADR0(CU_bubble_IBUF_24),
    .ADR1(CU_enable_CU_reset_AND_1_o),
    .ADR2(CU_instr_opcode_2_IBUF_6),
    .ADR3(CU_instr_opcode_3_IBUF_5),
    .ADR4(CU_instr_opcode_5_IBUF_3),
    .ADR5(CU_instr_opcode_1_IBUF_7),
    .O(\s_cw_tmp[4] )
  );
  X_LUT6 #(
    .INIT ( 64'h0404040000040000 ))
  \CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<23>21  (
    .ADR0(CU_instr_opcode_3_IBUF_5),
    .ADR1(CU_instr_opcode_4_IBUF_4),
    .ADR2(CU_instr_opcode_5_IBUF_3),
    .ADR3(CU_instr_opcode_0_IBUF_8),
    .ADR4(CU_instr_opcode_2_IBUF_6),
    .ADR5(CU_instr_opcode_1_IBUF_7),
    .O(\CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<23>2 )
  );
  X_LUT2 #(
    .INIT ( 4'h7 ))
  \BUBBLE_MUX/Mmux_portY23_SW0  (
    .ADR0(CU_instr_opcode_1_IBUF_7),
    .ADR1(CU_bubble_IBUF_24),
    .O(N2)
  );
  X_LUT6 #(
    .INIT ( 64'hFFFFFFFEFFFFFFFF ))
  \BUBBLE_MUX/Mmux_portY23  (
    .ADR0(N2),
    .ADR1(CU_instr_opcode_5_IBUF_3),
    .ADR2(CU_instr_opcode_4_IBUF_4),
    .ADR3(CU_instr_opcode_3_IBUF_5),
    .ADR4(CU_instr_opcode_2_IBUF_6),
    .ADR5(CU_enable_CU_reset_AND_1_o),
    .O(\s_cw_tmp[6] )
  );
  X_LUT3 #(
    .INIT ( 8'h2F ))
  \BUBBLE_MUX/Mmux_portY10_SW0  (
    .ADR0(CU_instr_opcode_1_IBUF_7),
    .ADR1(CU_instr_opcode_0_IBUF_8),
    .ADR2(CU_bubble_IBUF_24),
    .O(N4)
  );
  X_LUT6 #(
    .INIT ( 64'hFFFFFFDFFFFFFFFF ))
  \BUBBLE_MUX/Mmux_portY10  (
    .ADR0(CU_enable_CU_reset_AND_1_o),
    .ADR1(N4),
    .ADR2(CU_instr_opcode_5_IBUF_3),
    .ADR3(CU_instr_opcode_4_IBUF_4),
    .ADR4(CU_instr_opcode_2_IBUF_6),
    .ADR5(CU_instr_opcode_3_IBUF_5),
    .O(\s_cw_tmp[19] )
  );
  X_LUT3 #(
    .INIT ( 8'h2A ))
  \BUBBLE_MUX/Mmux_portY27  (
    .ADR0(CU_instr_func_5_IBUF_14),
    .ADR1(CU_instr_func_0_IBUF_19),
    .ADR2(CU_instr_func_1_IBUF_18),
    .O(\BUBBLE_MUX/Mmux_portY21_124 )
  );
  X_LUT6 #(
    .INIT ( 64'h8888888088808880 ))
  \BUBBLE_MUX/Mmux_portY28  (
    .ADR0(CU_enable_CU_reset_AND_1_o),
    .ADR1(CU_bubble_IBUF_24),
    .ADR2(_n0452[10]),
    .ADR3(\BUBBLE_MUX/Mmux_portY2 ),
    .ADR4(\CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<15>3 ),
    .ADR5(\BUBBLE_MUX/Mmux_portY21_124 ),
    .O(\s_cw_tmp[11] )
  );
  X_LUT5 #(
    .INIT ( 32'h535FF1F5 ))
  \CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<25>1_SW0  (
    .ADR0(CU_instr_opcode_3_IBUF_5),
    .ADR1(CU_instr_opcode_5_IBUF_3),
    .ADR2(CU_instr_opcode_4_IBUF_4),
    .ADR3(CU_instr_opcode_0_IBUF_8),
    .ADR4(CU_instr_opcode_1_IBUF_7),
    .O(N6)
  );
  X_LUT6 #(
    .INIT ( 64'hFFFFFFFFF8F8F8FF ))
  \CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<25>1  (
    .ADR0(\CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<13>2 ),
    .ADR1(\CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<23>1 ),
    .ADR2(_n0452[10]),
    .ADR3(CU_instr_opcode_2_IBUF_6),
    .ADR4(N6),
    .ADR5(\CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<23>3 ),
    .O(\CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<25>1_109 )
  );
  X_LUT6 #(
    .INIT ( 64'h000005005880A2A0 ))
  \BUBBLE_MUX/Mmux_portY31  (
    .ADR0(CU_instr_opcode_2_IBUF_6),
    .ADR1(CU_instr_opcode_0_IBUF_8),
    .ADR2(CU_instr_opcode_3_IBUF_5),
    .ADR3(CU_instr_opcode_4_IBUF_4),
    .ADR4(CU_instr_opcode_1_IBUF_7),
    .ADR5(CU_instr_opcode_5_IBUF_3),
    .O(\BUBBLE_MUX/Mmux_portY3 )
  );
  X_LUT6 #(
    .INIT ( 64'h1414040400004004 ))
  \BUBBLE_MUX/Mmux_portY32  (
    .ADR0(CU_instr_func_4_IBUF_15),
    .ADR1(CU_instr_func_2_IBUF_17),
    .ADR2(CU_instr_func_1_IBUF_18),
    .ADR3(CU_instr_func_0_IBUF_19),
    .ADR4(CU_instr_func_3_IBUF_16),
    .ADR5(CU_instr_func_5_IBUF_14),
    .O(\BUBBLE_MUX/Mmux_portY31_127 )
  );
  X_LUT6 #(
    .INIT ( 64'h0400104004401000 ))
  \BUBBLE_MUX/Mmux_portY41  (
    .ADR0(CU_instr_opcode_5_IBUF_3),
    .ADR1(CU_instr_opcode_2_IBUF_6),
    .ADR2(CU_instr_opcode_3_IBUF_5),
    .ADR3(CU_instr_opcode_4_IBUF_4),
    .ADR4(CU_instr_opcode_1_IBUF_7),
    .ADR5(CU_instr_opcode_0_IBUF_8),
    .O(\BUBBLE_MUX/Mmux_portY4 )
  );
  X_LUT6 #(
    .INIT ( 64'h0014100010041000 ))
  \BUBBLE_MUX/Mmux_portY42  (
    .ADR0(CU_instr_func_4_IBUF_15),
    .ADR1(CU_instr_func_3_IBUF_16),
    .ADR2(CU_instr_func_2_IBUF_17),
    .ADR3(CU_instr_func_1_IBUF_18),
    .ADR4(CU_instr_func_5_IBUF_14),
    .ADR5(CU_instr_func_0_IBUF_19),
    .O(\BUBBLE_MUX/Mmux_portY41_129 )
  );
  X_LUT6 #(
    .INIT ( 64'h1014475710144444 ))
  \BUBBLE_MUX/Mmux_portY11_SW0  (
    .ADR0(CU_instr_opcode_5_IBUF_3),
    .ADR1(CU_instr_opcode_3_IBUF_5),
    .ADR2(CU_instr_opcode_4_IBUF_4),
    .ADR3(CU_instr_opcode_0_IBUF_8),
    .ADR4(CU_instr_opcode_1_IBUF_7),
    .ADR5(CU_instr_opcode_2_IBUF_6),
    .O(N8)
  );
  X_LUT4 #(
    .INIT ( 16'hDFDB ))
  \BUBBLE_MUX/Mmux_portY22_SW0  (
    .ADR0(CU_instr_opcode_4_IBUF_4),
    .ADR1(CU_instr_opcode_2_IBUF_6),
    .ADR2(CU_instr_opcode_1_IBUF_7),
    .ADR3(CU_instr_opcode_0_IBUF_8),
    .O(N10)
  );
  X_LUT6 #(
    .INIT ( 64'h0100000041404040 ))
  \BUBBLE_MUX/Mmux_portY52  (
    .ADR0(CU_instr_opcode_4_IBUF_4),
    .ADR1(CU_instr_opcode_5_IBUF_3),
    .ADR2(CU_instr_opcode_0_IBUF_8),
    .ADR3(CU_instr_opcode_1_IBUF_7),
    .ADR4(CU_instr_opcode_3_IBUF_5),
    .ADR5(CU_instr_opcode_2_IBUF_6),
    .O(\BUBBLE_MUX/Mmux_portY51_132 )
  );
  X_LUT5 #(
    .INIT ( 32'hCC026222 ))
  \BUBBLE_MUX/Mmux_portY53  (
    .ADR0(CU_instr_opcode_5_IBUF_3),
    .ADR1(CU_instr_opcode_3_IBUF_5),
    .ADR2(CU_instr_opcode_0_IBUF_8),
    .ADR3(CU_instr_opcode_2_IBUF_6),
    .ADR4(CU_instr_opcode_4_IBUF_4),
    .O(\BUBBLE_MUX/Mmux_portY52_133 )
  );
  X_LUT6 #(
    .INIT ( 64'h0000000A80808882 ))
  \BUBBLE_MUX/Mmux_portY54  (
    .ADR0(CU_instr_func_5_IBUF_14),
    .ADR1(CU_instr_func_2_IBUF_17),
    .ADR2(CU_instr_func_3_IBUF_16),
    .ADR3(CU_instr_func_0_IBUF_19),
    .ADR4(CU_instr_func_4_IBUF_15),
    .ADR5(CU_instr_func_1_IBUF_18),
    .O(\BUBBLE_MUX/Mmux_portY53_134 )
  );
  X_LUT2 #(
    .INIT ( 4'h1 ))
  \BUBBLE_MUX/Mmux_portY58  (
    .ADR0(CU_instr_opcode_2_IBUF_6),
    .ADR1(CU_instr_opcode_4_IBUF_4),
    .O(\BUBBLE_MUX/Mmux_portY57_136 )
  );
  X_LUT6 #(
    .INIT ( 64'hAAAAAAAA22222000 ))
  \BUBBLE_MUX/Mmux_portY59  (
    .ADR0(\BUBBLE_MUX/Mmux_portY20 ),
    .ADR1(CU_instr_opcode_1_IBUF_7),
    .ADR2(\BUBBLE_MUX/Mmux_portY57_136 ),
    .ADR3(\BUBBLE_MUX/Mmux_portY56 ),
    .ADR4(\BUBBLE_MUX/Mmux_portY52_133 ),
    .ADR5(\BUBBLE_MUX/Mmux_portY51_132 ),
    .O(\s_cw_tmp[14] )
  );
  X_LUT4 #(
    .INIT ( 16'h0001 ))
  Mmux_CU_error11 (
    .ADR0(CU_instr_opcode_3_IBUF_5),
    .ADR1(CU_instr_opcode_5_IBUF_3),
    .ADR2(CU_instr_opcode_2_IBUF_6),
    .ADR3(CU_instr_opcode_1_IBUF_7),
    .O(Mmux_CU_error1)
  );
  X_LUT6 #(
    .INIT ( 64'hAAAA0222AAAA8AAA ))
  Mmux_CU_error12 (
    .ADR0(Mmux_CU_error1),
    .ADR1(CU_instr_opcode_0_IBUF_8),
    .ADR2(\CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<23>1 ),
    .ADR3(\CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<12>21 ),
    .ADR4(CU_instr_opcode_4_IBUF_4),
    .ADR5(GND_4_o_PWR_4_o_select_26_OUT[16]),
    .O(Mmux_CU_error11_138)
  );
  X_LUT6 #(
    .INIT ( 64'h6B0828806B2A2880 ))
  Mmux_CU_error13 (
    .ADR0(CU_instr_opcode_5_IBUF_3),
    .ADR1(CU_instr_opcode_4_IBUF_4),
    .ADR2(CU_instr_opcode_3_IBUF_5),
    .ADR3(CU_instr_opcode_2_IBUF_6),
    .ADR4(CU_instr_opcode_1_IBUF_7),
    .ADR5(CU_instr_opcode_0_IBUF_8),
    .O(Mmux_CU_error12_139)
  );
  X_LUT2 #(
    .INIT ( 4'hB ))
  \GND_4_o_PWR_4_o_select_26_OUT<16>_SW0  (
    .ADR0(CU_instr_func_0_IBUF_19),
    .ADR1(CU_instr_func_1_IBUF_18),
    .O(N12)
  );
  X_LUT6 #(
    .INIT ( 64'h0000002000200000 ))
  \GND_4_o_PWR_4_o_select_26_OUT<16>  (
    .ADR0(\CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<12>21 ),
    .ADR1(CU_instr_func_5_IBUF_14),
    .ADR2(CU_instr_func_2_IBUF_17),
    .ADR3(N12),
    .ADR4(CU_instr_func_3_IBUF_16),
    .ADR5(CU_instr_func_4_IBUF_15),
    .O(GND_4_o_PWR_4_o_select_26_OUT[16])
  );
  X_LUT3 #(
    .INIT ( 8'h80 ))
  \BUBBLE_MUX/Mmux_portY8_SW0  (
    .ADR0(CU_instr_opcode_1_IBUF_7),
    .ADR1(CU_instr_opcode_0_IBUF_8),
    .ADR2(CU_bubble_IBUF_24),
    .O(N14)
  );
  X_LUT6 #(
    .INIT ( 64'h8000000000000000 ))
  \BUBBLE_MUX/Mmux_portY8  (
    .ADR0(CU_enable_CU_reset_AND_1_o),
    .ADR1(CU_instr_opcode_5_IBUF_3),
    .ADR2(CU_instr_opcode_4_IBUF_4),
    .ADR3(CU_instr_opcode_3_IBUF_5),
    .ADR4(CU_instr_opcode_2_IBUF_6),
    .ADR5(N14),
    .O(\s_cw_tmp[17] )
  );
  X_LUT3 #(
    .INIT ( 8'hBF ))
  \BUBBLE_MUX/Mmux_portY9_SW0  (
    .ADR0(CU_instr_opcode_0_IBUF_8),
    .ADR1(CU_instr_opcode_1_IBUF_7),
    .ADR2(CU_bubble_IBUF_24),
    .O(N16)
  );
  X_LUT6 #(
    .INIT ( 64'h0000000080000000 ))
  \BUBBLE_MUX/Mmux_portY9  (
    .ADR0(CU_enable_CU_reset_AND_1_o),
    .ADR1(CU_instr_opcode_5_IBUF_3),
    .ADR2(CU_instr_opcode_4_IBUF_4),
    .ADR3(CU_instr_opcode_3_IBUF_5),
    .ADR4(CU_instr_opcode_2_IBUF_6),
    .ADR5(N16),
    .O(\s_cw_tmp[18] )
  );
  X_LUT5 #(
    .INIT ( 32'h14100400 ))
  \BUBBLE_MUX/Mmux_portY262  (
    .ADR0(CU_instr_opcode_3_IBUF_5),
    .ADR1(CU_instr_opcode_5_IBUF_3),
    .ADR2(CU_instr_opcode_1_IBUF_7),
    .ADR3(CU_instr_opcode_4_IBUF_4),
    .ADR4(CU_instr_opcode_0_IBUF_8),
    .O(\BUBBLE_MUX/Mmux_portY261 )
  );
  X_LUT6 #(
    .INIT ( 64'hA820202020202020 ))
  \BUBBLE_MUX/Mmux_portY263  (
    .ADR0(\BUBBLE_MUX/Mmux_portY20 ),
    .ADR1(CU_instr_opcode_2_IBUF_6),
    .ADR2(\BUBBLE_MUX/Mmux_portY261 ),
    .ADR3(CU_instr_opcode_1_IBUF_7),
    .ADR4(\CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<13>3 ),
    .ADR5(CU_instr_opcode_0_IBUF_8),
    .O(\s_cw_tmp[9] )
  );
  X_LUT5 #(
    .INIT ( 32'hFF404040 ))
  \BUBBLE_MUX/Mmux_portY61  (
    .ADR0(CU_instr_opcode_2_IBUF_6),
    .ADR1(CU_instr_opcode_1_IBUF_7),
    .ADR2(\CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<13>3 ),
    .ADR3(\CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<11>4 ),
    .ADR4(CU_instr_opcode_0_IBUF_8),
    .O(\BUBBLE_MUX/Mmux_portY6 )
  );
  X_LUT6 #(
    .INIT ( 64'h0080800000808A80 ))
  \BUBBLE_MUX/Mmux_portY62  (
    .ADR0(CU_instr_func_5_IBUF_14),
    .ADR1(CU_instr_func_0_IBUF_19),
    .ADR2(CU_instr_func_3_IBUF_16),
    .ADR3(CU_instr_func_1_IBUF_18),
    .ADR4(CU_instr_func_2_IBUF_17),
    .ADR5(CU_instr_func_4_IBUF_15),
    .O(\BUBBLE_MUX/Mmux_portY61_146 )
  );
  X_LUT5 #(
    .INIT ( 32'hF55DFFFF ))
  \BUBBLE_MUX/Mmux_portY1_SW0  (
    .ADR0(CU_instr_func_5_IBUF_14),
    .ADR1(CU_instr_func_4_IBUF_15),
    .ADR2(CU_instr_func_1_IBUF_18),
    .ADR3(CU_instr_func_2_IBUF_17),
    .ADR4(CU_instr_func_3_IBUF_16),
    .O(N18)
  );
  X_LUT6 #(
    .INIT ( 64'h8888888880808880 ))
  \BUBBLE_MUX/Mmux_portY1  (
    .ADR0(CU_bubble_IBUF_24),
    .ADR1(CU_enable_CU_reset_AND_1_o),
    .ADR2(\CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<11>4 ),
    .ADR3(\CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<13>4 ),
    .ADR4(N18),
    .ADR5(_n0452[10]),
    .O(\s_cw_tmp[10] )
  );
  X_LUT6 #(
    .INIT ( 64'hFBFBFFFBFFFFFFFF ))
  \BUBBLE_MUX/Mmux_portY19_SW0  (
    .ADR0(CU_instr_opcode_2_IBUF_6),
    .ADR1(CU_instr_opcode_5_IBUF_3),
    .ADR2(CU_instr_opcode_4_IBUF_4),
    .ADR3(CU_instr_opcode_1_IBUF_7),
    .ADR4(CU_instr_opcode_0_IBUF_8),
    .ADR5(CU_instr_opcode_3_IBUF_5),
    .O(N20)
  );
  X_LUT6 #(
    .INIT ( 64'h8888888880008888 ))
  \BUBBLE_MUX/Mmux_portY19  (
    .ADR0(CU_bubble_IBUF_24),
    .ADR1(CU_enable_CU_reset_AND_1_o),
    .ADR2(\CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<13>4 ),
    .ADR3(\CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<23>1 ),
    .ADR4(N20),
    .ADR5(_n0452[10]),
    .O(\s_cw_tmp[2] )
  );
  X_LUT6 #(
    .INIT ( 64'hAAAAAAAA22222000 ))
  \BUBBLE_MUX/Mmux_portY205  (
    .ADR0(\BUBBLE_MUX/Mmux_portY20 ),
    .ADR1(CU_instr_opcode_3_IBUF_5),
    .ADR2(\CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<23>1 ),
    .ADR3(\CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<13>2 ),
    .ADR4(\BUBBLE_MUX/Mmux_portY203_151 ),
    .ADR5(\BUBBLE_MUX/Mmux_portY202 ),
    .O(\s_cw_tmp[3] )
  );
  X_LUT6 #(
    .INIT ( 64'h1140110011405140 ))
  \BUBBLE_MUX/Mmux_portY71  (
    .ADR0(CU_instr_opcode_5_IBUF_3),
    .ADR1(CU_instr_opcode_4_IBUF_4),
    .ADR2(CU_instr_opcode_2_IBUF_6),
    .ADR3(CU_instr_opcode_3_IBUF_5),
    .ADR4(CU_instr_opcode_1_IBUF_7),
    .ADR5(CU_instr_opcode_0_IBUF_8),
    .O(\BUBBLE_MUX/Mmux_portY7 )
  );
  X_LUT6 #(
    .INIT ( 64'h8888888880808880 ))
  \BUBBLE_MUX/Mmux_portY72  (
    .ADR0(CU_enable_CU_reset_AND_1_o),
    .ADR1(CU_bubble_IBUF_24),
    .ADR2(\CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<25>1_109 ),
    .ADR3(\BUBBLE_MUX/Mmux_portY141_113 ),
    .ADR4(CU_instr_opcode_3_IBUF_5),
    .ADR5(\BUBBLE_MUX/Mmux_portY7 ),
    .O(\s_cw_tmp[16] )
  );
  X_LUT4 #(
    .INIT ( 16'hFFAE ))
  \s_cw_tmp<20>_SW0  (
    .ADR0(CU_instr_opcode_4_IBUF_4),
    .ADR1(CU_instr_opcode_1_IBUF_7),
    .ADR2(CU_instr_opcode_0_IBUF_8),
    .ADR3(CU_instr_opcode_2_IBUF_6),
    .O(N22)
  );
  X_LUT6 #(
    .INIT ( 64'h0080008088880080 ))
  \s_cw_tmp<20>  (
    .ADR0(CU_bubble_IBUF_24),
    .ADR1(CU_enable_CU_reset_AND_1_o),
    .ADR2(CU_instr_opcode_5_IBUF_3),
    .ADR3(N22),
    .ADR4(\BUBBLE_MUX/Mmux_portY141_113 ),
    .ADR5(CU_instr_opcode_3_IBUF_5),
    .O(\s_cw_tmp[20] )
  );
  X_BUF   CU_instr_opcode_5_IBUF (
    .I(CU_instr_opcode[5]),
    .O(CU_instr_opcode_5_IBUF_3)
  );
  X_BUF   CU_instr_opcode_4_IBUF (
    .I(CU_instr_opcode[4]),
    .O(CU_instr_opcode_4_IBUF_4)
  );
  X_BUF   CU_instr_opcode_3_IBUF (
    .I(CU_instr_opcode[3]),
    .O(CU_instr_opcode_3_IBUF_5)
  );
  X_BUF   CU_instr_opcode_2_IBUF (
    .I(CU_instr_opcode[2]),
    .O(CU_instr_opcode_2_IBUF_6)
  );
  X_BUF   CU_instr_opcode_1_IBUF (
    .I(CU_instr_opcode[1]),
    .O(CU_instr_opcode_1_IBUF_7)
  );
  X_BUF   CU_instr_opcode_0_IBUF (
    .I(CU_instr_opcode[0]),
    .O(CU_instr_opcode_0_IBUF_8)
  );
  X_BUF   CU_instr_func_10_IBUF (
    .I(CU_instr_func[10]),
    .O(CU_instr_func_10_IBUF_9)
  );
  X_BUF   CU_instr_func_9_IBUF (
    .I(CU_instr_func[9]),
    .O(CU_instr_func_9_IBUF_10)
  );
  X_BUF   CU_instr_func_8_IBUF (
    .I(CU_instr_func[8]),
    .O(CU_instr_func_8_IBUF_11)
  );
  X_BUF   CU_instr_func_7_IBUF (
    .I(CU_instr_func[7]),
    .O(CU_instr_func_7_IBUF_12)
  );
  X_BUF   CU_instr_func_6_IBUF (
    .I(CU_instr_func[6]),
    .O(CU_instr_func_6_IBUF_13)
  );
  X_BUF   CU_instr_func_5_IBUF (
    .I(CU_instr_func[5]),
    .O(CU_instr_func_5_IBUF_14)
  );
  X_BUF   CU_instr_func_4_IBUF (
    .I(CU_instr_func[4]),
    .O(CU_instr_func_4_IBUF_15)
  );
  X_BUF   CU_instr_func_3_IBUF (
    .I(CU_instr_func[3]),
    .O(CU_instr_func_3_IBUF_16)
  );
  X_BUF   CU_instr_func_2_IBUF (
    .I(CU_instr_func[2]),
    .O(CU_instr_func_2_IBUF_17)
  );
  X_BUF   CU_instr_func_1_IBUF (
    .I(CU_instr_func[1]),
    .O(CU_instr_func_1_IBUF_18)
  );
  X_BUF   CU_instr_func_0_IBUF (
    .I(CU_instr_func[0]),
    .O(CU_instr_func_0_IBUF_19)
  );
  X_BUF   CU_enable_IBUF (
    .I(CU_enable),
    .O(CU_enable_IBUF_20)
  );
  X_BUF   CU_reset_IBUF (
    .I(CU_reset),
    .O(CU_reset_IBUF_21)
  );
  X_BUF   CU_flush_IBUF (
    .I(CU_flush),
    .O(CU_flush_IBUF_23)
  );
  X_BUF   CU_bubble_IBUF (
    .I(CU_bubble),
    .O(CU_bubble_IBUF_24)
  );
  X_LUT6 #(
    .INIT ( 64'h1140171401110714 ))
  \BUBBLE_MUX/Mmux_portY243  (
    .ADR0(CU_instr_opcode_4_IBUF_4),
    .ADR1(CU_instr_opcode_2_IBUF_6),
    .ADR2(CU_instr_opcode_1_IBUF_7),
    .ADR3(CU_instr_opcode_5_IBUF_3),
    .ADR4(CU_instr_opcode_3_IBUF_5),
    .ADR5(CU_instr_opcode_0_IBUF_8),
    .O(\BUBBLE_MUX/Mmux_portY242 )
  );
  X_LUT5 #(
    .INIT ( 32'hFFF7FFFF ))
  \BUBBLE_MUX/Mmux_portY57_SW0  (
    .ADR0(CU_instr_func_1_IBUF_18),
    .ADR1(CU_instr_func_2_IBUF_17),
    .ADR2(CU_instr_func_5_IBUF_14),
    .ADR3(CU_instr_func_4_IBUF_15),
    .ADR4(CU_instr_func_3_IBUF_16),
    .O(N24)
  );
  X_LUT6 #(
    .INIT ( 64'h55405540554055C8 ))
  \BUBBLE_MUX/Mmux_portY57  (
    .ADR0(CU_instr_opcode_0_IBUF_8),
    .ADR1(\CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<12>21 ),
    .ADR2(\BUBBLE_MUX/Mmux_portY53_134 ),
    .ADR3(CU_instr_opcode_3_IBUF_5),
    .ADR4(CU_instr_func_0_IBUF_19),
    .ADR5(N24),
    .O(\BUBBLE_MUX/Mmux_portY56 )
  );
  X_LUT5 #(
    .INIT ( 32'hFFFF4044 ))
  \BUBBLE_MUX/Mmux_portY253_SW0  (
    .ADR0(CU_instr_func_5_IBUF_14),
    .ADR1(\CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<15>3 ),
    .ADR2(CU_instr_func_1_IBUF_18),
    .ADR3(CU_instr_func_0_IBUF_19),
    .ADR4(\CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<23>2 ),
    .O(N26)
  );
  X_LUT6 #(
    .INIT ( 64'h8880808080808080 ))
  \BUBBLE_MUX/Mmux_portY253  (
    .ADR0(CU_bubble_IBUF_24),
    .ADR1(CU_enable_CU_reset_AND_1_o),
    .ADR2(N26),
    .ADR3(CU_instr_opcode_0_IBUF_8),
    .ADR4(CU_instr_opcode_1_IBUF_7),
    .ADR5(Mmux_CU_error13_116),
    .O(\s_cw_tmp[8] )
  );
  X_LUT5 #(
    .INIT ( 32'h10541010 ))
  \BUBBLE_MUX/Mmux_portY204  (
    .ADR0(CU_instr_opcode_4_IBUF_4),
    .ADR1(CU_instr_opcode_1_IBUF_7),
    .ADR2(CU_instr_opcode_5_IBUF_3),
    .ADR3(CU_instr_opcode_2_IBUF_6),
    .ADR4(CU_instr_opcode_0_IBUF_8),
    .O(\BUBBLE_MUX/Mmux_portY203_151 )
  );
  X_LUT6 #(
    .INIT ( 64'h0000000000000200 ))
  \CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<15>31  (
    .ADR0(CU_instr_func_2_IBUF_17),
    .ADR1(CU_instr_func_3_IBUF_16),
    .ADR2(CU_instr_func_4_IBUF_15),
    .ADR3(\CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<13>2 ),
    .ADR4(CU_instr_opcode_5_IBUF_3),
    .ADR5(CU_instr_opcode_3_IBUF_5),
    .O(\CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<15>3 )
  );
  X_LUT6 #(
    .INIT ( 64'h1000000000000000 ))
  \BUBBLE_MUX/Mmux_portY1431  (
    .ADR0(CU_reset_IBUF_21),
    .ADR1(CU_instr_opcode_2_IBUF_6),
    .ADR2(CU_bubble_IBUF_24),
    .ADR3(CU_instr_opcode_3_IBUF_5),
    .ADR4(CU_enable_IBUF_20),
    .ADR5(\BUBBLE_MUX/Mmux_portY141_113 ),
    .O(\BUBBLE_MUX/Mmux_portY143 )
  );
  X_LUT6 #(
    .INIT ( 64'h0000000800000000 ))
  \BUBBLE_MUX/Mmux_portY181  (
    .ADR0(CU_bubble_IBUF_24),
    .ADR1(CU_enable_IBUF_20),
    .ADR2(CU_reset_IBUF_21),
    .ADR3(CU_instr_opcode_2_IBUF_6),
    .ADR4(CU_instr_opcode_3_IBUF_5),
    .ADR5(\BUBBLE_MUX/Mmux_portY141_113 ),
    .O(\s_cw_tmp[26] )
  );
  X_LUT6 #(
    .INIT ( 64'h0000000800000000 ))
  \BUBBLE_MUX/Mmux_portY171  (
    .ADR0(CU_bubble_IBUF_24),
    .ADR1(CU_enable_IBUF_20),
    .ADR2(CU_reset_IBUF_21),
    .ADR3(CU_instr_opcode_0_IBUF_8),
    .ADR4(CU_instr_opcode_3_IBUF_5),
    .ADR5(\BUBBLE_MUX/Mmux_portY141_113 ),
    .O(\s_cw_tmp[25] )
  );
  X_LUT5 #(
    .INIT ( 32'h02000000 ))
  \BUBBLE_MUX/Mmux_portY161  (
    .ADR0(CU_bubble_IBUF_24),
    .ADR1(CU_reset_IBUF_21),
    .ADR2(CU_instr_opcode_3_IBUF_5),
    .ADR3(CU_enable_IBUF_20),
    .ADR4(\BUBBLE_MUX/Mmux_portY141_113 ),
    .O(\s_cw_tmp[24] )
  );
  X_LUT6 #(
    .INIT ( 64'h0000020002000200 ))
  \BUBBLE_MUX/Mmux_portY21  (
    .ADR0(CU_instr_opcode_3_IBUF_5),
    .ADR1(CU_instr_opcode_5_IBUF_3),
    .ADR2(CU_instr_opcode_4_IBUF_4),
    .ADR3(CU_instr_opcode_2_IBUF_6),
    .ADR4(CU_instr_opcode_0_IBUF_8),
    .ADR5(CU_instr_opcode_1_IBUF_7),
    .O(\BUBBLE_MUX/Mmux_portY2 )
  );
  X_LUT6 #(
    .INIT ( 64'h0808080008000800 ))
  \BUBBLE_MUX/Mmux_portY33  (
    .ADR0(CU_bubble_IBUF_24),
    .ADR1(CU_enable_IBUF_20),
    .ADR2(CU_reset_IBUF_21),
    .ADR3(\BUBBLE_MUX/Mmux_portY3 ),
    .ADR4(\CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<13>4 ),
    .ADR5(\BUBBLE_MUX/Mmux_portY31_127 ),
    .O(\s_cw_tmp[12] )
  );
  X_LUT6 #(
    .INIT ( 64'h0808080008000800 ))
  \BUBBLE_MUX/Mmux_portY43  (
    .ADR0(CU_bubble_IBUF_24),
    .ADR1(CU_enable_IBUF_20),
    .ADR2(CU_reset_IBUF_21),
    .ADR3(\BUBBLE_MUX/Mmux_portY4 ),
    .ADR4(\CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<13>4 ),
    .ADR5(\BUBBLE_MUX/Mmux_portY41_129 ),
    .O(\s_cw_tmp[13] )
  );
  X_LUT5 #(
    .INIT ( 32'h20202000 ))
  \BUBBLE_MUX/Mmux_portY11  (
    .ADR0(CU_enable_IBUF_20),
    .ADR1(CU_reset_IBUF_21),
    .ADR2(CU_bubble_IBUF_24),
    .ADR3(\CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<25>1_109 ),
    .ADR4(N8),
    .O(\s_cw_tmp[1] )
  );
  X_LUT6 #(
    .INIT ( 64'h0000000000000200 ))
  \BUBBLE_MUX/Mmux_portY22  (
    .ADR0(CU_bubble_IBUF_24),
    .ADR1(CU_reset_IBUF_21),
    .ADR2(CU_instr_opcode_5_IBUF_3),
    .ADR3(CU_enable_IBUF_20),
    .ADR4(CU_instr_opcode_3_IBUF_5),
    .ADR5(N10),
    .O(\s_cw_tmp[5] )
  );
  X_LUT3 #(
    .INIT ( 8'h08 ))
  \BUBBLE_MUX/Mmux_portY51  (
    .ADR0(CU_bubble_IBUF_24),
    .ADR1(CU_enable_IBUF_20),
    .ADR2(CU_reset_IBUF_21),
    .O(\BUBBLE_MUX/Mmux_portY20 )
  );
  X_LUT4 #(
    .INIT ( 16'hFFFD ))
  Mmux_CU_error14 (
    .ADR0(CU_enable_IBUF_20),
    .ADR1(Mmux_CU_error12_139),
    .ADR2(CU_reset_IBUF_21),
    .ADR3(Mmux_CU_error11_138),
    .O(CU_error_OBUF_105)
  );
  X_LUT4 #(
    .INIT ( 16'h0800 ))
  \BUBBLE_MUX/Mmux_portY244  (
    .ADR0(\BUBBLE_MUX/Mmux_portY242 ),
    .ADR1(CU_enable_IBUF_20),
    .ADR2(CU_reset_IBUF_21),
    .ADR3(CU_bubble_IBUF_24),
    .O(\s_cw_tmp[7] )
  );
  X_LUT6 #(
    .INIT ( 64'h0808080008000800 ))
  \BUBBLE_MUX/Mmux_portY63  (
    .ADR0(CU_bubble_IBUF_24),
    .ADR1(CU_enable_IBUF_20),
    .ADR2(CU_reset_IBUF_21),
    .ADR3(\BUBBLE_MUX/Mmux_portY6 ),
    .ADR4(\CU_instr_opcode[5]_GND_4_o_wide_mux_27_OUT<13>4 ),
    .ADR5(\BUBBLE_MUX/Mmux_portY61_146 ),
    .O(\s_cw_tmp[15] )
  );
  X_LUT6 #(
    .INIT ( 64'h886A85EA886E85AA ))
  \BUBBLE_MUX/Mmux_portY203  (
    .ADR0(CU_instr_opcode_3_IBUF_5),
    .ADR1(CU_instr_opcode_4_IBUF_4),
    .ADR2(CU_instr_opcode_1_IBUF_7),
    .ADR3(CU_instr_opcode_5_IBUF_3),
    .ADR4(CU_instr_opcode_2_IBUF_6),
    .ADR5(CU_instr_opcode_0_IBUF_8),
    .O(\BUBBLE_MUX/Mmux_portY202 )
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \DE_CW/data_out_18_1  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(CU_reset_IBUF_21),
    .I(\s_cw_tmp[8] ),
    .O(\DE_CW/data_out_18_1_207 ),
    .SET(GND)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \DE_CW/data_out_17_1  (
    .CLK(CU_clk_BUFGP),
    .CE(CU_enable_IBUF_20),
    .RST(CU_reset_IBUF_21),
    .I(\s_cw_tmp[9] ),
    .O(\DE_CW/data_out_17_1_208 ),
    .SET(GND)
  );
  X_IPAD   CU_clk_187 (
    .PAD(CU_clk)
  );
  X_IPAD   \CU_instr_opcode<5>  (
    .PAD(CU_instr_opcode[5])
  );
  X_IPAD   \CU_instr_opcode<4>  (
    .PAD(CU_instr_opcode[4])
  );
  X_IPAD   \CU_instr_opcode<3>  (
    .PAD(CU_instr_opcode[3])
  );
  X_IPAD   \CU_instr_opcode<2>  (
    .PAD(CU_instr_opcode[2])
  );
  X_IPAD   \CU_instr_opcode<1>  (
    .PAD(CU_instr_opcode[1])
  );
  X_IPAD   \CU_instr_opcode<0>  (
    .PAD(CU_instr_opcode[0])
  );
  X_IPAD   \CU_instr_func<10>  (
    .PAD(CU_instr_func[10])
  );
  X_IPAD   \CU_instr_func<9>  (
    .PAD(CU_instr_func[9])
  );
  X_IPAD   \CU_instr_func<8>  (
    .PAD(CU_instr_func[8])
  );
  X_IPAD   \CU_instr_func<7>  (
    .PAD(CU_instr_func[7])
  );
  X_IPAD   \CU_instr_func<6>  (
    .PAD(CU_instr_func[6])
  );
  X_IPAD   \CU_instr_func<5>  (
    .PAD(CU_instr_func[5])
  );
  X_IPAD   \CU_instr_func<4>  (
    .PAD(CU_instr_func[4])
  );
  X_IPAD   \CU_instr_func<3>  (
    .PAD(CU_instr_func[3])
  );
  X_IPAD   \CU_instr_func<2>  (
    .PAD(CU_instr_func[2])
  );
  X_IPAD   \CU_instr_func<1>  (
    .PAD(CU_instr_func[1])
  );
  X_IPAD   \CU_instr_func<0>  (
    .PAD(CU_instr_func[0])
  );
  X_IPAD   CU_enable_205 (
    .PAD(CU_enable)
  );
  X_IPAD   CU_reset_206 (
    .PAD(CU_reset)
  );
  X_IPAD   CU_flush_207 (
    .PAD(CU_flush)
  );
  X_IPAD   CU_bubble_208 (
    .PAD(CU_bubble)
  );
  X_OPAD   \CU_CW_DE<1>  (
    .PAD(CU_CW_DE[1])
  );
  X_OPAD   \CU_CW_DE<2>  (
    .PAD(CU_CW_DE[2])
  );
  X_OPAD   \CU_CW_DE<3>  (
    .PAD(CU_CW_DE[3])
  );
  X_OPAD   \CU_CW_DE<4>  (
    .PAD(CU_CW_DE[4])
  );
  X_OPAD   \CU_CW_DE<5>  (
    .PAD(CU_CW_DE[5])
  );
  X_OPAD   \CU_CW_DE<6>  (
    .PAD(CU_CW_DE[6])
  );
  X_OPAD   \CU_CW_DE<7>  (
    .PAD(CU_CW_DE[7])
  );
  X_OPAD   \CU_CW_DE<8>  (
    .PAD(CU_CW_DE[8])
  );
  X_OPAD   \CU_CW_DE<9>  (
    .PAD(CU_CW_DE[9])
  );
  X_OPAD   \CU_CW_EX<8>  (
    .PAD(CU_CW_EX[8])
  );
  X_OPAD   \CU_CW_EX<9>  (
    .PAD(CU_CW_EX[9])
  );
  X_OPAD   \CU_CW_EX<10>  (
    .PAD(CU_CW_EX[10])
  );
  X_OPAD   \CU_CW_EX<11>  (
    .PAD(CU_CW_EX[11])
  );
  X_OPAD   \CU_CW_EX<12>  (
    .PAD(CU_CW_EX[12])
  );
  X_OPAD   \CU_CW_EX<13>  (
    .PAD(CU_CW_EX[13])
  );
  X_OPAD   \CU_CW_EX<14>  (
    .PAD(CU_CW_EX[14])
  );
  X_OPAD   \CU_CW_EX<15>  (
    .PAD(CU_CW_EX[15])
  );
  X_OPAD   \CU_CW_EX<16>  (
    .PAD(CU_CW_EX[16])
  );
  X_OPAD   \CU_CW_EX<17>  (
    .PAD(CU_CW_EX[17])
  );
  X_OPAD   \CU_CW_EX<18>  (
    .PAD(CU_CW_EX[18])
  );
  X_OPAD   \CU_CW_MEM<19>  (
    .PAD(CU_CW_MEM[19])
  );
  X_OPAD   \CU_CW_MEM<20>  (
    .PAD(CU_CW_MEM[20])
  );
  X_OPAD   \CU_CW_MEM<21>  (
    .PAD(CU_CW_MEM[21])
  );
  X_OPAD   \CU_CW_MEM<22>  (
    .PAD(CU_CW_MEM[22])
  );
  X_OPAD   \CU_CW_WB<23>  (
    .PAD(CU_CW_WB[23])
  );
  X_OPAD   \CU_CW_WB<24>  (
    .PAD(CU_CW_WB[24])
  );
  X_OPAD   \CU_CW_WB<25>  (
    .PAD(CU_CW_WB[25])
  );
  X_OPAD   \CU_CW_WB<26>  (
    .PAD(CU_CW_WB[26])
  );
  X_OPAD   CU_error_237 (
    .PAD(CU_error)
  );
  X_CKBUF   \CU_clk_BUFGP/BUFG  (
    .I(\CU_clk_BUFGP/IBUFG_2 ),
    .O(CU_clk_BUFGP)
  );
  X_CKBUF   \CU_clk_BUFGP/IBUFG  (
    .I(CU_clk),
    .O(\CU_clk_BUFGP/IBUFG_2 )
  );
  X_OBUF   CU_CW_DE_1_OBUF (
    .I(\DE_CW/data_out[25] ),
    .O(CU_CW_DE[1])
  );
  X_OBUF   CU_CW_DE_2_OBUF (
    .I(\DE_CW/data_out[24] ),
    .O(CU_CW_DE[2])
  );
  X_OBUF   CU_CW_DE_3_OBUF (
    .I(\DE_CW/data_out[23] ),
    .O(CU_CW_DE[3])
  );
  X_OBUF   CU_CW_DE_4_OBUF (
    .I(\DE_CW/data_out[22] ),
    .O(CU_CW_DE[4])
  );
  X_OBUF   CU_CW_DE_5_OBUF (
    .I(\DE_CW/data_out[21] ),
    .O(CU_CW_DE[5])
  );
  X_OBUF   CU_CW_DE_6_OBUF (
    .I(\DE_CW/data_out[20] ),
    .O(CU_CW_DE[6])
  );
  X_OBUF   CU_CW_DE_7_OBUF (
    .I(\DE_CW/data_out[19] ),
    .O(CU_CW_DE[7])
  );
  X_OBUF   CU_CW_DE_8_OBUF (
    .I(\DE_CW/data_out_18_1_207 ),
    .O(CU_CW_DE[8])
  );
  X_OBUF   CU_CW_DE_9_OBUF (
    .I(\DE_CW/data_out_17_1_208 ),
    .O(CU_CW_DE[9])
  );
  X_OBUF   CU_CW_EX_8_OBUF (
    .I(\EX_CW/data_out[18] ),
    .O(CU_CW_EX[8])
  );
  X_OBUF   CU_CW_EX_9_OBUF (
    .I(\EX_CW/data_out[17] ),
    .O(CU_CW_EX[9])
  );
  X_OBUF   CU_CW_EX_10_OBUF (
    .I(\EX_CW/data_out[16] ),
    .O(CU_CW_EX[10])
  );
  X_OBUF   CU_CW_EX_11_OBUF (
    .I(\EX_CW/data_out[15] ),
    .O(CU_CW_EX[11])
  );
  X_OBUF   CU_CW_EX_12_OBUF (
    .I(\EX_CW/data_out[14] ),
    .O(CU_CW_EX[12])
  );
  X_OBUF   CU_CW_EX_13_OBUF (
    .I(\EX_CW/data_out[13] ),
    .O(CU_CW_EX[13])
  );
  X_OBUF   CU_CW_EX_14_OBUF (
    .I(\EX_CW/data_out[12] ),
    .O(CU_CW_EX[14])
  );
  X_OBUF   CU_CW_EX_15_OBUF (
    .I(\EX_CW/data_out[11] ),
    .O(CU_CW_EX[15])
  );
  X_OBUF   CU_CW_EX_16_OBUF (
    .I(\EX_CW/data_out[10] ),
    .O(CU_CW_EX[16])
  );
  X_OBUF   CU_CW_EX_17_OBUF (
    .I(\EX_CW/data_out[9] ),
    .O(CU_CW_EX[17])
  );
  X_OBUF   CU_CW_EX_18_OBUF (
    .I(\EX_CW/data_out[8] ),
    .O(CU_CW_EX[18])
  );
  X_OBUF   CU_CW_MEM_19_OBUF (
    .I(\MEM_CW/data_out[7] ),
    .O(CU_CW_MEM[19])
  );
  X_OBUF   CU_CW_MEM_20_OBUF (
    .I(\MEM_CW/data_out[3] ),
    .O(CU_CW_MEM[20])
  );
  X_OBUF   CU_CW_MEM_21_OBUF (
    .I(\MEM_CW/data_out[5] ),
    .O(CU_CW_MEM[21])
  );
  X_OBUF   CU_CW_MEM_22_OBUF (
    .I(\MEM_CW/data_out[4] ),
    .O(CU_CW_MEM[22])
  );
  X_OBUF   CU_CW_WB_23_OBUF (
    .I(\WB_CW/data_out [3]),
    .O(CU_CW_WB[23])
  );
  X_OBUF   CU_CW_WB_24_OBUF (
    .I(\WB_CW/data_out [2]),
    .O(CU_CW_WB[24])
  );
  X_OBUF   CU_CW_WB_25_OBUF (
    .I(\WB_CW/data_out [1]),
    .O(CU_CW_WB[25])
  );
  X_OBUF   CU_CW_WB_26_OBUF (
    .I(\WB_CW/data_out [0]),
    .O(CU_CW_WB[26])
  );
  X_OBUF   CU_error_OBUF (
    .I(CU_error_OBUF_105),
    .O(CU_error)
  );
  X_ZERO   NlwBlock_ControlUnit_GND (
    .O(GND)
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

