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
static const char *ng0 = "C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/Comparator/TB_Comparator.vhd";
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_180853171_1035706684(char *, char *, int , int );
char *ieee_p_1242562249_sub_2563015576_1035706684(char *, char *, int , int );


static void work_a_3228852636_2372691052_p_0(char *t0)
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

LAB0:    t1 = (t0 + 2056U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(101, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1956);
    xsi_process_wait(t2, t3);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(104, ng0);
    t2 = (t0 + 1500U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t4, 4, t6);
    t7 = (t0 + 2288);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(105, ng0);
    t6 = (-(4));
    t2 = (t0 + 1500U);
    t5 = *((char **)t2);
    t12 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t4, t6, t12);
    t7 = (t0 + 2324);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(107, ng0);
    t2 = (t0 + 2360);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(108, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1956);
    xsi_process_wait(t2, t3);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(110, ng0);
    t2 = (t0 + 1500U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t4, 4, t6);
    t7 = (t0 + 2288);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(111, ng0);
    t6 = (-(4));
    t2 = (t0 + 1500U);
    t5 = *((char **)t2);
    t12 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t4, t6, t12);
    t7 = (t0 + 2324);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(113, ng0);
    t2 = (t0 + 2360);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(114, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1956);
    xsi_process_wait(t2, t3);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB12:    xsi_set_current_line(116, ng0);
    t2 = (t0 + 1500U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t4, 4, t6);
    t7 = (t0 + 2288);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(117, ng0);
    t6 = (-(5));
    t2 = (t0 + 1500U);
    t5 = *((char **)t2);
    t12 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t4, t6, t12);
    t7 = (t0 + 2324);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(119, ng0);
    t2 = (t0 + 2360);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(120, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1956);
    xsi_process_wait(t2, t3);

LAB18:    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

LAB16:    xsi_set_current_line(122, ng0);
    t2 = (t0 + 1500U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t4, 4, t6);
    t7 = (t0 + 2288);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(123, ng0);
    t6 = (-(5));
    t2 = (t0 + 1500U);
    t5 = *((char **)t2);
    t12 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t4, t6, t12);
    t7 = (t0 + 2324);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(125, ng0);
    t2 = (t0 + 2360);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(126, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1956);
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
    t7 = (t0 + 1500U);
    t8 = *((char **)t7);
    t6 = *((int *)t8);
    t12 = (t6 - 1);
    t13 = (t12 - 7);
    t14 = (t13 * -1);
    t15 = (1U * t14);
    t7 = (t5 + t15);
    *((unsigned char *)t7) = (unsigned char)3;
    t9 = (t0 + 2288);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    t16 = (t11 + 40U);
    t17 = *((char **)t16);
    memcpy(t17, t2, 8U);
    xsi_driver_first_trans_fast(t9);
    xsi_set_current_line(131, ng0);
    t2 = (t0 + 1500U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t4, 4, t6);
    t7 = (t0 + 2324);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(133, ng0);
    t2 = (t0 + 2360);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(134, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1956);
    xsi_process_wait(t2, t3);

LAB26:    *((char **)t1) = &&LAB27;
    goto LAB1;

LAB21:    goto LAB20;

LAB23:    goto LAB21;

LAB24:    xsi_set_current_line(136, ng0);
    t2 = (t0 + 1500U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t4, 4, t6);
    t7 = (t0 + 2288);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(137, ng0);
    t2 = xsi_get_transient_memory(8U);
    memset(t2, 0, 8U);
    t5 = t2;
    memset(t5, (unsigned char)2, 8U);
    t7 = (t0 + 1500U);
    t8 = *((char **)t7);
    t6 = *((int *)t8);
    t12 = (t6 - 1);
    t13 = (t12 - 7);
    t14 = (t13 * -1);
    t15 = (1U * t14);
    t7 = (t5 + t15);
    *((unsigned char *)t7) = (unsigned char)3;
    t9 = (t0 + 2324);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    t16 = (t11 + 40U);
    t17 = *((char **)t16);
    memcpy(t17, t2, 8U);
    xsi_driver_first_trans_fast(t9);
    xsi_set_current_line(139, ng0);
    t2 = (t0 + 2360);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(140, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1956);
    xsi_process_wait(t2, t3);

