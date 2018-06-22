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
static const char *ng0 = "C:/Users/Alessandro/Documents/GitHub/MyDLX/Datapath/registerfile.vhd";
extern char *IEEE_P_3620187407;

int ieee_p_3620187407_sub_514432868_3965413181(char *, char *, char *);


static void work_a_2924110608_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    unsigned int t12;
    char *t13;
    unsigned char t14;
    unsigned int t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    int t21;
    int t22;
    unsigned int t23;

LAB0:    xsi_set_current_line(45, ng0);
    t1 = (t0 + 776U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 3320);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(46, ng0);
    t1 = (t0 + 592U);
    t5 = *((char **)t1);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    if (t7 != 0)
        goto LAB5;

LAB7:
LAB6:    xsi_set_current_line(55, ng0);
    t1 = (t0 + 592U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB21;

LAB23:
LAB22:    goto LAB3;

LAB5:    xsi_set_current_line(47, ng0);
    t1 = (t0 + 684U);
    t8 = *((char **)t1);
    t9 = *((unsigned char *)t8);
    t10 = (t9 == (unsigned char)3);
    if (t10 != 0)
        goto LAB8;

LAB10:    t1 = (t0 + 1052U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB13;

LAB14:
LAB9:    goto LAB6;

LAB8:    xsi_set_current_line(48, ng0);
    t1 = xsi_get_transient_memory(1024U);
    memset(t1, 0, 1024U);
    t11 = t1;
    t12 = (32U * 1U);
    t13 = t11;
    memset(t13, (unsigned char)2, t12);
    t14 = (t12 != 0);
    if (t14 == 1)
        goto LAB11;

LAB12:    t16 = (t0 + 3380);
    t17 = (t16 + 32U);
    t18 = *((char **)t17);
    t19 = (t18 + 40U);
    t20 = *((char **)t19);
    memcpy(t20, t1, 1024U);
    xsi_driver_first_trans_fast(t16);
    goto LAB9;

LAB11:    t15 = (1024U / t12);
    xsi_mem_set_data(t11, t11, t12, t15);
    goto LAB12;

LAB13:    xsi_set_current_line(50, ng0);
    t1 = (t0 + 1788U);
    t5 = *((char **)t1);
    t7 = *((unsigned char *)t5);
    t9 = (t7 == (unsigned char)2);
    if (t9 == 1)
        goto LAB18;

LAB19:    t6 = (unsigned char)0;

LAB20:    if (t6 != 0)
        goto LAB15;

LAB17:
LAB16:    goto LAB9;

LAB15:    xsi_set_current_line(51, ng0);
    t1 = (t0 + 1420U);
    t11 = *((char **)t1);
    t1 = (t0 + 1144U);
    t13 = *((char **)t1);
    t1 = (t0 + 6612U);
    t21 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t13, t1);
    t22 = (t21 - 0);
    t12 = (t22 * 1);
    t15 = (32U * t12);
    t23 = (0U + t15);
    t16 = (t0 + 3380);
    t17 = (t16 + 32U);
    t18 = *((char **)t17);
    t19 = (t18 + 40U);
    t20 = *((char **)t19);
    memcpy(t20, t11, 32U);
    xsi_driver_first_trans_delta(t16, t23, 32U, 0LL);
    goto LAB16;

LAB18:    t1 = (t0 + 1880U);
    t8 = *((char **)t1);
    t10 = *((unsigned char *)t8);
    t14 = (t10 == (unsigned char)2);
    t6 = t14;
    goto LAB20;

LAB21:    xsi_set_current_line(60, ng0);
    t1 = (t0 + 1972U);
    t5 = *((char **)t1);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    if (t7 != 0)
        goto LAB24;

LAB26:
LAB25:    goto LAB22;

LAB24:    xsi_set_current_line(61, ng0);
    t1 = (t0 + 1420U);
    t8 = *((char **)t1);
    t1 = (t0 + 1144U);
    t11 = *((char **)t1);
    t1 = (t0 + 6612U);
    t21 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t11, t1);
    t22 = (t21 - 0);
    t12 = (t22 * 1);
    t15 = (32U * t12);
    t23 = (0U + t15);
    t13 = (t0 + 3380);
    t16 = (t13 + 32U);
    t17 = *((char **)t16);
    t18 = (t17 + 40U);
    t19 = *((char **)t18);
    memcpy(t19, t8, 32U);
    xsi_driver_first_trans_delta(t13, t23, 32U, 0LL);
    goto LAB25;

}

