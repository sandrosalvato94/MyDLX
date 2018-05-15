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
static const char *ng0 = "C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/Execute_Stage/Comparison_Logic.vhd";



static void work_a_1729280472_1181938964_p_0(char *t0)
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
    int t18;
    char *t19;
    unsigned char t20;
    unsigned char t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;

LAB0:    xsi_set_current_line(103, ng0);
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

LAB10:    t6 = (t0 + 1728U);
    t9 = *((char **)t6);
    t10 = xsi_mem_cmp(t9, t1, 3U);
    if (t10 == 1)
        goto LAB4;

LAB11:    t6 = (t0 + 1796U);
    t11 = *((char **)t6);
    t12 = xsi_mem_cmp(t11, t1, 3U);
    if (t12 == 1)
        goto LAB5;

LAB12:    t6 = (t0 + 1864U);
    t13 = *((char **)t6);
    t14 = xsi_mem_cmp(t13, t1, 3U);
    if (t14 == 1)
        goto LAB6;

LAB13:    t6 = (t0 + 1932U);
    t15 = *((char **)t6);
    t16 = xsi_mem_cmp(t15, t1, 3U);
    if (t16 == 1)
        goto LAB7;

LAB14:    t6 = (t0 + 2000U);
    t17 = *((char **)t6);
    t18 = xsi_mem_cmp(t17, t1, 3U);
    if (t18 == 1)
        goto LAB8;

LAB15:
LAB9:    xsi_set_current_line(146, ng0);
    t1 = (t0 + 3092);
    t2 = (t1 + 32U);
    t6 = *((char **)t2);
    t7 = (t6 + 40U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB2:    t1 = (t0 + 3040);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(105, ng0);
    t6 = (t0 + 1052U);
    t19 = *((char **)t6);
    t20 = *((unsigned char *)t19);
    t21 = (t20 == (unsigned char)3);
    if (t21 != 0)
        goto LAB17;

LAB19:    xsi_set_current_line(108, ng0);
    t1 = (t0 + 3092);
    t2 = (t1 + 32U);
    t6 = *((char **)t2);
    t7 = (t6 + 40U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB18:    goto LAB2;

LAB4:    xsi_set_current_line(112, ng0);
    t1 = (t0 + 960U);
    t2 = *((char **)t1);
    t20 = *((unsigned char *)t2);
    t21 = (t20 == (unsigned char)3);
    if (t21 != 0)
        goto LAB20;

LAB22:    xsi_set_current_line(115, ng0);
    t1 = (t0 + 3092);
    t2 = (t1 + 32U);
    t6 = *((char **)t2);
    t7 = (t6 + 40U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB21:    goto LAB2;

LAB5:    xsi_set_current_line(119, ng0);
    t1 = (t0 + 1236U);
    t2 = *((char **)t1);
    t20 = *((unsigned char *)t2);
    t21 = (t20 == (unsigned char)3);
    if (t21 != 0)
        goto LAB23;

LAB25:    xsi_set_current_line(122, ng0);
    t1 = (t0 + 3092);
    t2 = (t1 + 32U);
    t6 = *((char **)t2);
    t7 = (t6 + 40U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB24:    goto LAB2;

LAB6:    xsi_set_current_line(126, ng0);
    t1 = (t0 + 1144U);
    t2 = *((char **)t1);
    t20 = *((unsigned char *)t2);
    t21 = (t20 == (unsigned char)3);
    if (t21 != 0)
        goto LAB26;

LAB28:    xsi_set_current_line(129, ng0);
    t1 = (t0 + 3092);
    t2 = (t1 + 32U);
    t6 = *((char **)t2);
    t7 = (t6 + 40U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB27:    goto LAB2;

LAB7:    xsi_set_current_line(133, ng0);
    t1 = (t0 + 1328U);
    t2 = *((char **)t1);
    t20 = *((unsigned char *)t2);
    t21 = (t20 == (unsigned char)3);
    if (t21 != 0)
        goto LAB29;

LAB31:    xsi_set_current_line(136, ng0);
    t1 = (t0 + 3092);
    t2 = (t1 + 32U);
    t6 = *((char **)t2);
    t7 = (t6 + 40U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB30:    goto LAB2;

LAB8:    xsi_set_current_line(139, ng0);
    t1 = (t0 + 1328U);
    t2 = *((char **)t1);
    t20 = *((unsigned char *)t2);
    t21 = (t20 == (unsigned char)2);
    if (t21 != 0)
        goto LAB32;

LAB34:    xsi_set_current_line(142, ng0);
    t1 = (t0 + 3092);
    t2 = (t1 + 32U);
    t6 = *((char **)t2);
    t7 = (t6 + 40U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB33:    goto LAB2;

LAB16:;
LAB17:    xsi_set_current_line(106, ng0);
    t6 = (t0 + 3092);
    t22 = (t6 + 32U);
    t23 = *((char **)t22);
    t24 = (t23 + 40U);
    t25 = *((char **)t24);
    *((unsigned char *)t25) = (unsigned char)3;
    xsi_driver_first_trans_fast(t6);
    goto LAB18;

LAB20:    xsi_set_current_line(113, ng0);
    t1 = (t0 + 3092);
    t6 = (t1 + 32U);
    t7 = *((char **)t6);
    t9 = (t7 + 40U);
    t11 = *((char **)t9);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB21;

LAB23:    xsi_set_current_line(120, ng0);
    t1 = (t0 + 3092);
    t6 = (t1 + 32U);
    t7 = *((char **)t6);
    t9 = (t7 + 40U);
    t11 = *((char **)t9);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB24;

LAB26:    xsi_set_current_line(127, ng0);
    t1 = (t0 + 3092);
    t6 = (t1 + 32U);
    t7 = *((char **)t6);
    t9 = (t7 + 40U);
    t11 = *((char **)t9);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB27;

LAB29:    xsi_set_current_line(134, ng0);
    t1 = (t0 + 3092);
    t6 = (t1 + 32U);
    t7 = *((char **)t6);
    t9 = (t7 + 40U);
    t11 = *((char **)t9);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB30;

LAB32:    xsi_set_current_line(140, ng0);
    t1 = (t0 + 3092);
    t6 = (t1 + 32U);
    t7 = *((char **)t6);
    t9 = (t7 + 40U);
    t11 = *((char **)t9);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB33;

}

static void work_a_1729280472_1181938964_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(150, ng0);

LAB3:    t1 = xsi_get_transient_memory(7U);
    memset(t1, 0, 7U);
    t2 = t1;
    memset(t2, (unsigned char)2, 7U);
    t3 = (t0 + 3128);
    t4 = (t3 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 7U);
    xsi_driver_first_trans_delta(t3, 0U, 7U, 0LL);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1729280472_1181938964_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(151, ng0);

LAB3:    t1 = (t0 + 1420U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 3164);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_delta(t1, 7U, 1, 0LL);

LAB2:    t8 = (t0 + 3048);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_1729280472_1181938964_init()
{
	static char *pe[] = {(void *)work_a_1729280472_1181938964_p_0,(void *)work_a_1729280472_1181938964_p_1,(void *)work_a_1729280472_1181938964_p_2};
	xsi_register_didat("work_a_1729280472_1181938964", "isim/TB_Execute_Stage_isim_beh.exe.sim/work/a_1729280472_1181938964.didat");
	xsi_register_executes(pe);
}