LAB30:    *((char **)t1) = &&LAB31;
    goto LAB1;

LAB25:    goto LAB24;

LAB27:    goto LAB25;

LAB28:    xsi_set_current_line(144, ng0);
    t2 = (t0 + 1500U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t4, 5, t6);
    t7 = (t0 + 2288);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(145, ng0);
    t2 = (t0 + 1500U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t4, 1, t6);
    t7 = (t0 + 2324);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(147, ng0);
    t2 = (t0 + 2360);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(148, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1956);
    xsi_process_wait(t2, t3);

LAB34:    *((char **)t1) = &&LAB35;
    goto LAB1;

LAB29:    goto LAB28;

LAB31:    goto LAB29;

LAB32:    xsi_set_current_line(150, ng0);
    t2 = (t0 + 1500U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t4, 4, t6);
    t7 = (t0 + 2288);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(151, ng0);
    t2 = (t0 + 1500U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t4, 5, t6);
    t7 = (t0 + 2324);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(153, ng0);
    t2 = (t0 + 2360);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(154, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1956);
    xsi_process_wait(t2, t3);

LAB38:    *((char **)t1) = &&LAB39;
    goto LAB1;

LAB33:    goto LAB32;

LAB35:    goto LAB33;

LAB36:    xsi_set_current_line(158, ng0);
    t2 = xsi_get_transient_memory(8U);
    memset(t2, 0, 8U);
    t5 = t2;
    memset(t5, (unsigned char)2, 8U);
    t7 = (t0 + 2288);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(159, ng0);
    t2 = xsi_get_transient_memory(8U);
    memset(t2, 0, 8U);
    t5 = t2;
    memset(t5, (unsigned char)2, 8U);
    t6 = (0 - 7);
    t14 = (t6 * -1);
    t15 = (1U * t14);
    t7 = (t5 + t15);
    *((unsigned char *)t7) = (unsigned char)3;
    t8 = (t0 + 2324);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t16 = *((char **)t11);
    memcpy(t16, t2, 8U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(161, ng0);
    t2 = (t0 + 2360);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(162, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1956);
    xsi_process_wait(t2, t3);

LAB42:    *((char **)t1) = &&LAB43;
    goto LAB1;

LAB37:    goto LAB36;

LAB39:    goto LAB37;

LAB40:    xsi_set_current_line(164, ng0);
    t2 = xsi_get_transient_memory(8U);
    memset(t2, 0, 8U);
    t5 = t2;
    memset(t5, (unsigned char)2, 8U);
    t6 = (0 - 7);
    t14 = (t6 * -1);
    t15 = (1U * t14);
    t7 = (t5 + t15);
    *((unsigned char *)t7) = (unsigned char)3;
    t8 = (t0 + 2288);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t16 = *((char **)t11);
    memcpy(t16, t2, 8U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(165, ng0);
    t2 = xsi_get_transient_memory(8U);
    memset(t2, 0, 8U);
    t5 = t2;
    memset(t5, (unsigned char)2, 8U);
    t7 = (t0 + 2324);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(167, ng0);
    t2 = (t0 + 2360);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(168, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1956);
    xsi_process_wait(t2, t3);

LAB46:    *((char **)t1) = &&LAB47;
    goto LAB1;

LAB41:    goto LAB40;

LAB43:    goto LAB41;

LAB44:    xsi_set_current_line(172, ng0);
    t2 = (t0 + 1500U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t4, 5, t6);
    t7 = (t0 + 2288);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(173, ng0);
    t2 = (t0 + 1500U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t4, 7, t6);
    t7 = (t0 + 2324);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(175, ng0);
    t2 = (t0 + 2360);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(176, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1956);
    xsi_process_wait(t2, t3);

LAB50:    *((char **)t1) = &&LAB51;
    goto LAB1;

LAB45:    goto LAB44;

LAB47:    goto LAB45;

LAB48:    xsi_set_current_line(178, ng0);
    t2 = (t0 + 1500U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t4, 4, t6);
    t7 = (t0 + 2288);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(179, ng0);
    t2 = (t0 + 1500U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t4, 7, t6);
    t7 = (t0 + 2324);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(181, ng0);
    t2 = (t0 + 2360);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(182, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1956);
    xsi_process_wait(t2, t3);

LAB54:    *((char **)t1) = &&LAB55;
    goto LAB1;

LAB49:    goto LAB48;

LAB51:    goto LAB49;

LAB52:    xsi_set_current_line(186, ng0);
    t6 = (-(5));
    t2 = (t0 + 1500U);
    t5 = *((char **)t2);
    t12 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t4, t6, t12);
    t7 = (t0 + 2288);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(187, ng0);
    t6 = (-(6));
    t2 = (t0 + 1500U);
    t5 = *((char **)t2);
    t12 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t4, t6, t12);
    t7 = (t0 + 2324);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(189, ng0);
    t2 = (t0 + 2360);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(190, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1956);
    xsi_process_wait(t2, t3);

