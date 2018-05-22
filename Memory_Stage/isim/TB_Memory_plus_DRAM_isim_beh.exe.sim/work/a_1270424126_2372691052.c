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
static const char *ng0 = "C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/Memory_Stage/TB_Memory_plus_DRAM.vhd";
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_180853171_1035706684(char *, char *, int , int );


static void work_a_1270424126_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 2192U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(99, ng0);
    t2 = (t0 + 2568);
    t3 = (t2 + 32U);
    t4 = *((char **)t3);
    t5 = (t4 + 40U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(100, ng0);
    t2 = (t0 + 1636U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 2092);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(101, ng0);
    t2 = (t0 + 2568);
    t3 = (t2 + 32U);
    t4 = *((char **)t3);
    t5 = (t4 + 40U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(102, ng0);
    t2 = (t0 + 1636U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 2092);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_1270424126_2372691052_p_1(char *t0)
{
    char t4[16];
    char *t1;
    char *t2;
    int64 t3;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    int t12;
    int t13;
    int t14;
    int t15;
    int t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    t1 = (t0 + 2336U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(110, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 2236);
    xsi_process_wait(t2, t3);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(112, ng0);
    t2 = (t0 + 1500U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t4, 3, t6);
    t7 = (t0 + 2604);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 32U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(113, ng0);
    t2 = (t0 + 1568U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t4, 4, t6);
    t7 = (t0 + 2640);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 10U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(114, ng0);
    t2 = (t0 + 2676);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(115, ng0);
    t2 = (t0 + 2712);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(116, ng0);
    t2 = (t0 + 2748);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(117, ng0);
    t2 = (t0 + 1636U);
    t5 = *((char **)t2);
    t3 = *((int64 *)t5);
    t2 = (t0 + 2236);
    xsi_process_wait(t2, t3);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(119, ng0);
    t2 = (t0 + 1568U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t12 = xsi_vhdl_pow(2, t6);
    t13 = (t12 - 1);
    t2 = (t0 + 6568);
    *((int *)t2) = 0;
    t7 = (t0 + 6572);
    *((int *)t7) = t13;
    t14 = 0;
    t15 = t13;

LAB12:    if (t14 <= t15)
        goto LAB13;

LAB15:    xsi_set_current_line(128, ng0);
    t2 = (t0 + 1568U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t12 = xsi_vhdl_pow(2, t6);
    t13 = (t12 - 1);
    t2 = (t0 + 6576);
    *((int *)t2) = t13;
    t7 = (t0 + 6580);
    *((int *)t7) = 0;
    t14 = t13;
    t15 = 0;

LAB21:    if (t14 >= t15)
        goto LAB22;

LAB24:    xsi_set_current_line(142, ng0);

LAB32:    *((char **)t1) = &&LAB33;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB13:    xsi_set_current_line(120, ng0);
    t8 = (t0 + 6568);
    t9 = (t0 + 1500U);
    t10 = *((char **)t9);
    t16 = *((int *)t10);
    t9 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t4, *((int *)t8), t16);
    t11 = (t0 + 2604);
    t17 = (t11 + 32U);
    t18 = *((char **)t17);
    t19 = (t18 + 40U);
    t20 = *((char **)t19);
    memcpy(t20, t9, 32U);
    xsi_driver_first_trans_fast(t11);
    xsi_set_current_line(121, ng0);
    t2 = (t0 + 6568);
    t5 = (t0 + 1568U);
    t7 = *((char **)t5);
    t6 = *((int *)t7);
    t12 = (t6 - 2);
    t5 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t4, *((int *)t2), t12);
    t8 = (t0 + 2640);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t17 = *((char **)t11);
    memcpy(t17, t5, 8U);
    xsi_driver_first_trans_delta(t8, 0U, 8U, 0LL);
    xsi_set_current_line(122, ng0);
    t2 = (t0 + 2676);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(123, ng0);
    t2 = (t0 + 2712);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(124, ng0);
    t2 = (t0 + 2748);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(125, ng0);
    t2 = (t0 + 1636U);
    t5 = *((char **)t2);
    t3 = *((int64 *)t5);
    t2 = (t0 + 2236);
    xsi_process_wait(t2, t3);

LAB18:    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB14:    t2 = (t0 + 6568);
    t14 = *((int *)t2);
    t5 = (t0 + 6572);
    t15 = *((int *)t5);
    if (t14 == t15)
        goto LAB15;

LAB20:    t6 = (t14 + 1);
    t14 = t6;
    t7 = (t0 + 6568);
    *((int *)t7) = t14;
    goto LAB12;

LAB16:    goto LAB14;

LAB17:    goto LAB16;

LAB19:    goto LAB17;

LAB22:    xsi_set_current_line(129, ng0);
    t8 = (t0 + 6576);
    t9 = (t0 + 1500U);
    t10 = *((char **)t9);
    t16 = *((int *)t10);
    t9 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t4, *((int *)t8), t16);
    t11 = (t0 + 2604);
    t17 = (t11 + 32U);
    t18 = *((char **)t17);
    t19 = (t18 + 40U);
    t20 = *((char **)t19);
    memcpy(t20, t9, 32U);
    xsi_driver_first_trans_fast(t11);
    xsi_set_current_line(130, ng0);
    t2 = (t0 + 6576);
    t5 = (t0 + 1568U);
    t7 = *((char **)t5);
    t6 = *((int *)t7);
    t12 = (t6 - 2);
    t5 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t4, *((int *)t2), t12);
    t8 = (t0 + 2640);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t17 = *((char **)t11);
    memcpy(t17, t5, 8U);
    xsi_driver_first_trans_delta(t8, 0U, 8U, 0LL);
    xsi_set_current_line(131, ng0);
    t2 = (t0 + 2676);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(132, ng0);
    t2 = (t0 + 2712);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(133, ng0);
    t2 = (t0 + 2748);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(134, ng0);
    t2 = (t0 + 1636U);
    t5 = *((char **)t2);
    t3 = *((int64 *)t5);
    t2 = (t0 + 2236);
    xsi_process_wait(t2, t3);

LAB27:    *((char **)t1) = &&LAB28;
    goto LAB1;

LAB23:    t2 = (t0 + 6576);
    t14 = *((int *)t2);
    t5 = (t0 + 6580);
    t15 = *((int *)t5);
    if (t14 == t15)
        goto LAB24;

LAB29:    t6 = (t14 + -1);
    t14 = t6;
    t7 = (t0 + 6576);
    *((int *)t7) = t14;
    goto LAB21;

LAB25:    goto LAB23;

LAB26:    goto LAB25;

LAB28:    goto LAB26;

LAB30:    goto LAB2;

LAB31:    goto LAB30;

LAB33:    goto LAB31;

}


extern void work_a_1270424126_2372691052_init()
{
	static char *pe[] = {(void *)work_a_1270424126_2372691052_p_0,(void *)work_a_1270424126_2372691052_p_1};
	xsi_register_didat("work_a_1270424126_2372691052", "isim/TB_Memory_plus_DRAM_isim_beh.exe.sim/work/a_1270424126_2372691052.didat");
	xsi_register_executes(pe);
}
