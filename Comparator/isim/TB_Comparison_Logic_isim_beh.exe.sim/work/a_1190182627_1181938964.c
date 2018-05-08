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
static const char *ng0 = "C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/Comparator/Comparison_Logic.vhd";



static void work_a_1190182627_1181938964_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    int t10;
    char *t11;
    int t12;
    char *t13;
    int t14;
    char *t15;
    int t16;
    char *t17;
    unsigned char t18;
    unsigned char t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;

LAB0:    xsi_set_current_line(101, ng0);
    t1 = (t0 + 776U);
    t2 = *((char **)t1);
    t3 = (3 - 2);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 1660U);
    t7 = *((char **)t6);
    t8 = xsi_mem_cmp(t7, t1, 3U);
    if (t8 == 1)
        goto LAB3;

LAB9:    t6 = (t0 + 1728U);
    t9 = *((char **)t6);
    t10 = xsi_mem_cmp(t9, t1, 3U);
    if (t10 == 1)
        goto LAB4;

LAB10:    t6 = (t0 + 1796U);
    t11 = *((char **)t6);
    t12 = xsi_mem_cmp(t11, t1, 3U);
    if (t12 == 1)
        goto LAB5;

LAB11:    t6 = (t0 + 1864U);
    t13 = *((char **)t6);
    t14 = xsi_mem_cmp(t13, t1, 3U);
    if (t14 == 1)
        goto LAB6;

LAB12:    t6 = (t0 + 1932U);
    t15 = *((char **)t6);
    t16 = xsi_mem_cmp(t15, t1, 3U);
    if (t16 == 1)
        goto LAB7;

LAB13:
LAB8:    xsi_set_current_line(138, ng0);
    t1 = (t0 + 3024);
    t2 = (t1 + 32U);
    t6 = *((char **)t2);
    t7 = (t6 + 40U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB2:    t1 = (t0 + 2972);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(103, ng0);
    t6 = (t0 + 1052U);
    t17 = *((char **)t6);
    t18 = *((unsigned char *)t17);
    t19 = (t18 == (unsigned char)3);
    if (t19 != 0)
        goto LAB15;

LAB17:    xsi_set_current_line(106, ng0);
    t1 = (t0 + 3024);
    t2 = (t1 + 32U);
    t6 = *((char **)t2);
    t7 = (t6 + 40U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB16:    goto LAB2;

LAB4:    xsi_set_current_line(110, ng0);
    t1 = (t0 + 960U);
    t2 = *((char **)t1);
    t18 = *((unsigned char *)t2);
    t19 = (t18 == (unsigned char)3);
    if (t19 != 0)
        goto LAB18;

LAB20:    xsi_set_current_line(113, ng0);
    t1 = (t0 + 3024);
    t2 = (t1 + 32U);
    t6 = *((char **)t2);
    t7 = (t6 + 40U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB19:    goto LAB2;

LAB5:    xsi_set_current_line(117, ng0);
    t1 = (t0 + 1236U);
    t2 = *((char **)t1);
    t18 = *((unsigned char *)t2);
    t19 = (t18 == (unsigned char)3);
    if (t19 != 0)
        goto LAB21;

LAB23:    xsi_set_current_line(120, ng0);
    t1 = (t0 + 3024);
    t2 = (t1 + 32U);
    t6 = *((char **)t2);
    t7 = (t6 + 40U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB22:    goto LAB2;

LAB6:    xsi_set_current_line(124, ng0);
    t1 = (t0 + 1144U);
    t2 = *((char **)t1);
    t18 = *((unsigned char *)t2);
    t19 = (t18 == (unsigned char)3);
    if (t19 != 0)
        goto LAB24;

LAB26:    xsi_set_current_line(127, ng0);
    t1 = (t0 + 3024);
    t2 = (t1 + 32U);
    t6 = *((char **)t2);
    t7 = (t6 + 40U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB25:    goto LAB2;

LAB7:    xsi_set_current_line(131, ng0);
    t1 = (t0 + 1328U);
    t2 = *((char **)t1);
    t18 = *((unsigned char *)t2);
    t19 = (t18 == (unsigned char)3);
    if (t19 != 0)
        goto LAB27;

LAB29:    xsi_set_current_line(134, ng0);
    t1 = (t0 + 3024);
    t2 = (t1 + 32U);
    t6 = *((char **)t2);
    t7 = (t6 + 40U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB28:    goto LAB2;

LAB14:;
LAB15:    xsi_set_current_line(104, ng0);
    t6 = (t0 + 3024);
    t20 = (t6 + 32U);
    t21 = *((char **)t20);
    t22 = (t21 + 40U);
    t23 = *((char **)t22);
    *((unsigned char *)t23) = (unsigned char)3;
    xsi_driver_first_trans_fast(t6);
    goto LAB16;

LAB18:    xsi_set_current_line(111, ng0);
    t1 = (t0 + 3024);
    t6 = (t1 + 32U);
    t7 = *((char **)t6);
    t9 = (t7 + 40U);
    t11 = *((char **)t9);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB19;

LAB21:    xsi_set_current_line(118, ng0);
    t1 = (t0 + 3024);
    t6 = (t1 + 32U);
    t7 = *((char **)t6);
    t9 = (t7 + 40U);
    t11 = *((char **)t9);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB22;

LAB24:    xsi_set_current_line(125, ng0);
    t1 = (t0 + 3024);
    t6 = (t1 + 32U);
    t7 = *((char **)t6);
    t9 = (t7 + 40U);
    t11 = *((char **)t9);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB25;

LAB27:    xsi_set_current_line(132, ng0);
    t1 = (t0 + 3024);
    t6 = (t1 + 32U);
    t7 = *((char **)t6);
    t9 = (t7 + 40U);
    t11 = *((char **)t9);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB28;

}

static void work_a_1190182627_1181938964_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(142, ng0);

LAB3:    t1 = xsi_get_transient_memory(31U);
    memset(t1, 0, 31U);
    t2 = t1;
    memset(t2, (unsigned char)2, 31U);
    t3 = (t0 + 3060);
    t4 = (t3 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 31U);
    xsi_driver_first_trans_delta(t3, 0U, 31U, 0LL);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1190182627_1181938964_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(143, ng0);

LAB3:    t1 = (t0 + 1420U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 3096);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_delta(t1, 31U, 1, 0LL);

LAB2:    t8 = (t0 + 2980);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_1190182627_1181938964_init()
{
	static char *pe[] = {(void *)work_a_1190182627_1181938964_p_0,(void *)work_a_1190182627_1181938964_p_1,(void *)work_a_1190182627_1181938964_p_2};
	xsi_register_didat("work_a_1190182627_1181938964", "isim/TB_Comparison_Logic_isim_beh.exe.sim/work/a_1190182627_1181938964.didat");
	xsi_register_executes(pe);
}