LAB58:    *((char **)t1) = &&LAB59;
    goto LAB1;

LAB53:    goto LAB52;

LAB55:    goto LAB53;

LAB56:    xsi_set_current_line(192, ng0);
    t6 = (-(4));
    t2 = (t0 + 1500U);
    t5 = *((char **)t2);
    t12 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t4, t6, t12);
    t7 = (t0 + 2288);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(193, ng0);
    t6 = (-(3));
    t2 = (t0 + 1500U);
    t5 = *((char **)t2);
    t12 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t4, t6, t12);
    t7 = (t0 + 2324);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(195, ng0);
    t2 = (t0 + 2360);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(196, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1956);
    xsi_process_wait(t2, t3);

LAB62:    *((char **)t1) = &&LAB63;
    goto LAB1;

LAB57:    goto LAB56;

LAB59:    goto LAB57;

LAB60:    xsi_set_current_line(200, ng0);
    t6 = (-(5));
    t2 = (t0 + 1500U);
    t5 = *((char **)t2);
    t12 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t4, t6, t12);
    t7 = (t0 + 2288);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(201, ng0);
    t2 = (t0 + 1500U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t4, 1, t6);
    t7 = (t0 + 2324);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(203, ng0);
    t2 = (t0 + 2360);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(204, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1956);
    xsi_process_wait(t2, t3);

LAB66:    *((char **)t1) = &&LAB67;
    goto LAB1;

LAB61:    goto LAB60;

LAB63:    goto LAB61;

LAB64:    xsi_set_current_line(206, ng0);
    t2 = (t0 + 1500U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t4, 4, t6);
    t7 = (t0 + 2288);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(207, ng0);
    t6 = (-(3));
    t2 = (t0 + 1500U);
    t5 = *((char **)t2);
    t12 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t4, t6, t12);
    t7 = (t0 + 2324);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(209, ng0);
    t2 = (t0 + 2360);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(210, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1956);
    xsi_process_wait(t2, t3);

LAB70:    *((char **)t1) = &&LAB71;
    goto LAB1;

LAB65:    goto LAB64;

LAB67:    goto LAB65;

LAB68:    xsi_set_current_line(215, ng0);
    t2 = (t0 + 1500U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t4, 0, t6);
    t7 = (t0 + 2288);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(216, ng0);
    t2 = (t0 + 1500U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t4, 0, t6);
    t7 = (t0 + 2324);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(217, ng0);
    t2 = (t0 + 2360);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(218, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1956);
    xsi_process_wait(t2, t3);

LAB74:    *((char **)t1) = &&LAB75;
    goto LAB1;

LAB69:    goto LAB68;

LAB71:    goto LAB69;