static void work_a_2924110608_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    unsigned char t5;
    char *t6;
    unsigned char t7;
    unsigned char t8;
    unsigned char t9;
    char *t10;
    char *t11;
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    char *t15;
    unsigned char t16;
    unsigned char t17;
    char *t18;
    unsigned char t19;
    unsigned char t20;
    char *t21;
    unsigned char t22;
    unsigned char t23;
    char *t24;
    char *t25;
    int t26;
    int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;

LAB0:    xsi_set_current_line(70, ng0);
    t1 = (t0 + 776U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 3328);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(71, ng0);
    t1 = (t0 + 592U);
    t6 = *((char **)t1);
    t7 = *((unsigned char *)t6);
    t8 = (t7 == (unsigned char)3);
    if (t8 == 1)
        goto LAB8;

LAB9:    t5 = (unsigned char)0;

LAB10:    if (t5 != 0)
        goto LAB5;

LAB7:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(72, ng0);
    t10 = (t0 + 684U);
    t11 = *((char **)t10);
    t12 = *((unsigned char *)t11);
    t13 = (t12 == (unsigned char)2);
    if (t13 != 0)
        goto LAB11;

LAB13:    xsi_set_current_line(95, ng0);
    t1 = xsi_get_transient_memory(32U);
    memset(t1, 0, 32U);
    t2 = t1;
    memset(t2, (unsigned char)2, 32U);
    t6 = (t0 + 3416);
    t10 = (t6 + 32U);
    t11 = *((char **)t10);
    t15 = (t11 + 40U);
    t18 = *((char **)t15);
    memcpy(t18, t1, 32U);
    xsi_driver_first_trans_fast_port(t6);
    xsi_set_current_line(96, ng0);
    t1 = xsi_get_transient_memory(32U);
    memset(t1, 0, 32U);
    t2 = t1;
    memset(t2, (unsigned char)2, 32U);
    t6 = (t0 + 3452);
    t10 = (t6 + 32U);
    t11 = *((char **)t10);
    t15 = (t11 + 40U);
    t18 = *((char **)t15);
    memcpy(t18, t1, 32U);
    xsi_driver_first_trans_fast_port(t6);
    xsi_set_current_line(97, ng0);
    t1 = (t0 + 3488);
    t2 = (t1 + 32U);
    t6 = *((char **)t2);
    t10 = (t6 + 40U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB12:    goto LAB6;

LAB8:    t1 = (t0 + 568U);
    t9 = xsi_signal_has_event(t1);
    t5 = t9;
    goto LAB10;

LAB11:    xsi_set_current_line(73, ng0);
    t10 = (t0 + 1788U);
    t15 = *((char **)t10);
    t16 = *((unsigned char *)t15);
    t17 = (t16 == (unsigned char)3);
    if (t17 == 1)
        goto LAB17;

LAB18:    t10 = (t0 + 1880U);
    t18 = *((char **)t10);
    t19 = *((unsigned char *)t18);
    t20 = (t19 == (unsigned char)3);
    t14 = t20;

LAB19:    if (t14 != 0)
        goto LAB14;

LAB16:    xsi_set_current_line(84, ng0);
    t1 = (t0 + 868U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB26;

LAB28:
LAB27:    xsi_set_current_line(88, ng0);
    t1 = (t0 + 960U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB29;

LAB31:
LAB30:    xsi_set_current_line(92, ng0);
    t1 = (t0 + 3488);
    t2 = (t1 + 32U);
    t6 = *((char **)t2);
    t10 = (t6 + 40U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB15:    goto LAB12;

LAB14:    xsi_set_current_line(74, ng0);
    t10 = (t0 + 868U);
    t21 = *((char **)t10);
    t22 = *((unsigned char *)t21);
    t23 = (t22 == (unsigned char)3);
    if (t23 != 0)
        goto LAB20;

LAB22:
LAB21:    xsi_set_current_line(78, ng0);
    t1 = (t0 + 960U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB23;

LAB25:
LAB24:    xsi_set_current_line(82, ng0);
    t1 = (t0 + 3488);
    t2 = (t1 + 32U);
    t6 = *((char **)t2);
    t10 = (t6 + 40U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB15;

LAB17:    t14 = (unsigned char)1;
    goto LAB19;

LAB20:    xsi_set_current_line(75, ng0);
    t10 = (t0 + 1696U);
    t24 = *((char **)t10);
    t10 = (t0 + 1236U);
    t25 = *((char **)t10);
    t10 = (t0 + 6628U);
    t26 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t25, t10);
    t27 = (t26 - 0);
    t28 = (t27 * 1);
    xsi_vhdl_check_range_of_index(0, 31, 1, t26);
    t29 = (32U * t28);
    t30 = (0 + t29);
    t31 = (t24 + t30);
    t32 = (t0 + 3416);
    t33 = (t32 + 32U);
    t34 = *((char **)t33);
    t35 = (t34 + 40U);
    t36 = *((char **)t35);
    memcpy(t36, t31, 32U);
    xsi_driver_first_trans_fast_port(t32);
    goto LAB21;

LAB23:    xsi_set_current_line(79, ng0);
    t1 = (t0 + 1696U);
    t6 = *((char **)t1);
    t1 = (t0 + 1328U);
    t10 = *((char **)t1);
    t1 = (t0 + 6644U);
    t26 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t10, t1);
    t27 = (t26 - 0);
    t28 = (t27 * 1);
    xsi_vhdl_check_range_of_index(0, 31, 1, t26);
    t29 = (32U * t28);
    t30 = (0 + t29);
    t11 = (t6 + t30);
    t15 = (t0 + 3452);
    t18 = (t15 + 32U);
    t21 = *((char **)t18);
    t24 = (t21 + 40U);
    t25 = *((char **)t24);
    memcpy(t25, t11, 32U);
    xsi_driver_first_trans_fast_port(t15);
    goto LAB24;

LAB26:    xsi_set_current_line(85, ng0);
    t1 = (t0 + 1696U);
    t6 = *((char **)t1);
    t1 = (t0 + 1236U);
    t10 = *((char **)t1);
    t1 = (t0 + 6628U);
    t26 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t10, t1);
    t27 = (t26 - 0);
    t28 = (t27 * 1);
    xsi_vhdl_check_range_of_index(0, 31, 1, t26);
    t29 = (32U * t28);
    t30 = (0 + t29);
    t11 = (t6 + t30);
    t15 = (t0 + 3416);
    t18 = (t15 + 32U);
    t21 = *((char **)t18);
    t24 = (t21 + 40U);
    t25 = *((char **)t24);
    memcpy(t25, t11, 32U);
    xsi_driver_first_trans_fast_port(t15);
    goto LAB27;

LAB29:    xsi_set_current_line(89, ng0);
    t1 = (t0 + 1696U);
    t6 = *((char **)t1);
    t1 = (t0 + 1328U);
    t10 = *((char **)t1);
    t1 = (t0 + 6644U);
    t26 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t10, t1);
    t27 = (t26 - 0);
    t28 = (t27 * 1);
    xsi_vhdl_check_range_of_index(0, 31, 1, t26);
    t29 = (32U * t28);
    t30 = (0 + t29);
    t11 = (t6 + t30);
    t15 = (t0 + 3452);
    t18 = (t15 + 32U);
    t21 = *((char **)t18);
    t24 = (t21 + 40U);
    t25 = *((char **)t24);
    memcpy(t25, t11, 32U);
    xsi_driver_first_trans_fast_port(t15);
    goto LAB30;

}

static void work_a_2924110608_3212880686_p_2(char *t0)
{
    unsigned char t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    unsigned char t8;
    unsigned char t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned char t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    xsi_set_current_line(125, ng0);
    t3 = (t0 + 868U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 == 1)
        goto LAB8;

LAB9:    t2 = (unsigned char)0;

LAB10:    if (t2 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(128, ng0);
    t3 = (t0 + 3524);
    t4 = (t3 + 32U);
    t7 = *((char **)t4);
    t10 = (t7 + 40U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast(t3);

LAB3:    xsi_set_current_line(131, ng0);
    t3 = (t0 + 960U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 == 1)
        goto LAB17;

LAB18:    t2 = (unsigned char)0;

LAB19:    if (t2 == 1)
        goto LAB14;

LAB15:    t1 = (unsigned char)0;

LAB16:    if (t1 != 0)
        goto LAB11;

LAB13:    xsi_set_current_line(134, ng0);
    t3 = (t0 + 3560);
    t4 = (t3 + 32U);
    t7 = *((char **)t4);
    t10 = (t7 + 40U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast(t3);

LAB12:    t3 = (t0 + 3336);
    *((int *)t3) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(126, ng0);
    t14 = (t0 + 3524);
    t15 = (t14 + 32U);
    t16 = *((char **)t15);
    t17 = (t16 + 40U);
    t18 = *((char **)t17);
    *((unsigned char *)t18) = (unsigned char)3;
    xsi_driver_first_trans_fast(t14);
    goto LAB3;

LAB5:    t3 = (t0 + 1236U);
    t10 = *((char **)t3);
    t3 = (t0 + 6628U);
    t11 = (t0 + 1144U);
    t12 = *((char **)t11);
    t11 = (t0 + 6612U);
    t13 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t10, t3, t12, t11);
    t1 = t13;
    goto LAB7;

LAB8:    t3 = (t0 + 1052U);
    t7 = *((char **)t3);
    t8 = *((unsigned char *)t7);
    t9 = (t8 == (unsigned char)3);
    t2 = t9;
    goto LAB10;

LAB11:    xsi_set_current_line(132, ng0);
    t14 = (t0 + 3560);
    t15 = (t14 + 32U);
    t16 = *((char **)t15);
    t17 = (t16 + 40U);
    t18 = *((char **)t17);
    *((unsigned char *)t18) = (unsigned char)3;
    xsi_driver_first_trans_fast(t14);
    goto LAB12;

LAB14:    t3 = (t0 + 1328U);
    t10 = *((char **)t3);
    t3 = (t0 + 6644U);
    t11 = (t0 + 1144U);
    t12 = *((char **)t11);
    t11 = (t0 + 6612U);
    t13 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t10, t3, t12, t11);
    t1 = t13;
    goto LAB16;

LAB17:    t3 = (t0 + 1052U);
    t7 = *((char **)t3);
    t8 = *((unsigned char *)t7);
    t9 = (t8 == (unsigned char)3);
    t2 = t9;
    goto LAB19;

}


extern void work_a_2924110608_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2924110608_3212880686_p_0,(void *)work_a_2924110608_3212880686_p_1,(void *)work_a_2924110608_3212880686_p_2};
	xsi_register_didat("work_a_2924110608_3212880686", "isim/TB_Datapath_isim_beh.exe.sim/work/a_2924110608_3212880686.didat");
	xsi_register_executes(pe);
}
