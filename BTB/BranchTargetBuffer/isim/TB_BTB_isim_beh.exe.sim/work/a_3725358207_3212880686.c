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
static const char *ng0 = "C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/BTB/BranchTargetBuffer/NPriorityEncoder.vhd";
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_180853171_1035706684(char *, char *, int , int );


static void work_a_3725358207_3212880686_p_0(char *t0)
{
    char t23[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    int t15;
    int t16;
    int t17;
    int t18;
    int t19;
    int t20;
    unsigned int t21;
    unsigned int t22;
    char *t24;

LAB0:    xsi_set_current_line(65, ng0);
    t1 = (t0 + 684U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(68, ng0);
    t1 = (t0 + 592U);
    t2 = *((char **)t1);
    t1 = (t0 + 868U);
    t5 = *((char **)t1);
    t3 = 1;
    if (4U == 4U)
        goto LAB8;

LAB9:    t3 = 0;

LAB10:    if (t3 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(71, ng0);
    t15 = xsi_vhdl_pow(2, 2);
    t16 = (t15 - 1);
    t1 = (t0 + 3981);
    *((int *)t1) = 0;
    t2 = (t0 + 3985);
    *((int *)t2) = t16;
    t17 = 0;
    t18 = t16;

LAB14:    if (t17 <= t18)
        goto LAB15;

LAB17:
LAB6:
LAB3:    t1 = (t0 + 1792);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(66, ng0);
    t1 = xsi_get_transient_memory(2U);
    memset(t1, 0, 2U);
    t5 = t1;
    memset(t5, (unsigned char)2, 2U);
    t6 = (t0 + 1836);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    t9 = (t8 + 40U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 2U);
    xsi_driver_first_trans_fast_port(t6);
    goto LAB3;

LAB5:    xsi_set_current_line(69, ng0);
    t7 = xsi_get_transient_memory(2U);
    memset(t7, 0, 2U);
    t8 = t7;
    memset(t8, (unsigned char)2, 2U);
    t9 = (t0 + 1836);
    t10 = (t9 + 32U);
    t12 = *((char **)t10);
    t13 = (t12 + 40U);
    t14 = *((char **)t13);
    memcpy(t14, t7, 2U);
    xsi_driver_first_trans_fast_port(t9);
    goto LAB6;

LAB8:    t11 = 0;

LAB11:    if (t11 < 4U)
        goto LAB12;
    else
        goto LAB10;

LAB12:    t1 = (t2 + t11);
    t6 = (t5 + t11);
    if (*((unsigned char *)t1) != *((unsigned char *)t6))
        goto LAB9;

LAB13:    t11 = (t11 + 1);
    goto LAB11;

LAB15:    xsi_set_current_line(72, ng0);
    t5 = (t0 + 592U);
    t6 = *((char **)t5);
    t5 = (t0 + 3981);
    t19 = *((int *)t5);
    t20 = (t19 - 3);
    t11 = (t20 * -1);
    xsi_vhdl_check_range_of_index(3, 0, -1, *((int *)t5));
    t21 = (1U * t11);
    t22 = (0 + t21);
    t7 = (t6 + t22);
    t3 = *((unsigned char *)t7);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB18;

LAB20:
LAB19:
LAB16:    t1 = (t0 + 3981);
    t17 = *((int *)t1);
    t2 = (t0 + 3985);
    t18 = *((int *)t2);
    if (t17 == t18)
        goto LAB17;

LAB21:    t15 = (t17 + 1);
    t17 = t15;
    t5 = (t0 + 3981);
    *((int *)t5) = t17;
    goto LAB14;

LAB18:    xsi_set_current_line(73, ng0);
    t8 = (t0 + 3981);
    t9 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t23, *((int *)t8), 2);
    t10 = (t0 + 1836);
    t12 = (t10 + 32U);
    t13 = *((char **)t12);
    t14 = (t13 + 40U);
    t24 = *((char **)t14);
    memcpy(t24, t9, 2U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB19;

}


extern void work_a_3725358207_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3725358207_3212880686_p_0};
	xsi_register_didat("work_a_3725358207_3212880686", "isim/TB_BTB_isim_beh.exe.sim/work/a_3725358207_3212880686.didat");
	xsi_register_executes(pe);
}