LAB72:    xsi_set_current_line(220, ng0);
    t2 = (t0 + 1500U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t4, 0, t6);
    t7 = (t0 + 2288);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(221, ng0);
    t2 = (t0 + 1500U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t4, 0, t6);
    t7 = (t0 + 2324);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(222, ng0);
    t2 = (t0 + 2360);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(223, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1956);
    xsi_process_wait(t2, t3);

LAB78:    *((char **)t1) = &&LAB79;
    goto LAB1;

LAB73:    goto LAB72;

LAB75:    goto LAB73;

LAB76:    xsi_set_current_line(227, ng0);
    t2 = xsi_get_transient_memory(8U);
    memset(t2, 0, 8U);
    t5 = t2;
    memset(t5, (unsigned char)2, 8U);
    t7 = (t0 + 1500U);
    t8 = *((char **)t7);
    t6 = *((int *)t8);
    t12 = (t6 - 1);
    t13 = (t12 - 7);
    t14 = (t13 * -1);
    t15 = (1U * t14);
    t7 = (t5 + t15);
    *((unsigned char *)t7) = (unsigned char)3;
    t9 = (t0 + 2288);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    t16 = (t11 + 40U);
    t17 = *((char **)t16);
    memcpy(t17, t2, 8U);
    xsi_driver_first_trans_fast(t9);
    xsi_set_current_line(228, ng0);
    t2 = xsi_get_transient_memory(8U);
    memset(t2, 0, 8U);
    t5 = t2;
    memset(t5, (unsigned char)2, 8U);
    t7 = (t0 + 1500U);
    t8 = *((char **)t7);
    t6 = *((int *)t8);
    t12 = (t6 - 1);
    t13 = (t12 - 7);
    t14 = (t13 * -1);
    t15 = (1U * t14);
    t7 = (t5 + t15);
    *((unsigned char *)t7) = (unsigned char)3;
    t9 = (t0 + 2324);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    t16 = (t11 + 40U);
    t17 = *((char **)t16);
    memcpy(t17, t2, 8U);
    xsi_driver_first_trans_fast(t9);
    xsi_set_current_line(229, ng0);
    t2 = (t0 + 2360);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(230, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1956);
    xsi_process_wait(t2, t3);

LAB82:    *((char **)t1) = &&LAB83;
    goto LAB1;

LAB77:    goto LAB76;

LAB79:    goto LAB77;

LAB80:    xsi_set_current_line(232, ng0);
    t2 = xsi_get_transient_memory(8U);
    memset(t2, 0, 8U);
    t5 = t2;
    memset(t5, (unsigned char)2, 8U);
    t7 = (t0 + 1500U);
    t8 = *((char **)t7);
    t6 = *((int *)t8);
    t12 = (t6 - 2);
    t13 = (t12 - 7);
    t14 = (t13 * -1);
    t15 = (1U * t14);
    t7 = (t5 + t15);
    *((unsigned char *)t7) = (unsigned char)3;
    t9 = (t0 + 2288);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    t16 = (t11 + 40U);
    t17 = *((char **)t16);
    memcpy(t17, t2, 8U);
    xsi_driver_first_trans_fast(t9);
    xsi_set_current_line(233, ng0);
    t2 = xsi_get_transient_memory(8U);
    memset(t2, 0, 8U);
    t5 = t2;
    memset(t5, (unsigned char)2, 8U);
    t7 = (t0 + 1500U);
    t8 = *((char **)t7);
    t6 = *((int *)t8);
    t12 = (t6 - 2);
    t13 = (t12 - 7);
    t14 = (t13 * -1);
    t15 = (1U * t14);
    t7 = (t5 + t15);
    *((unsigned char *)t7) = (unsigned char)3;
    t9 = (t0 + 2324);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    t16 = (t11 + 40U);
    t17 = *((char **)t16);
    memcpy(t17, t2, 8U);
    xsi_driver_first_trans_fast(t9);
    xsi_set_current_line(234, ng0);
    t2 = (t0 + 2360);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(235, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1956);
    xsi_process_wait(t2, t3);

