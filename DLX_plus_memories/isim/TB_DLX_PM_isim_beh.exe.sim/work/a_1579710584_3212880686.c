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
static const char *ng0 = "C:/Users/Alessandro/Documents/GitHub/MyDLX/DLX_plus_memories/DRAM.vhd";
extern char *IEEE_P_1242562249;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);


static void work_a_1579710584_3212880686_p_0(char *t0)
{
    char t20[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned char t8;
    unsigned char t9;
    unsigned char t10;
    unsigned char t11;
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    unsigned char t15;
    int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t21;
    int t22;
    unsigned int t23;
    int t24;
    int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;

LAB0:    xsi_set_current_line(57, ng0);
    t1 = xsi_get_transient_memory(32U);
    memset(t1, 0, 32U);
    t2 = t1;
    memset(t2, (unsigned char)2, 32U);
    t3 = (t0 + 2332);
    t4 = (t3 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 32U);
    xsi_driver_first_trans_fast_port(t3);
    xsi_set_current_line(58, ng0);
    t1 = (t0 + 592U);
    t2 = *((char **)t1);
    t10 = *((unsigned char *)t2);
    t11 = (t10 == (unsigned char)3);
    if (t11 == 1)
        goto LAB8;

LAB9:    t9 = (unsigned char)0;

LAB10:    if (t9 == 1)
        goto LAB5;

LAB6:    t8 = (unsigned char)0;

LAB7:    if (t8 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 2280);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(59, ng0);
    t1 = (t0 + 1144U);
    t5 = *((char **)t1);
    t1 = (t0 + 684U);
    t6 = *((char **)t1);
    t16 = (10 - 1);
    t17 = (9 - t16);
    t18 = (t17 * 1U);
    t19 = (0 + t18);
    t1 = (t6 + t19);
    t7 = (t20 + 0U);
    t21 = (t7 + 0U);
    *((int *)t21) = 9;
    t21 = (t7 + 4U);
    *((int *)t21) = 2;
    t21 = (t7 + 8U);
    *((int *)t21) = -1;
    t22 = (2 - 9);
    t23 = (t22 * -1);
    t23 = (t23 + 1);
    t21 = (t7 + 12U);
    *((unsigned int *)t21) = t23;
    t24 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t1, t20);
    t25 = (t24 - 0);
    t23 = (t25 * 1);
    xsi_vhdl_check_range_of_index(0, 1023, 1, t24);
    t26 = (32U * t23);
    t27 = (0 + t26);
    t21 = (t5 + t27);
    t28 = (t0 + 2332);
    t29 = (t28 + 32U);
    t30 = *((char **)t29);
    t31 = (t30 + 40U);
    t32 = *((char **)t31);
    memcpy(t32, t21, 32U);
    xsi_driver_first_trans_fast_port(t28);
    goto LAB3;

LAB5:    t1 = (t0 + 868U);
    t4 = *((char **)t1);
    t14 = *((unsigned char *)t4);
    t15 = (t14 == (unsigned char)3);
    t8 = t15;
    goto LAB7;

LAB8:    t1 = (t0 + 776U);
    t3 = *((char **)t1);
    t12 = *((unsigned char *)t3);
    t13 = (t12 == (unsigned char)3);
    t9 = t13;
    goto LAB10;

}

static void work_a_1579710584_3212880686_p_1(char *t0)
{
    char t24[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    int t6;
    int t7;
    int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    unsigned char t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    unsigned char t19;
    unsigned char t20;
    unsigned char t21;
    unsigned char t22;
    unsigned char t23;
    unsigned int t25;
    int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    char *t30;
    char *t31;

LAB0:    xsi_set_current_line(65, ng0);
    t1 = (t0 + 592U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 592U);
    t2 = *((char **)t1);
    t12 = *((unsigned char *)t2);
    t19 = (t12 == (unsigned char)3);
    if (t19 == 1)
        goto LAB12;

LAB13:    t4 = (unsigned char)0;

LAB14:    if (t4 == 1)
        goto LAB9;

LAB10:    t3 = (unsigned char)0;

LAB11:    if (t3 != 0)
        goto LAB7;

LAB8:
LAB3:    t1 = (t0 + 2288);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(66, ng0);
    t1 = xsi_get_transient_memory(32768U);
    memset(t1, 0, 32768U);
    t5 = t1;
    t6 = xsi_vhdl_pow(2, 10);
    t7 = (t6 - 1);
    t8 = (t7 - 0);
    t9 = (t8 * 1);
    t9 = (t9 + 1);
    t10 = (t9 * 1U);
    t11 = t5;
    memset(t11, (unsigned char)2, t10);
    t12 = (t10 != 0);
    if (t12 == 1)
        goto LAB5;

LAB6:    t14 = (t0 + 2368);
    t15 = (t14 + 32U);
    t16 = *((char **)t15);
    t17 = (t16 + 40U);
    t18 = *((char **)t17);
    memcpy(t18, t1, 32768U);
    xsi_driver_first_trans_delta(t14, 0U, 32768U, 0LL);
    goto LAB3;

LAB5:    t13 = (32768U / t10);
    xsi_mem_set_data(t5, t5, t10, t13);
    goto LAB6;

LAB7:    xsi_set_current_line(68, ng0);
    t1 = (t0 + 960U);
    t14 = *((char **)t1);
    t1 = (t0 + 684U);
    t15 = *((char **)t1);
    t6 = (10 - 1);
    t9 = (9 - t6);
    t10 = (t9 * 1U);
    t13 = (0 + t10);
    t1 = (t15 + t13);
    t16 = (t24 + 0U);
    t17 = (t16 + 0U);
    *((int *)t17) = 9;
    t17 = (t16 + 4U);
    *((int *)t17) = 2;
    t17 = (t16 + 8U);
    *((int *)t17) = -1;
    t7 = (2 - 9);
    t25 = (t7 * -1);
    t25 = (t25 + 1);
    t17 = (t16 + 12U);
    *((unsigned int *)t17) = t25;
    t8 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t1, t24);
    t26 = (t8 - 0);
    t25 = (t26 * 1);
    t27 = (32U * t25);
    t28 = (0U + t27);
    t17 = (t0 + 2368);
    t18 = (t17 + 32U);
    t29 = *((char **)t18);
    t30 = (t29 + 40U);
    t31 = *((char **)t30);
    memcpy(t31, t14, 32U);
    xsi_driver_first_trans_delta(t17, t28, 32U, 0LL);
    goto LAB3;

LAB9:    t1 = (t0 + 868U);
    t11 = *((char **)t1);
    t22 = *((unsigned char *)t11);
    t23 = (t22 == (unsigned char)2);
    t3 = t23;
    goto LAB11;

LAB12:    t1 = (t0 + 776U);
    t5 = *((char **)t1);
    t20 = *((unsigned char *)t5);
    t21 = (t20 == (unsigned char)3);
    t4 = t21;
    goto LAB14;

}


extern void work_a_1579710584_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1579710584_3212880686_p_0,(void *)work_a_1579710584_3212880686_p_1};
	xsi_register_didat("work_a_1579710584_3212880686", "isim/TB_DLX_PM_isim_beh.exe.sim/work/a_1579710584_3212880686.didat");
	xsi_register_executes(pe);
}
