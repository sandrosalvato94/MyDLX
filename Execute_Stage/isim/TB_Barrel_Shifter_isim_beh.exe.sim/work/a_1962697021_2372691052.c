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
static const char *ng0 = "C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/Execute_Stage/TB_Barrel_Shifter.vhd";
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_180853171_1035706684(char *, char *, int , int );


static void work_a_1962697021_2372691052_p_0(char *t0)
{
    char t4[16];
    char *t1;
    char *t2;
    int64 t3;
    char *t5;
    int t6;
    int t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    int t13;
    int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    char *t18;

LAB0:    t1 = (t0 + 1596U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(94, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1496);
    xsi_process_wait(t2, t3);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(98, ng0);
    t2 = (t0 + 1040U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t7 = xsi_vhdl_pow(2, t6);
    t2 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t4, 3, t7);
    t8 = (t0 + 1828);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t12 = *((char **)t11);
    memcpy(t12, t2, 8U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(99, ng0);
    t2 = (t0 + 4417);
    t8 = (t0 + 1864);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t12 = *((char **)t11);
    memcpy(t12, t2, 2U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(100, ng0);
    t2 = (t0 + 1040U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t4, 7, t6);
    t8 = (t0 + 1900);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t12 = *((char **)t11);
    memcpy(t12, t2, 3U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(102, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1496);
    xsi_process_wait(t2, t3);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(106, ng0);
    t2 = (t0 + 1040U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t7 = xsi_vhdl_pow(2, t6);
    t2 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t4, 27, t7);
    t8 = (t0 + 1828);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t12 = *((char **)t11);
    memcpy(t12, t2, 8U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(107, ng0);
    t2 = (t0 + 4419);
    t8 = (t0 + 1864);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t12 = *((char **)t11);
    memcpy(t12, t2, 2U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(108, ng0);
    t2 = (t0 + 1040U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t4, 1, t6);
    t8 = (t0 + 1900);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t12 = *((char **)t11);
    memcpy(t12, t2, 3U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(110, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1496);
    xsi_process_wait(t2, t3);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB12:    xsi_set_current_line(114, ng0);
    t2 = (t0 + 1040U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t7 = xsi_vhdl_pow(2, t6);
    t2 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t4, 1, t7);
    t8 = (t0 + 1828);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t12 = *((char **)t11);
    memcpy(t12, t2, 8U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(115, ng0);
    t2 = (t0 + 4421);
    t8 = (t0 + 1864);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t12 = *((char **)t11);
    memcpy(t12, t2, 2U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(116, ng0);
    t2 = xsi_get_transient_memory(3U);
    memset(t2, 0, 3U);
    t5 = t2;
    memset(t5, (unsigned char)3, 3U);
    t8 = (t0 + 1900);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t12 = *((char **)t11);
    memcpy(t12, t2, 3U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(118, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1496);
    xsi_process_wait(t2, t3);

LAB18:    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

LAB16:    xsi_set_current_line(122, ng0);
    t2 = xsi_get_transient_memory(8U);
    memset(t2, 0, 8U);
    t5 = t2;
    memset(t5, (unsigned char)2, 8U);
    t8 = (t0 + 1040U);
    t9 = *((char **)t8);
    t6 = *((int *)t9);
    t7 = xsi_vhdl_pow(2, t6);
    t13 = (t7 - 1);
    t14 = (t13 - 7);
    t15 = (t14 * -1);
    t16 = (1U * t15);
    t8 = (t5 + t16);
    *((unsigned char *)t8) = (unsigned char)3;
    t10 = (t0 + 1828);
    t11 = (t10 + 32U);
    t12 = *((char **)t11);
    t17 = (t12 + 40U);
    t18 = *((char **)t17);
    memcpy(t18, t2, 8U);
    xsi_driver_first_trans_fast(t10);
    xsi_set_current_line(123, ng0);
    t2 = (t0 + 4423);
    t8 = (t0 + 1864);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t12 = *((char **)t11);
    memcpy(t12, t2, 2U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(124, ng0);
    t2 = (t0 + 1040U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t4, 1, t6);
    t8 = (t0 + 1900);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t12 = *((char **)t11);
    memcpy(t12, t2, 3U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(126, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1496);
    xsi_process_wait(t2, t3);

LAB22:    *((char **)t1) = &&LAB23;
    goto LAB1;

LAB17:    goto LAB16;

LAB19:    goto LAB17;

LAB20:    xsi_set_current_line(130, ng0);
    t2 = xsi_get_transient_memory(8U);
    memset(t2, 0, 8U);
    t5 = t2;
    memset(t5, (unsigned char)2, 8U);
    t8 = (t0 + 1040U);
    t9 = *((char **)t8);
    t6 = *((int *)t9);
    t7 = xsi_vhdl_pow(2, t6);
    t13 = (t7 - 1);
    t14 = (t13 - 7);
    t15 = (t14 * -1);
    t16 = (1U * t15);
    t8 = (t5 + t16);
    *((unsigned char *)t8) = (unsigned char)3;
    t10 = (t0 + 1828);
    t11 = (t10 + 32U);
    t12 = *((char **)t11);
    t17 = (t12 + 40U);
    t18 = *((char **)t17);
    memcpy(t18, t2, 8U);
    xsi_driver_first_trans_fast(t10);
    xsi_set_current_line(131, ng0);
    t2 = (t0 + 4425);
    t8 = (t0 + 1864);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t12 = *((char **)t11);
    memcpy(t12, t2, 2U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(132, ng0);
    t2 = xsi_get_transient_memory(3U);
    memset(t2, 0, 3U);
    t5 = t2;
    memset(t5, (unsigned char)3, 3U);
    t8 = (t0 + 1900);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t12 = *((char **)t11);
    memcpy(t12, t2, 3U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(134, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1496);
    xsi_process_wait(t2, t3);

LAB26:    *((char **)t1) = &&LAB27;
    goto LAB1;

LAB21:    goto LAB20;

LAB23:    goto LAB21;

LAB24:    xsi_set_current_line(138, ng0);
    t2 = xsi_get_transient_memory(8U);
    memset(t2, 0, 8U);
    t5 = t2;
    memset(t5, (unsigned char)2, 8U);
    t8 = (t0 + 1040U);
    t9 = *((char **)t8);
    t6 = *((int *)t9);
    t7 = xsi_vhdl_pow(2, t6);
    t13 = (t7 - 1);
    t14 = (t13 - 7);
    t15 = (t14 * -1);
    t16 = (1U * t15);
    t8 = (t5 + t16);
    *((unsigned char *)t8) = (unsigned char)3;
    t10 = (t0 + 1828);
    t11 = (t10 + 32U);
    t12 = *((char **)t11);
    t17 = (t12 + 40U);
    t18 = *((char **)t17);
    memcpy(t18, t2, 8U);
    xsi_driver_first_trans_fast(t10);
    xsi_set_current_line(139, ng0);
    t2 = (t0 + 4427);
    t8 = (t0 + 1864);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t12 = *((char **)t11);
    memcpy(t12, t2, 2U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(140, ng0);
    t2 = xsi_get_transient_memory(3U);
    memset(t2, 0, 3U);
    t5 = t2;
    memset(t5, (unsigned char)3, 3U);
    t8 = (t0 + 1900);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t12 = *((char **)t11);
    memcpy(t12, t2, 3U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(142, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1496);
    xsi_process_wait(t2, t3);

LAB30:    *((char **)t1) = &&LAB31;
    goto LAB1;

LAB25:    goto LAB24;

LAB27:    goto LAB25;

LAB28:    xsi_set_current_line(146, ng0);
    t2 = xsi_get_transient_memory(8U);
    memset(t2, 0, 8U);
    t5 = t2;
    memset(t5, (unsigned char)2, 8U);
    t6 = (7 - 7);
    t15 = (t6 * -1);
    t16 = (1U * t15);
    t8 = (t5 + t16);
    *((unsigned char *)t8) = (unsigned char)3;
    t9 = (t0 + 1828);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    t12 = (t11 + 40U);
    t17 = *((char **)t12);
    memcpy(t17, t2, 8U);
    xsi_driver_first_trans_fast(t9);
    xsi_set_current_line(147, ng0);
    t2 = (t0 + 4429);
    t8 = (t0 + 1864);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t12 = *((char **)t11);
    memcpy(t12, t2, 2U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(148, ng0);
    t2 = xsi_get_transient_memory(3U);
    memset(t2, 0, 3U);
    t5 = t2;
    memset(t5, (unsigned char)3, 3U);
    t8 = (t0 + 1900);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t12 = *((char **)t11);
    memcpy(t12, t2, 3U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(150, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1496);
    xsi_process_wait(t2, t3);

LAB34:    *((char **)t1) = &&LAB35;
    goto LAB1;

LAB29:    goto LAB28;

LAB31:    goto LAB29;

LAB32:    xsi_set_current_line(154, ng0);
    t2 = xsi_get_transient_memory(8U);
    memset(t2, 0, 8U);
    t5 = t2;
    memset(t5, (unsigned char)2, 8U);
    t6 = (7 - 7);
    t15 = (t6 * -1);
    t16 = (1U * t15);
    t8 = (t5 + t16);
    *((unsigned char *)t8) = (unsigned char)3;
    t9 = (t0 + 1828);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    t12 = (t11 + 40U);
    t17 = *((char **)t12);
    memcpy(t17, t2, 8U);
    xsi_driver_first_trans_fast(t9);
    xsi_set_current_line(155, ng0);
    t2 = (t0 + 4431);
    t8 = (t0 + 1864);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t12 = *((char **)t11);
    memcpy(t12, t2, 2U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(156, ng0);
    t2 = xsi_get_transient_memory(3U);
    memset(t2, 0, 3U);
    t5 = t2;
    memset(t5, (unsigned char)3, 3U);
    t8 = (t0 + 1900);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t12 = *((char **)t11);
    memcpy(t12, t2, 3U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(158, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1496);
    xsi_process_wait(t2, t3);

LAB38:    *((char **)t1) = &&LAB39;
    goto LAB1;

LAB33:    goto LAB32;

LAB35:    goto LAB33;

LAB36:    xsi_set_current_line(162, ng0);
    t2 = xsi_get_transient_memory(8U);
    memset(t2, 0, 8U);
    t5 = t2;
    memset(t5, (unsigned char)2, 8U);
    t6 = (7 - 7);
    t15 = (t6 * -1);
    t16 = (1U * t15);
    t8 = (t5 + t16);
    *((unsigned char *)t8) = (unsigned char)3;
    t9 = (t0 + 1828);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    t12 = (t11 + 40U);
    t17 = *((char **)t12);
    memcpy(t17, t2, 8U);
    xsi_driver_first_trans_fast(t9);
    xsi_set_current_line(163, ng0);
    t2 = (t0 + 4433);
    t8 = (t0 + 1864);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t12 = *((char **)t11);
    memcpy(t12, t2, 2U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(164, ng0);
    t2 = xsi_get_transient_memory(3U);
    memset(t2, 0, 3U);
    t5 = t2;
    memset(t5, (unsigned char)3, 3U);
    t8 = (t0 + 1900);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t12 = *((char **)t11);
    memcpy(t12, t2, 3U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(166, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1496);
    xsi_process_wait(t2, t3);

LAB42:    *((char **)t1) = &&LAB43;
    goto LAB1;

LAB37:    goto LAB36;

LAB39:    goto LAB37;

LAB40:    xsi_set_current_line(170, ng0);
    t2 = xsi_get_transient_memory(8U);
    memset(t2, 0, 8U);
    t5 = t2;
    memset(t5, (unsigned char)2, 8U);
    t6 = (7 - 7);
    t15 = (t6 * -1);
    t16 = (1U * t15);
    t8 = (t5 + t16);
    *((unsigned char *)t8) = (unsigned char)3;
    t9 = (t0 + 1828);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    t12 = (t11 + 40U);
    t17 = *((char **)t12);
    memcpy(t17, t2, 8U);
    xsi_driver_first_trans_fast(t9);
    xsi_set_current_line(171, ng0);
    t2 = (t0 + 4435);
    t8 = (t0 + 1864);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t12 = *((char **)t11);
    memcpy(t12, t2, 2U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(172, ng0);
    t2 = xsi_get_transient_memory(3U);
    memset(t2, 0, 3U);
    t5 = t2;
    memset(t5, (unsigned char)3, 3U);
    t8 = (t0 + 1900);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t12 = *((char **)t11);
    memcpy(t12, t2, 3U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(174, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1496);
    xsi_process_wait(t2, t3);

LAB46:    *((char **)t1) = &&LAB47;
    goto LAB1;

LAB41:    goto LAB40;

LAB43:    goto LAB41;

LAB44:    xsi_set_current_line(179, ng0);

LAB50:    *((char **)t1) = &&LAB51;
    goto LAB1;

LAB45:    goto LAB44;

LAB47:    goto LAB45;

LAB48:    goto LAB2;

LAB49:    goto LAB48;

LAB51:    goto LAB49;

}


extern void work_a_1962697021_2372691052_init()
{
	static char *pe[] = {(void *)work_a_1962697021_2372691052_p_0};
	xsi_register_didat("work_a_1962697021_2372691052", "isim/TB_Barrel_Shifter_isim_beh.exe.sim/work/a_1962697021_2372691052.didat");
	xsi_register_executes(pe);
}