LAB86:    *((char **)t1) = &&LAB87;
    goto LAB1;

LAB81:    goto LAB80;

LAB83:    goto LAB81;

LAB84:    xsi_set_current_line(237, ng0);
    t2 = xsi_get_transient_memory(8U);
    memset(t2, 0, 8U);
    t5 = t2;
    memset(t5, (unsigned char)3, 8U);
    t7 = (t0 + 2288);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(238, ng0);
    t2 = xsi_get_transient_memory(8U);
    memset(t2, 0, 8U);
    t5 = t2;
    memset(t5, (unsigned char)3, 8U);
    t7 = (t0 + 2324);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(239, ng0);
    t2 = (t0 + 2360);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(240, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1956);
    xsi_process_wait(t2, t3);

LAB90:    *((char **)t1) = &&LAB91;
    goto LAB1;

LAB85:    goto LAB84;

LAB87:    goto LAB85;

LAB88:    xsi_set_current_line(244, ng0);
    t2 = xsi_get_transient_memory(8U);
    memset(t2, 0, 8U);
    t5 = t2;
    memset(t5, (unsigned char)2, 8U);
    t7 = (t0 + 1500U);
    t8 = *((char **)t7);
    t6 = *((int *)t8);
    t12 = (t6 - 1);
    t13 = (t12 - 7);
    t14 = (t13 * -1);
    t15 = (1U * t14);
    t7 = (t5 + t15);
    *((unsigned char *)t7) = (unsigned char)3;
    t9 = (t0 + 2288);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    t16 = (t11 + 40U);
    t17 = *((char **)t16);
    memcpy(t17, t2, 8U);
    xsi_driver_first_trans_fast(t9);
    xsi_set_current_line(245, ng0);
    t2 = xsi_get_transient_memory(8U);
    memset(t2, 0, 8U);
    t5 = t2;
    memset(t5, (unsigned char)2, 8U);
    t7 = (t0 + 1500U);
    t8 = *((char **)t7);
    t6 = *((int *)t8);
    t12 = (t6 - 1);
    t13 = (t12 - 7);
    t14 = (t13 * -1);
    t15 = (1U * t14);
    t7 = (t5 + t15);
    *((unsigned char *)t7) = (unsigned char)3;
    t9 = (t0 + 2324);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    t16 = (t11 + 40U);
    t17 = *((char **)t16);
    memcpy(t17, t2, 8U);
    xsi_driver_first_trans_fast(t9);
    xsi_set_current_line(246, ng0);
    t2 = (t0 + 2360);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(247, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1956);
    xsi_process_wait(t2, t3);

LAB94:    *((char **)t1) = &&LAB95;
    goto LAB1;

LAB89:    goto LAB88;

LAB91:    goto LAB89;

LAB92:    xsi_set_current_line(249, ng0);
    t2 = xsi_get_transient_memory(8U);
    memset(t2, 0, 8U);
    t5 = t2;
    memset(t5, (unsigned char)2, 8U);
    t7 = (t0 + 1500U);
    t8 = *((char **)t7);
    t6 = *((int *)t8);
    t12 = (t6 - 2);
    t13 = (t12 - 7);
    t14 = (t13 * -1);
    t15 = (1U * t14);
    t7 = (t5 + t15);
    *((unsigned char *)t7) = (unsigned char)3;
    t9 = (t0 + 2288);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    t16 = (t11 + 40U);
    t17 = *((char **)t16);
    memcpy(t17, t2, 8U);
    xsi_driver_first_trans_fast(t9);
    xsi_set_current_line(250, ng0);
    t2 = xsi_get_transient_memory(8U);
    memset(t2, 0, 8U);
    t5 = t2;
    memset(t5, (unsigned char)2, 8U);
    t7 = (t0 + 1500U);
    t8 = *((char **)t7);
    t6 = *((int *)t8);
    t12 = (t6 - 2);
    t13 = (t12 - 7);
    t14 = (t13 * -1);
    t15 = (1U * t14);
    t7 = (t5 + t15);
    *((unsigned char *)t7) = (unsigned char)3;
    t9 = (t0 + 2324);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    t16 = (t11 + 40U);
    t17 = *((char **)t16);
    memcpy(t17, t2, 8U);
    xsi_driver_first_trans_fast(t9);
    xsi_set_current_line(251, ng0);
    t2 = (t0 + 2360);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(252, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1956);
    xsi_process_wait(t2, t3);

