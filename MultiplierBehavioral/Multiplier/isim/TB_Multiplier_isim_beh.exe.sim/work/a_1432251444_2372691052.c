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
static const char *ng0 = "C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/MultiplierBehavioral/Multiplier/TB_Multiplier.vhd";
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_180853171_1035706684(char *, char *, int , int );
char *ieee_p_1242562249_sub_2563015576_1035706684(char *, char *, int , int );


static void work_a_1432251444_2372691052_p_0(char *t0)
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
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t17;

LAB0:    t1 = (t0 + 1596U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(87, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1496);
    xsi_process_wait(t2, t3);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(90, ng0);
    t2 = (t0 + 1040U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t4, 1, t6);
    t7 = (t0 + 1828);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 32U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(91, ng0);
    t2 = (t0 + 1040U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t4, 1, t6);
    t7 = (t0 + 1864);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 32U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(92, ng0);
    t2 = (t0 + 1900);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(93, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1496);
    xsi_process_wait(t2, t3);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(95, ng0);
    t2 = (t0 + 1040U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t4, 1, t6);
    t7 = (t0 + 1828);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 32U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(96, ng0);
    t2 = (t0 + 1040U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t4, 1, t6);
    t7 = (t0 + 1864);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 32U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(97, ng0);
    t2 = (t0 + 1900);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(98, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1496);
    xsi_process_wait(t2, t3);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB12:    xsi_set_current_line(102, ng0);
    t2 = (t0 + 1040U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t4, 16, t6);
    t7 = (t0 + 1828);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 32U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(103, ng0);
    t2 = (t0 + 1040U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t4, 0, t6);
    t7 = (t0 + 1864);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 32U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(104, ng0);
    t2 = (t0 + 1900);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(105, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1496);
    xsi_process_wait(t2, t3);

LAB18:    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

LAB16:    xsi_set_current_line(107, ng0);
    t2 = (t0 + 1040U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t4, 16, t6);
    t7 = (t0 + 1828);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 32U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(108, ng0);
    t2 = (t0 + 1040U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t4, 0, t6);
    t7 = (t0 + 1864);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 32U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(109, ng0);
    t2 = (t0 + 1900);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(110, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1496);
    xsi_process_wait(t2, t3);

LAB22:    *((char **)t1) = &&LAB23;
    goto LAB1;

LAB17:    goto LAB16;

LAB19:    goto LAB17;

LAB20:    xsi_set_current_line(112, ng0);
    t2 = (t0 + 1040U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t4, 15, t6);
    t7 = (t0 + 1828);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 32U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(113, ng0);
    t2 = (t0 + 1040U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t4, 0, t6);
    t7 = (t0 + 1864);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 32U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(114, ng0);
    t2 = (t0 + 1900);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(115, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1496);
    xsi_process_wait(t2, t3);

LAB26:    *((char **)t1) = &&LAB27;
    goto LAB1;

LAB21:    goto LAB20;

LAB23:    goto LAB21;

LAB24:    xsi_set_current_line(117, ng0);
    t6 = (-(15));
    t2 = (t0 + 1040U);
    t5 = *((char **)t2);
    t12 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t4, t6, t12);
    t7 = (t0 + 1828);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 32U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(118, ng0);
    t2 = (t0 + 1040U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t4, 0, t6);
    t7 = (t0 + 1864);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 32U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(119, ng0);
    t2 = (t0 + 1900);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(120, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1496);
    xsi_process_wait(t2, t3);

LAB30:    *((char **)t1) = &&LAB31;
    goto LAB1;

LAB25:    goto LAB24;

LAB27:    goto LAB25;

