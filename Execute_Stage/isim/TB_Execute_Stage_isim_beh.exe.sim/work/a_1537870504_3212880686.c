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
static const char *ng0 = "C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/Execute_Stage/Multiplier.vhd";
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_2053728113_1035706684(char *, char *, char *, char *, char *, char *);
char *ieee_p_1242562249_sub_2807594338_1035706684(char *, char *, char *, char *, char *, char *);


static void work_a_1537870504_3212880686_p_0(char *t0)
{
    char t5[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(60, ng0);
    t1 = (t0 + 776U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:
LAB3:    xsi_set_current_line(64, ng0);
    t1 = (t0 + 776U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB5;

LAB7:
LAB6:    t1 = (t0 + 1884);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(61, ng0);
    t1 = (t0 + 592U);
    t6 = *((char **)t1);
    t1 = (t0 + 4024U);
    t7 = (t0 + 684U);
    t8 = *((char **)t7);
    t7 = (t0 + 4040U);
    t9 = ieee_p_1242562249_sub_2807594338_1035706684(IEEE_P_1242562249, t5, t6, t1, t8, t7);
    t10 = (t0 + 1928);
    t11 = (t10 + 32U);
    t12 = *((char **)t11);
    t13 = (t12 + 40U);
    t14 = *((char **)t13);
    memcpy(t14, t9, 16U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB3;

LAB5:    xsi_set_current_line(65, ng0);
    t1 = (t0 + 592U);
    t6 = *((char **)t1);
    t1 = (t0 + 4024U);
    t7 = (t0 + 684U);
    t8 = *((char **)t7);
    t7 = (t0 + 4040U);
    t9 = ieee_p_1242562249_sub_2053728113_1035706684(IEEE_P_1242562249, t5, t6, t1, t8, t7);
    t10 = (t0 + 1928);
    t11 = (t10 + 32U);
    t12 = *((char **)t11);
    t13 = (t12 + 40U);
    t14 = *((char **)t13);
    memcpy(t14, t9, 16U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB6;

}


extern void work_a_1537870504_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1537870504_3212880686_p_0};
	xsi_register_didat("work_a_1537870504_3212880686", "isim/TB_Execute_Stage_isim_beh.exe.sim/work/a_1537870504_3212880686.didat");
	xsi_register_executes(pe);
}