LAB98:    *((char **)t1) = &&LAB99;
    goto LAB1;

LAB93:    goto LAB92;

LAB95:    goto LAB93;

LAB96:    xsi_set_current_line(254, ng0);
    t2 = xsi_get_transient_memory(8U);
    memset(t2, 0, 8U);
    t5 = t2;
    memset(t5, (unsigned char)2, 8U);
    t7 = (t0 + 1500U);
    t8 = *((char **)t7);
    t6 = *((int *)t8);
    t12 = (t6 - 1);
    t13 = (t12 - 7);
    t14 = (t13 * -1);
    t15 = (1U * t14);
    t7 = (t5 + t15);
    *((unsigned char *)t7) = (unsigned char)3;
    t9 = (t0 + 2288);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    t16 = (t11 + 40U);
    t17 = *((char **)t16);
    memcpy(t17, t2, 8U);
    xsi_driver_first_trans_fast(t9);
    xsi_set_current_line(255, ng0);
    t2 = xsi_get_transient_memory(8U);
    memset(t2, 0, 8U);
    t5 = t2;
    memset(t5, (unsigned char)2, 8U);
    t7 = (t0 + 1500U);
    t8 = *((char **)t7);
    t6 = *((int *)t8);
    t12 = (t6 - 2);
    t13 = (t12 - 7);
    t14 = (t13 * -1);
    t15 = (1U * t14);
    t7 = (t5 + t15);
    *((unsigned char *)t7) = (unsigned char)3;
    t9 = (t0 + 2324);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    t16 = (t11 + 40U);
    t17 = *((char **)t16);
    memcpy(t17, t2, 8U);
    xsi_driver_first_trans_fast(t9);
    xsi_set_current_line(256, ng0);
    t2 = (t0 + 2360);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(257, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1956);
    xsi_process_wait(t2, t3);

LAB102:    *((char **)t1) = &&LAB103;
    goto LAB1;

LAB97:    goto LAB96;

LAB99:    goto LAB97;

LAB100:    xsi_set_current_line(259, ng0);
    t2 = xsi_get_transient_memory(8U);
    memset(t2, 0, 8U);
    t5 = t2;
    memset(t5, (unsigned char)3, 8U);
    t7 = (t0 + 2288);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(260, ng0);
    t2 = xsi_get_transient_memory(8U);
    memset(t2, 0, 8U);
    t5 = t2;
    memset(t5, (unsigned char)3, 8U);
    t7 = (t0 + 2324);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(261, ng0);
    t2 = (t0 + 2360);
    t5 = (t2 + 32U);
    t7 = *((char **)t5);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(262, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1956);
    xsi_process_wait(t2, t3);

LAB106:    *((char **)t1) = &&LAB107;
    goto LAB1;

LAB101:    goto LAB100;

LAB103:    goto LAB101;

LAB104:    xsi_set_current_line(269, ng0);

LAB110:    *((char **)t1) = &&LAB111;
    goto LAB1;

LAB105:    goto LAB104;

LAB107:    goto LAB105;

LAB108:    goto LAB2;

LAB109:    goto LAB108;

LAB111:    goto LAB109;

}


extern void work_a_3228852636_2372691052_init()
{
	static char *pe[] = {(void *)work_a_3228852636_2372691052_p_0};
	xsi_register_didat("work_a_3228852636_2372691052", "isim/TB_Comparator_isim_beh.exe.sim/work/a_3228852636_2372691052.didat");
	xsi_register_executes(pe);
}
