/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x8ef4fb42 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Alessandro/Documents/GitHub/MyDLX/WriteBack_Stage/Sign_Extender_Byte.vhd";



static void work_a_2423635249_1181938964_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(62, ng0);

LAB3:    t1 = (t0 + 3952U);
    t2 = *((char **)t1);
    t3 = (31 - 7);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 6736);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    t9 = (t8 + 40U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 8U);
    xsi_driver_first_trans_delta(t6, 24U, 8U, 0LL);

LAB2:    t11 = (t0 + 6692);
    *((int *)t11) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_2423635249_1181938964_init()
{
	static char *pe[] = {(void *)work_a_2423635249_1181938964_p_0};
	xsi_register_didat("work_a_2423635249_1181938964", "isim/TB_Sign_Extender_Byte_isim_beh.exe.sim/work/a_2423635249_1181938964.didat");
	xsi_register_executes(pe);
}
