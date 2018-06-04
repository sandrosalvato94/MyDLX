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
static const char *ng0 = "C:/Users/Alessandro/Documents/GitHub/MyDLX/Forwarding_ControlUnit/TB_Comparator5Bit.vhd";



static void work_a_2198602355_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    int64 t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned char t10;
    unsigned char t11;

LAB0:    t1 = (t0 + 1436U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(76, ng0);
    t3 = (1 * 1000LL);
    t2 = (t0 + 1336);
    xsi_process_wait(t2, t3);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(79, ng0);
    t2 = (t0 + 3355);
    t5 = (t0 + 1668);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 5U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(80, ng0);
    t2 = (t0 + 3360);
    t5 = (t0 + 1704);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 5U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(81, ng0);
    t3 = (1 * 1000LL);
    t2 = (t0 + 1336);
    xsi_process_wait(t2, t3);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(82, ng0);
    t2 = (t0 + 776U);
    t4 = *((char **)t2);
    t10 = *((unsigned char *)t4);
    t11 = (t10 == (unsigned char)3);
    if (t11 == 0)
        goto LAB12;

LAB13:    xsi_set_current_line(83, ng0);
    t3 = (5 * 1000LL);
    t2 = (t0 + 1336);
    xsi_process_wait(t2, t3);

LAB16:    *((char **)t1) = &&LAB17;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB12:    t2 = (t0 + 3365);
    xsi_report(t2, 26U, 2);
    goto LAB13;

LAB14:    xsi_set_current_line(85, ng0);
    t2 = (t0 + 3391);
    t5 = (t0 + 1668);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 5U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(86, ng0);
    t2 = (t0 + 3396);
    t5 = (t0 + 1704);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 5U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(87, ng0);
    t3 = (1 * 1000LL);
    t2 = (t0 + 1336);
    xsi_process_wait(t2, t3);

LAB20:    *((char **)t1) = &&LAB21;
    goto LAB1;

LAB15:    goto LAB14;

LAB17:    goto LAB15;

LAB18:    xsi_set_current_line(88, ng0);
    t2 = (t0 + 776U);
    t4 = *((char **)t2);
    t10 = *((unsigned char *)t4);
    t11 = (t10 == (unsigned char)3);
    if (t11 == 0)
        goto LAB22;

LAB23:    xsi_set_current_line(89, ng0);
    t3 = (5 * 1000LL);
    t2 = (t0 + 1336);
    xsi_process_wait(t2, t3);

LAB26:    *((char **)t1) = &&LAB27;
    goto LAB1;

LAB19:    goto LAB18;

LAB21:    goto LAB19;

LAB22:    t2 = (t0 + 3401);
    xsi_report(t2, 26U, 2);
    goto LAB23;

LAB24:    xsi_set_current_line(93, ng0);
    t2 = (t0 + 3427);
    t5 = (t0 + 1668);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 5U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(94, ng0);
    t2 = (t0 + 3432);
    t5 = (t0 + 1704);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 5U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(95, ng0);
    t3 = (1 * 1000LL);
    t2 = (t0 + 1336);
    xsi_process_wait(t2, t3);

LAB30:    *((char **)t1) = &&LAB31;
    goto LAB1;

LAB25:    goto LAB24;

LAB27:    goto LAB25;

LAB28:    xsi_set_current_line(96, ng0);
    t2 = (t0 + 776U);
    t4 = *((char **)t2);
    t10 = *((unsigned char *)t4);
    t11 = (t10 == (unsigned char)2);
    if (t11 == 0)
        goto LAB32;

LAB33:    xsi_set_current_line(97, ng0);
    t3 = (5 * 1000LL);
    t2 = (t0 + 1336);
    xsi_process_wait(t2, t3);

LAB36:    *((char **)t1) = &&LAB37;
    goto LAB1;

LAB29:    goto LAB28;

LAB31:    goto LAB29;

LAB32:    t2 = (t0 + 3437);
    xsi_report(t2, 29U, 2);
    goto LAB33;

LAB34:    xsi_set_current_line(99, ng0);
    t2 = (t0 + 3466);
    t5 = (t0 + 1668);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 5U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(100, ng0);
    t2 = (t0 + 3471);
    t5 = (t0 + 1704);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 5U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(101, ng0);
    t3 = (1 * 1000LL);
    t2 = (t0 + 1336);
    xsi_process_wait(t2, t3);

LAB40:    *((char **)t1) = &&LAB41;
    goto LAB1;

LAB35:    goto LAB34;

LAB37:    goto LAB35;

LAB38:    xsi_set_current_line(102, ng0);
    t2 = (t0 + 776U);
    t4 = *((char **)t2);
    t10 = *((unsigned char *)t4);
    t11 = (t10 == (unsigned char)2);
    if (t11 == 0)
        goto LAB42;

LAB43:    xsi_set_current_line(103, ng0);
    t3 = (5 * 1000LL);
    t2 = (t0 + 1336);
    xsi_process_wait(t2, t3);

LAB46:    *((char **)t1) = &&LAB47;
    goto LAB1;

LAB39:    goto LAB38;

LAB41:    goto LAB39;

LAB42:    t2 = (t0 + 3476);
    xsi_report(t2, 29U, 2);
    goto LAB43;

LAB44:    xsi_set_current_line(109, ng0);

LAB50:    *((char **)t1) = &&LAB51;
    goto LAB1;

LAB45:    goto LAB44;

LAB47:    goto LAB45;

LAB48:    goto LAB2;

LAB49:    goto LAB48;

LAB51:    goto LAB49;

}


extern void work_a_2198602355_2372691052_init()
{
	static char *pe[] = {(void *)work_a_2198602355_2372691052_p_0};
	xsi_register_didat("work_a_2198602355_2372691052", "isim/TB_Comparator5Bit_isim_beh.exe.sim/work/a_2198602355_2372691052.didat");
	xsi_register_executes(pe);
}