LAB28:    xsi_set_current_line(124, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t5 = t2;
    memset(t5, (unsigned char)2, 32U);
    t7 = (t0 + 1040U);
    t8 = *((char **)t7);
    t6 = *((int *)t8);
    t12 = (t6 - 1);
    t13 = (t12 - 31);
    t14 = (t13 * -1);
    t15 = (1U * t14);
    t7 = (t5 + t15);
    *((unsigned char *)t7) = (unsigned char)3;
    t9 = (t0 + 1828);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    t16 = (t11 + 40U);
    t17 = *((char **)t16);
    memcpy(t17, t2, 32U);
    xsi_driver_first_trans_fast(t9);
    xsi_set_current_line(125, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t5 = t2;
    memset(t5, (unsigned char)2, 32U);
    t7 = (t0 + 1040U);
    t8 = *((char **)t7);
    t6 = *((int *)t8);
    t12 = (t6 - 1);
    t13 = (t12 - 31);
    t14 = (t13 * -1);
    t15 = (1U * t14);
    t7 = (t5 + t15);
    *((unsigned char *)t7) = (unsigned char)3;
    t9 = (t0 + 1864);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    t16 = (t11 + 40U);
    t17 = *((char **)t16);
    memcpy(t17, t2, 32U);
    xsi_driver_first_trans_fast(t9);
    xsi_set_current_line(126, ng0);
    t2 = (t0 + 1900);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(127, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1496);
    xsi_process_wait(t2, t3);

LAB34:    *((char **)t1) = &&LAB35;
    goto LAB1;

LAB29:    goto LAB28;

LAB31:    goto LAB29;

LAB32:    xsi_set_current_line(129, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t5 = t2;
    memset(t5, (unsigned char)2, 32U);
    t7 = (t0 + 1040U);
    t8 = *((char **)t7);
    t6 = *((int *)t8);
    t12 = (t6 - 1);
    t13 = (t12 - 31);
    t14 = (t13 * -1);
    t15 = (1U * t14);
    t7 = (t5 + t15);
    *((unsigned char *)t7) = (unsigned char)3;
    t9 = (t0 + 1828);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    t16 = (t11 + 40U);
    t17 = *((char **)t16);
    memcpy(t17, t2, 32U);
    xsi_driver_first_trans_fast(t9);
    xsi_set_current_line(130, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t5 = t2;
    memset(t5, (unsigned char)2, 32U);
    t7 = (t0 + 1040U);
    t8 = *((char **)t7);
    t6 = *((int *)t8);
    t12 = (t6 - 1);
    t13 = (t12 - 31);
    t14 = (t13 * -1);
    t15 = (1U * t14);
    t7 = (t5 + t15);
    *((unsigned char *)t7) = (unsigned char)3;
    t9 = (t0 + 1864);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    t16 = (t11 + 40U);
    t17 = *((char **)t16);
    memcpy(t17, t2, 32U);
    xsi_driver_first_trans_fast(t9);
    xsi_set_current_line(131, ng0);
    t2 = (t0 + 1900);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(132, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1496);
    xsi_process_wait(t2, t3);

LAB38:    *((char **)t1) = &&LAB39;
    goto LAB1;

LAB33:    goto LAB32;

LAB35:    goto LAB33;

LAB36:    xsi_set_current_line(136, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t5 = t2;
    memset(t5, (unsigned char)3, 32U);
    t7 = (t0 + 1828);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 32U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(137, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t5 = t2;
    memset(t5, (unsigned char)3, 32U);
    t7 = (t0 + 1864);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 32U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(138, ng0);
    t2 = (t0 + 1900);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(139, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1496);
    xsi_process_wait(t2, t3);

LAB42:    *((char **)t1) = &&LAB43;
    goto LAB1;

LAB37:    goto LAB36;

LAB39:    goto LAB37;

LAB40:    xsi_set_current_line(141, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t5 = t2;
    memset(t5, (unsigned char)3, 32U);
    t7 = (t0 + 1828);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 32U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(142, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t5 = t2;
    memset(t5, (unsigned char)3, 32U);
    t7 = (t0 + 1864);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 32U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(143, ng0);
    t2 = (t0 + 1900);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(144, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1496);
    xsi_process_wait(t2, t3);

LAB46:    *((char **)t1) = &&LAB47;
    goto LAB1;

LAB41:    goto LAB40;

LAB43:    goto LAB41;

LAB44:    xsi_set_current_line(146, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t5 = t2;
    memset(t5, (unsigned char)3, 32U);
    t7 = (t0 + 1828);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 32U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(147, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t5 = t2;
    memset(t5, (unsigned char)2, 32U);
    t7 = (t0 + 1864);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 32U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(148, ng0);
    t2 = (t0 + 1900);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(149, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1496);
    xsi_process_wait(t2, t3);

LAB50:    *((char **)t1) = &&LAB51;
    goto LAB1;

LAB45:    goto LAB44;

LAB47:    goto LAB45;

LAB48:    xsi_set_current_line(151, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t5 = t2;
    memset(t5, (unsigned char)3, 32U);
    t7 = (t0 + 1828);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 32U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(152, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t5 = t2;
    memset(t5, (unsigned char)2, 32U);
    t7 = (t0 + 1864);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 32U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(153, ng0);
    t2 = (t0 + 1900);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(154, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1496);
    xsi_process_wait(t2, t3);

LAB54:    *((char **)t1) = &&LAB55;
    goto LAB1;

LAB49:    goto LAB48;

LAB51:    goto LAB49;

LAB52:    xsi_set_current_line(158, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t5 = t2;
    memset(t5, (unsigned char)2, 32U);
    t6 = (0 - 31);
    t14 = (t6 * -1);
    t15 = (1U * t14);
    t7 = (t5 + t15);
    *((unsigned char *)t7) = (unsigned char)3;
    t8 = (t0 + 1828);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t16 = *((char **)t11);
    memcpy(t16, t2, 32U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(159, ng0);
    t2 = (t0 + 1040U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t4, 2, t6);
    t7 = (t0 + 1864);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 32U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(160, ng0);
    t2 = (t0 + 1900);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(161, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1496);
    xsi_process_wait(t2, t3);

LAB58:    *((char **)t1) = &&LAB59;
    goto LAB1;

LAB53:    goto LAB52;

LAB55:    goto LAB53;

LAB56:    xsi_set_current_line(163, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t5 = t2;
    memset(t5, (unsigned char)2, 32U);
    t6 = (1 - 31);
    t14 = (t6 * -1);
    t15 = (1U * t14);
    t7 = (t5 + t15);
    *((unsigned char *)t7) = (unsigned char)3;
    t8 = (t0 + 1828);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t16 = *((char **)t11);
    memcpy(t16, t2, 32U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(164, ng0);
    t2 = (t0 + 1040U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = (t0 + 1040U);
    t7 = *((char **)t2);
    t12 = *((int *)t7);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t4, t6, t12);
    t8 = (t0 + 1864);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t16 = *((char **)t11);
    memcpy(t16, t2, 32U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(165, ng0);
    t2 = (t0 + 1900);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(166, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1496);
    xsi_process_wait(t2, t3);

LAB62:    *((char **)t1) = &&LAB63;
    goto LAB1;

LAB57:    goto LAB56;

LAB59:    goto LAB57;

LAB60:    xsi_set_current_line(168, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t5 = t2;
    memset(t5, (unsigned char)2, 32U);
    t7 = (t0 + 1040U);
    t8 = *((char **)t7);
    t6 = *((int *)t8);
    t12 = (t6 - 1);
    t13 = (t12 - 31);
    t14 = (t13 * -1);
    t15 = (1U * t14);
    t7 = (t5 + t15);
    *((unsigned char *)t7) = (unsigned char)3;
    t9 = (t0 + 1828);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    t16 = (t11 + 40U);
    t17 = *((char **)t16);
    memcpy(t17, t2, 32U);
    xsi_driver_first_trans_fast(t9);
    xsi_set_current_line(169, ng0);
    t2 = (t0 + 1040U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = (t0 + 1040U);
    t7 = *((char **)t2);
    t12 = *((int *)t7);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t4, t6, t12);
    t8 = (t0 + 1864);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t16 = *((char **)t11);
    memcpy(t16, t2, 32U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(170, ng0);
    t2 = (t0 + 1900);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(171, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1496);
    xsi_process_wait(t2, t3);

LAB66:    *((char **)t1) = &&LAB67;
    goto LAB1;

LAB61:    goto LAB60;

LAB63:    goto LAB61;

LAB64:    xsi_set_current_line(176, ng0);

LAB70:    *((char **)t1) = &&LAB71;
    goto LAB1;

LAB65:    goto LAB64;

LAB67:    goto LAB65;

LAB68:    goto LAB2;

LAB69:    goto LAB68;

LAB71:    goto LAB69;

}


extern void work_a_1432251444_2372691052_init()
{
	static char *pe[] = {(void *)work_a_1432251444_2372691052_p_0};
	xsi_register_didat("work_a_1432251444_2372691052", "isim/TB_Multiplier_isim_beh.exe.sim/work/a_1432251444_2372691052.didat");
	xsi_register_executes(pe);
}
