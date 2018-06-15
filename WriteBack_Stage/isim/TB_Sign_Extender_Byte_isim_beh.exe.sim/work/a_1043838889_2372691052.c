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
static const char *ng0 = "C:/Users/Alessandro/Documents/GitHub/MyDLX/WriteBack_Stage/TB_Sign_Extender_Byte.vhd";
extern char *IEEE_P_2592010699;



static void work_a_1043838889_2372691052_p_0(char *t0)
{
    char t8[16];
    char t10[16];
    char t15[16];
    char *t1;
    char *t2;
    int64 t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t11;
    char *t12;
    int t13;
    unsigned int t14;
    char *t16;
    int t17;
    unsigned char t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;

LAB0:    t1 = (t0 + 1504U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(79, ng0);
    t3 = (1 * 1000LL);
    t2 = (t0 + 1404);
    xsi_process_wait(t2, t3);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(82, ng0);
    t2 = (t0 + 3573);
    t5 = (t0 + 3597);
    t9 = ((IEEE_P_2592010699) + 2332);
    t11 = (t10 + 0U);
    t12 = (t11 + 0U);
    *((int *)t12) = 0;
    t12 = (t11 + 4U);
    *((int *)t12) = 23;
    t12 = (t11 + 8U);
    *((int *)t12) = 1;
    t13 = (23 - 0);
    t14 = (t13 * 1);
    t14 = (t14 + 1);
    t12 = (t11 + 12U);
    *((unsigned int *)t12) = t14;
    t12 = (t15 + 0U);
    t16 = (t12 + 0U);
    *((int *)t16) = 0;
    t16 = (t12 + 4U);
    *((int *)t16) = 7;
    t16 = (t12 + 8U);
    *((int *)t16) = 1;
    t17 = (7 - 0);
    t14 = (t17 * 1);
    t14 = (t14 + 1);
    t16 = (t12 + 12U);
    *((unsigned int *)t16) = t14;
    t7 = xsi_base_array_concat(t7, t8, t9, (char)97, t2, t10, (char)97, t5, t15, (char)101);
    t14 = (24U + 8U);
    t18 = (32U != t14);
    if (t18 == 1)
        goto LAB8;

LAB9:    t16 = (t0 + 1736);
    t19 = (t16 + 32U);
    t20 = *((char **)t19);
    t21 = (t20 + 40U);
    t22 = *((char **)t21);
    memcpy(t22, t7, 32U);
    xsi_driver_first_trans_fast(t16);
    xsi_set_current_line(83, ng0);
    t2 = (t0 + 1772);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(84, ng0);
    t3 = (1 * 1000LL);
    t2 = (t0 + 1404);
    xsi_process_wait(t2, t3);

LAB12:    *((char **)t1) = &&LAB13;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_size_not_matching(32U, t14, 0);
    goto LAB9;

LAB10:    xsi_set_current_line(88, ng0);
    t2 = (t0 + 3605);
    t5 = (t0 + 3629);
    t9 = ((IEEE_P_2592010699) + 2332);
    t11 = (t10 + 0U);
    t12 = (t11 + 0U);
    *((int *)t12) = 0;
    t12 = (t11 + 4U);
    *((int *)t12) = 23;
    t12 = (t11 + 8U);
    *((int *)t12) = 1;
    t13 = (23 - 0);
    t14 = (t13 * 1);
    t14 = (t14 + 1);
    t12 = (t11 + 12U);
    *((unsigned int *)t12) = t14;
    t12 = (t15 + 0U);
    t16 = (t12 + 0U);
    *((int *)t16) = 0;
    t16 = (t12 + 4U);
    *((int *)t16) = 7;
    t16 = (t12 + 8U);
    *((int *)t16) = 1;
    t17 = (7 - 0);
    t14 = (t17 * 1);
    t14 = (t14 + 1);
    t16 = (t12 + 12U);
    *((unsigned int *)t16) = t14;
    t7 = xsi_base_array_concat(t7, t8, t9, (char)97, t2, t10, (char)97, t5, t15, (char)101);
    t14 = (24U + 8U);
    t18 = (32U != t14);
    if (t18 == 1)
        goto LAB14;

LAB15:    t16 = (t0 + 1736);
    t19 = (t16 + 32U);
    t20 = *((char **)t19);
    t21 = (t20 + 40U);
    t22 = *((char **)t21);
    memcpy(t22, t7, 32U);
    xsi_driver_first_trans_fast(t16);
    xsi_set_current_line(89, ng0);
    t2 = (t0 + 1772);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(90, ng0);
    t3 = (1 * 1000LL);
    t2 = (t0 + 1404);
    xsi_process_wait(t2, t3);

LAB18:    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB11:    goto LAB10;

LAB13:    goto LAB11;

LAB14:    xsi_size_not_matching(32U, t14, 0);
    goto LAB15;

LAB16:    xsi_set_current_line(94, ng0);
    t2 = (t0 + 3637);
    t5 = (t0 + 3661);
    t9 = ((IEEE_P_2592010699) + 2332);
    t11 = (t10 + 0U);
    t12 = (t11 + 0U);
    *((int *)t12) = 0;
    t12 = (t11 + 4U);
    *((int *)t12) = 23;
    t12 = (t11 + 8U);
    *((int *)t12) = 1;
    t13 = (23 - 0);
    t14 = (t13 * 1);
    t14 = (t14 + 1);
    t12 = (t11 + 12U);
    *((unsigned int *)t12) = t14;
    t12 = (t15 + 0U);
    t16 = (t12 + 0U);
    *((int *)t16) = 0;
    t16 = (t12 + 4U);
    *((int *)t16) = 7;
    t16 = (t12 + 8U);
    *((int *)t16) = 1;
    t17 = (7 - 0);
    t14 = (t17 * 1);
    t14 = (t14 + 1);
    t16 = (t12 + 12U);
    *((unsigned int *)t16) = t14;
    t7 = xsi_base_array_concat(t7, t8, t9, (char)97, t2, t10, (char)97, t5, t15, (char)101);
    t14 = (24U + 8U);
    t18 = (32U != t14);
    if (t18 == 1)
        goto LAB20;

LAB21:    t16 = (t0 + 1736);
    t19 = (t16 + 32U);
    t20 = *((char **)t19);
    t21 = (t20 + 40U);
    t22 = *((char **)t21);
    memcpy(t22, t7, 32U);
    xsi_driver_first_trans_fast(t16);
    xsi_set_current_line(95, ng0);
    t2 = (t0 + 1772);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(96, ng0);
    t3 = (1 * 1000LL);
    t2 = (t0 + 1404);
    xsi_process_wait(t2, t3);

LAB24:    *((char **)t1) = &&LAB25;
    goto LAB1;

LAB17:    goto LAB16;

LAB19:    goto LAB17;

LAB20:    xsi_size_not_matching(32U, t14, 0);
    goto LAB21;

LAB22:    xsi_set_current_line(100, ng0);
    t2 = (t0 + 3669);
    t5 = (t0 + 3693);
    t9 = ((IEEE_P_2592010699) + 2332);
    t11 = (t10 + 0U);
    t12 = (t11 + 0U);
    *((int *)t12) = 0;
    t12 = (t11 + 4U);
    *((int *)t12) = 23;
    t12 = (t11 + 8U);
    *((int *)t12) = 1;
    t13 = (23 - 0);
    t14 = (t13 * 1);
    t14 = (t14 + 1);
    t12 = (t11 + 12U);
    *((unsigned int *)t12) = t14;
    t12 = (t15 + 0U);
    t16 = (t12 + 0U);
    *((int *)t16) = 0;
    t16 = (t12 + 4U);
    *((int *)t16) = 7;
    t16 = (t12 + 8U);
    *((int *)t16) = 1;
    t17 = (7 - 0);
    t14 = (t17 * 1);
    t14 = (t14 + 1);
    t16 = (t12 + 12U);
    *((unsigned int *)t16) = t14;
    t7 = xsi_base_array_concat(t7, t8, t9, (char)97, t2, t10, (char)97, t5, t15, (char)101);
    t14 = (24U + 8U);
    t18 = (32U != t14);
    if (t18 == 1)
        goto LAB26;

LAB27:    t16 = (t0 + 1736);
    t19 = (t16 + 32U);
    t20 = *((char **)t19);
    t21 = (t20 + 40U);
    t22 = *((char **)t21);
    memcpy(t22, t7, 32U);
    xsi_driver_first_trans_fast(t16);
    xsi_set_current_line(101, ng0);
    t2 = (t0 + 1772);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(102, ng0);
    t3 = (1 * 1000LL);
    t2 = (t0 + 1404);
    xsi_process_wait(t2, t3);

LAB30:    *((char **)t1) = &&LAB31;
    goto LAB1;

LAB23:    goto LAB22;

LAB25:    goto LAB23;

LAB26:    xsi_size_not_matching(32U, t14, 0);
    goto LAB27;

LAB28:    xsi_set_current_line(106, ng0);

LAB34:    *((char **)t1) = &&LAB35;
    goto LAB1;

LAB29:    goto LAB28;

LAB31:    goto LAB29;

LAB32:    goto LAB2;

LAB33:    goto LAB32;

LAB35:    goto LAB33;

}


extern void work_a_1043838889_2372691052_init()
{
	static char *pe[] = {(void *)work_a_1043838889_2372691052_p_0};
	xsi_register_didat("work_a_1043838889_2372691052", "isim/TB_Sign_Extender_Byte_isim_beh.exe.sim/work/a_1043838889_2372691052.didat");
	xsi_register_executes(pe);
}
