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
static const char *ng0 = "C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/LogicUnits/TB_Logic_Unit.vhd";



static void work_a_1469272487_2372691052_p_0(char *t0)
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
    int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;

LAB0:    t1 = (t0 + 1800U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(92, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1700);
    xsi_process_wait(t2, t3);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(95, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t4 = t2;
    memset(t4, (unsigned char)3, 32U);
    t5 = (t0 + 2032);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(96, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t4 = t2;
    memset(t4, (unsigned char)3, 32U);
    t5 = (t0 + 2068);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(97, ng0);
    t2 = (t0 + 1108U);
    t4 = *((char **)t2);
    t2 = (t0 + 2104);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    memcpy(t8, t4, 2U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(99, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1700);
    xsi_process_wait(t2, t3);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(103, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t4 = t2;
    memset(t4, (unsigned char)3, 32U);
    t5 = (t0 + 2032);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(104, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t4 = t2;
    memset(t4, (unsigned char)3, 32U);
    t10 = (0 - 31);
    t11 = (t10 * -1);
    t12 = (1U * t11);
    t5 = (t4 + t12);
    *((unsigned char *)t5) = (unsigned char)2;
    t6 = (t0 + 2068);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    t9 = (t8 + 40U);
    t13 = *((char **)t9);
    memcpy(t13, t2, 32U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(105, ng0);
    t2 = (t0 + 1108U);
    t4 = *((char **)t2);
    t2 = (t0 + 2104);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    memcpy(t8, t4, 2U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(107, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1700);
    xsi_process_wait(t2, t3);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB12:    xsi_set_current_line(111, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t4 = t2;
    memset(t4, (unsigned char)2, 32U);
    t5 = (t0 + 2032);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(112, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t4 = t2;
    memset(t4, (unsigned char)2, 32U);
    t5 = (t0 + 2068);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(113, ng0);
    t2 = (t0 + 1108U);
    t4 = *((char **)t2);
    t2 = (t0 + 2104);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    memcpy(t8, t4, 2U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(115, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1700);
    xsi_process_wait(t2, t3);

LAB18:    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

LAB16:    xsi_set_current_line(119, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t4 = t2;
    memset(t4, (unsigned char)3, 32U);
    t5 = (t0 + 2032);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(120, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t4 = t2;
    memset(t4, (unsigned char)3, 32U);
    t5 = (t0 + 2068);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(121, ng0);
    t2 = (t0 + 1176U);
    t4 = *((char **)t2);
    t2 = (t0 + 2104);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    memcpy(t8, t4, 2U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(123, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1700);
    xsi_process_wait(t2, t3);

LAB22:    *((char **)t1) = &&LAB23;
    goto LAB1;

LAB17:    goto LAB16;

LAB19:    goto LAB17;

LAB20:    xsi_set_current_line(127, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t4 = t2;
    memset(t4, (unsigned char)3, 32U);
    t5 = (t0 + 2032);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(128, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t4 = t2;
    memset(t4, (unsigned char)3, 32U);
    t10 = (0 - 31);
    t11 = (t10 * -1);
    t12 = (1U * t11);
    t5 = (t4 + t12);
    *((unsigned char *)t5) = (unsigned char)2;
    t6 = (t0 + 2068);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    t9 = (t8 + 40U);
    t13 = *((char **)t9);
    memcpy(t13, t2, 32U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(129, ng0);
    t2 = (t0 + 1176U);
    t4 = *((char **)t2);
    t2 = (t0 + 2104);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    memcpy(t8, t4, 2U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(131, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1700);
    xsi_process_wait(t2, t3);

LAB26:    *((char **)t1) = &&LAB27;
    goto LAB1;

LAB21:    goto LAB20;

LAB23:    goto LAB21;

LAB24:    xsi_set_current_line(135, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t4 = t2;
    memset(t4, (unsigned char)2, 32U);
    t5 = (t0 + 2032);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(136, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t4 = t2;
    memset(t4, (unsigned char)2, 32U);
    t5 = (t0 + 2068);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(137, ng0);
    t2 = (t0 + 1176U);
    t4 = *((char **)t2);
    t2 = (t0 + 2104);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    memcpy(t8, t4, 2U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(139, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1700);
    xsi_process_wait(t2, t3);

LAB30:    *((char **)t1) = &&LAB31;
    goto LAB1;

LAB25:    goto LAB24;

LAB27:    goto LAB25;

LAB28:    xsi_set_current_line(143, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t4 = t2;
    memset(t4, (unsigned char)3, 32U);
    t5 = (t0 + 2032);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(144, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t4 = t2;
    memset(t4, (unsigned char)3, 32U);
    t5 = (t0 + 2068);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(145, ng0);
    t2 = (t0 + 1244U);
    t4 = *((char **)t2);
    t2 = (t0 + 2104);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    memcpy(t8, t4, 2U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(147, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1700);
    xsi_process_wait(t2, t3);

LAB34:    *((char **)t1) = &&LAB35;
    goto LAB1;

LAB29:    goto LAB28;

LAB31:    goto LAB29;

LAB32:    xsi_set_current_line(151, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t4 = t2;
    memset(t4, (unsigned char)3, 32U);
    t5 = (t0 + 2032);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(152, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t4 = t2;
    memset(t4, (unsigned char)3, 32U);
    t10 = (0 - 31);
    t11 = (t10 * -1);
    t12 = (1U * t11);
    t5 = (t4 + t12);
    *((unsigned char *)t5) = (unsigned char)2;
    t6 = (t0 + 2068);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    t9 = (t8 + 40U);
    t13 = *((char **)t9);
    memcpy(t13, t2, 32U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(153, ng0);
    t2 = (t0 + 1244U);
    t4 = *((char **)t2);
    t2 = (t0 + 2104);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    memcpy(t8, t4, 2U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(155, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1700);
    xsi_process_wait(t2, t3);

LAB38:    *((char **)t1) = &&LAB39;
    goto LAB1;

LAB33:    goto LAB32;

LAB35:    goto LAB33;

LAB36:    xsi_set_current_line(159, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t4 = t2;
    memset(t4, (unsigned char)2, 32U);
    t10 = (0 - 31);
    t11 = (t10 * -1);
    t12 = (1U * t11);
    t5 = (t4 + t12);
    *((unsigned char *)t5) = (unsigned char)3;
    t6 = (t0 + 2032);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    t9 = (t8 + 40U);
    t13 = *((char **)t9);
    memcpy(t13, t2, 32U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(160, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t4 = t2;
    memset(t4, (unsigned char)2, 32U);
    t10 = (0 - 31);
    t11 = (t10 * -1);
    t12 = (1U * t11);
    t5 = (t4 + t12);
    *((unsigned char *)t5) = (unsigned char)3;
    t14 = (1 - 31);
    t15 = (t14 * -1);
    t16 = (1U * t15);
    t6 = (t4 + t16);
    *((unsigned char *)t6) = (unsigned char)3;
    t7 = (t0 + 2068);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t13 = (t9 + 40U);
    t17 = *((char **)t13);
    memcpy(t17, t2, 32U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(161, ng0);
    t2 = (t0 + 1244U);
    t4 = *((char **)t2);
    t2 = (t0 + 2104);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    memcpy(t8, t4, 2U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(163, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 1700);
    xsi_process_wait(t2, t3);

LAB42:    *((char **)t1) = &&LAB43;
    goto LAB1;

LAB37:    goto LAB36;

LAB39:    goto LAB37;

LAB40:    xsi_set_current_line(169, ng0);

LAB46:    *((char **)t1) = &&LAB47;
    goto LAB1;

LAB41:    goto LAB40;

LAB43:    goto LAB41;

LAB44:    goto LAB2;

LAB45:    goto LAB44;

LAB47:    goto LAB45;

}


extern void work_a_1469272487_2372691052_init()
{
	static char *pe[] = {(void *)work_a_1469272487_2372691052_p_0};
	xsi_register_didat("work_a_1469272487_2372691052", "isim/TB_Logic_Unit_isim_beh.exe.sim/work/a_1469272487_2372691052.didat");
	xsi_register_executes(pe);
}
