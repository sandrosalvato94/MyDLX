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
static const char *ng0 = "C:/Users/Alessandro/Documents/GitHub/MyDLX/DLX_plus_memories/a.c-IRAM.vhd";
extern char *STD_TEXTIO;
extern char *IEEE_P_3564397177;
extern char *IEEE_P_1242562249;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);
void ieee_p_3564397177_sub_3988856810_91900896(char *, char *, char *, char *, char *);


static void work_a_0134658111_2373810918_p_0(char *t0)
{
    char t18[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    int t6;
    int t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    unsigned char t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    unsigned char t19;

LAB0:    xsi_set_current_line(45, ng0);
    t1 = (t0 + 592U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 2400);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(46, ng0);
    t1 = xsi_get_transient_memory(32768U);
    memset(t1, 0, 32768U);
    t5 = t1;
    t6 = (1024 - 1);
    t7 = (t6 - 0);
    t8 = (t7 * 1);
    t8 = (t8 + 1);
    t9 = (t8 * 1U);
    t10 = t5;
    memset(t10, (unsigned char)2, t9);
    t11 = (t9 != 0);
    if (t11 == 1)
        goto LAB5;

LAB6:    t13 = (t0 + 2452);
    t14 = (t13 + 32U);
    t15 = *((char **)t14);
    t16 = (t15 + 40U);
    t17 = *((char **)t16);
    memcpy(t17, t1, 32768U);
    xsi_driver_first_trans_delta(t13, 0U, 32768U, 0LL);
    xsi_set_current_line(47, ng0);
    t1 = (t0 + 1524U);
    t2 = (t0 + 37844);
    t10 = (t18 + 0U);
    t13 = (t10 + 0U);
    *((int *)t13) = 1;
    t13 = (t10 + 4U);
    *((int *)t13) = 21;
    t13 = (t10 + 8U);
    *((int *)t13) = 1;
    t6 = (21 - 1);
    t8 = (t6 * 1);
    t8 = (t8 + 1);
    t13 = (t10 + 12U);
    *((unsigned int *)t13) = t8;
    std_textio_file_open1(t1, t2, t18, (unsigned char)0);
    xsi_set_current_line(49, ng0);

LAB7:    t1 = (t0 + 1524U);
    t4 = std_textio_endfile(t1);
    t11 = (!(t4));
    if (t11 == 1)
        goto LAB11;

LAB12:    t3 = (unsigned char)0;

LAB13:    if (t3 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(57, ng0);
    t1 = (t0 + 1524U);
    std_textio_file_close(t1);
    goto LAB3;

LAB5:    t12 = (32768U / t9);
    xsi_mem_set_data(t5, t5, t9, t12);
    goto LAB6;

LAB8:    xsi_set_current_line(50, ng0);
    t2 = (t0 + 1960);
    t10 = (t0 + 1524U);
    t13 = (t0 + 1692U);
    std_textio_readline(STD_TEXTIO, t2, t10, t13);
    xsi_set_current_line(51, ng0);
    t1 = (t0 + 1960);
    t2 = (t0 + 1692U);
    t5 = (t0 + 1336U);
    t10 = *((char **)t5);
    t5 = (t0 + 4932U);
    ieee_p_3564397177_sub_3988856810_91900896(IEEE_P_3564397177, t1, t2, t10, t5);
    xsi_set_current_line(52, ng0);
    t1 = (t0 + 1336U);
    t2 = *((char **)t1);
    t1 = (t0 + 1268U);
    t5 = *((char **)t1);
    t6 = *((int *)t5);
    t7 = (t6 - 0);
    t8 = (t7 * 1);
    t9 = (32U * t8);
    t12 = (0U + t9);
    t1 = (t0 + 2452);
    t10 = (t1 + 32U);
    t13 = *((char **)t10);
    t14 = (t13 + 40U);
    t15 = *((char **)t14);
    memcpy(t15, t2, 32U);
    xsi_driver_first_trans_delta(t1, t12, 32U, 0LL);
    xsi_set_current_line(54, ng0);
    t1 = (t0 + 1268U);
    t2 = *((char **)t1);
    t6 = *((int *)t2);
    t7 = (t6 + 1);
    t1 = (t0 + 1268U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    *((int *)t1) = t7;
    goto LAB7;

LAB9:;
LAB11:    t2 = (t0 + 1268U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t19 = (t6 < 1024);
    t3 = t19;
    goto LAB13;

}

static void work_a_0134658111_2373810918_p_1(char *t0)
{
    char t16[16];
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
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    int t17;
    unsigned int t18;
    int t19;
    int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;

LAB0:    xsi_set_current_line(64, ng0);
    t1 = xsi_get_transient_memory(32U);
    memset(t1, 0, 32U);
    t2 = t1;
    memset(t2, (unsigned char)2, 32U);
    t3 = (t0 + 2488);
    t4 = (t3 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 32U);
    xsi_driver_first_trans_fast_port(t3);
    xsi_set_current_line(65, ng0);
    t1 = (t0 + 592U);
    t2 = *((char **)t1);
    t9 = *((unsigned char *)t2);
    t10 = (t9 == (unsigned char)3);
    if (t10 == 1)
        goto LAB5;

LAB6:    t8 = (unsigned char)0;

LAB7:    if (t8 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 2408);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(66, ng0);
    t1 = (t0 + 960U);
    t4 = *((char **)t1);
    t1 = (t0 + 684U);
    t5 = *((char **)t1);
    t13 = (31 - 9);
    t14 = (t13 * 1U);
    t15 = (0 + t14);
    t1 = (t5 + t15);
    t6 = (t16 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 9;
    t7 = (t6 + 4U);
    *((int *)t7) = 2;
    t7 = (t6 + 8U);
    *((int *)t7) = -1;
    t17 = (2 - 9);
    t18 = (t17 * -1);
    t18 = (t18 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t18;
    t19 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t1, t16);
    t20 = (t19 - 0);
    t18 = (t20 * 1);
    xsi_vhdl_check_range_of_index(0, 1023, 1, t19);
    t21 = (32U * t18);
    t22 = (0 + t21);
    t7 = (t4 + t22);
    t23 = (t0 + 2488);
    t24 = (t23 + 32U);
    t25 = *((char **)t24);
    t26 = (t25 + 40U);
    t27 = *((char **)t26);
    memcpy(t27, t7, 32U);
    xsi_driver_first_trans_fast_port(t23);
    goto LAB3;

LAB5:    t1 = (t0 + 776U);
    t3 = *((char **)t1);
    t11 = *((unsigned char *)t3);
    t12 = (t11 == (unsigned char)3);
    t8 = t12;
    goto LAB7;

}


extern void work_a_0134658111_2373810918_init()
{
	static char *pe[] = {(void *)work_a_0134658111_2373810918_p_0,(void *)work_a_0134658111_2373810918_p_1};
	xsi_register_didat("work_a_0134658111_2373810918", "isim/TB_DLX_PM_isim_beh.exe.sim/work/a_0134658111_2373810918.didat");
	xsi_register_executes(pe);
}
