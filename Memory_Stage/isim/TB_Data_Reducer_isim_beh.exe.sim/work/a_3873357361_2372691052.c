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
static const char *ng0 = "C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/Memory_Stage/TB_Data_Reducer.vhd";
extern char *IEEE_P_2592010699;



static void work_a_3873357361_2372691052_p_0(char *t0)
{
    char t8[16];
    char t10[16];
    char t15[16];
    char t20[16];
    char t22[16];
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
    char *t19;
    char *t21;
    char *t23;
    char *t24;
    int t25;
    unsigned int t26;
    unsigned char t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;

LAB0:    t1 = (t0 + 1596U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(84, ng0);
    t3 = (1 * 1000LL);
    t2 = (t0 + 1496);
    xsi_process_wait(t2, t3);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(87, ng0);
    t2 = (t0 + 4306);
    t5 = (t0 + 4322);
    t9 = ((IEEE_P_2592010699) + 2332);
    t11 = (t10 + 0U);
    t12 = (t11 + 0U);
    *((int *)t12) = 0;
    t12 = (t11 + 4U);
    *((int *)t12) = 15;
    t12 = (t11 + 8U);
    *((int *)t12) = 1;
    t13 = (15 - 0);
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
    t16 = (t0 + 4330);
    t21 = ((IEEE_P_2592010699) + 2332);
    t23 = (t22 + 0U);
    t24 = (t23 + 0U);
    *((int *)t24) = 0;
    t24 = (t23 + 4U);
    *((int *)t24) = 7;
    t24 = (t23 + 8U);
    *((int *)t24) = 1;
    t25 = (7 - 0);
    t14 = (t25 * 1);
    t14 = (t14 + 1);
    t24 = (t23 + 12U);
    *((unsigned int *)t24) = t14;
    t19 = xsi_base_array_concat(t19, t20, t21, (char)97, t7, t8, (char)97, t16, t22, (char)101);
    t14 = (16U + 8U);
    t26 = (t14 + 8U);
    t27 = (32U != t26);
    if (t27 == 1)
        goto LAB8;

LAB9:    t24 = (t0 + 1828);
    t28 = (t24 + 32U);
    t29 = *((char **)t28);
    t30 = (t29 + 40U);
    t31 = *((char **)t30);
    memcpy(t31, t19, 32U);
    xsi_driver_first_trans_fast(t24);
    xsi_set_current_line(88, ng0);
    t2 = (t0 + 1864);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(89, ng0);
    t2 = (t0 + 1900);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(90, ng0);
    t3 = (1 * 1000LL);
    t2 = (t0 + 1496);
    xsi_process_wait(t2, t3);

LAB12:    *((char **)t1) = &&LAB13;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_size_not_matching(32U, t26, 0);
    goto LAB9;

LAB10:    xsi_set_current_line(91, ng0);
    t2 = (t0 + 592U);
    t4 = *((char **)t2);
    t2 = (t0 + 868U);
    t5 = *((char **)t2);
    t27 = 1;
    if (32U == 32U)
        goto LAB16;

LAB17:    t27 = 0;

LAB18:    if (t27 == 0)
        goto LAB14;

LAB15:    xsi_set_current_line(92, ng0);
    t3 = (1 * 1000LL);
    t2 = (t0 + 1496);
    xsi_process_wait(t2, t3);

LAB24:    *((char **)t1) = &&LAB25;
    goto LAB1;

LAB11:    goto LAB10;

LAB13:    goto LAB11;

LAB14:    t7 = (t0 + 4338);
    xsi_report(t7, 41U, 2);
    goto LAB15;

LAB16:    t14 = 0;

LAB19:    if (t14 < 32U)
        goto LAB20;
    else
        goto LAB18;

LAB20:    t2 = (t4 + t14);
    t6 = (t5 + t14);
    if (*((unsigned char *)t2) != *((unsigned char *)t6))
        goto LAB17;

LAB21:    t14 = (t14 + 1);
    goto LAB19;

LAB22:    xsi_set_current_line(94, ng0);
    t2 = (t0 + 4379);
    t5 = (t0 + 4395);
    t9 = ((IEEE_P_2592010699) + 2332);
    t11 = (t10 + 0U);
    t12 = (t11 + 0U);
    *((int *)t12) = 0;
    t12 = (t11 + 4U);
    *((int *)t12) = 15;
    t12 = (t11 + 8U);
    *((int *)t12) = 1;
    t13 = (15 - 0);
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
    t16 = (t0 + 4403);
    t21 = ((IEEE_P_2592010699) + 2332);
    t23 = (t22 + 0U);
    t24 = (t23 + 0U);
    *((int *)t24) = 0;
    t24 = (t23 + 4U);
    *((int *)t24) = 7;
    t24 = (t23 + 8U);
    *((int *)t24) = 1;
    t25 = (7 - 0);
    t14 = (t25 * 1);
    t14 = (t14 + 1);
    t24 = (t23 + 12U);
    *((unsigned int *)t24) = t14;
    t19 = xsi_base_array_concat(t19, t20, t21, (char)97, t7, t8, (char)97, t16, t22, (char)101);
    t14 = (16U + 8U);
    t26 = (t14 + 8U);
    t27 = (32U != t26);
    if (t27 == 1)
        goto LAB26;

LAB27:    t24 = (t0 + 1828);
    t28 = (t24 + 32U);
    t29 = *((char **)t28);
    t30 = (t29 + 40U);
    t31 = *((char **)t30);
    memcpy(t31, t19, 32U);
    xsi_driver_first_trans_fast(t24);
    xsi_set_current_line(95, ng0);
    t2 = (t0 + 1864);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(96, ng0);
    t2 = (t0 + 1900);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(97, ng0);
    t3 = (1 * 1000LL);
    t2 = (t0 + 1496);
    xsi_process_wait(t2, t3);

LAB30:    *((char **)t1) = &&LAB31;
    goto LAB1;

LAB23:    goto LAB22;

LAB25:    goto LAB23;

LAB26:    xsi_size_not_matching(32U, t26, 0);
    goto LAB27;

LAB28:    xsi_set_current_line(98, ng0);
    t2 = (t0 + 592U);
    t4 = *((char **)t2);
    t2 = (t0 + 868U);
    t5 = *((char **)t2);
    t27 = 1;
    if (32U == 32U)
        goto LAB34;

LAB35:    t27 = 0;

LAB36:    if (t27 == 0)
        goto LAB32;

LAB33:    xsi_set_current_line(99, ng0);
    t3 = (1 * 1000LL);
    t2 = (t0 + 1496);
    xsi_process_wait(t2, t3);

LAB42:    *((char **)t1) = &&LAB43;
    goto LAB1;

LAB29:    goto LAB28;

LAB31:    goto LAB29;

LAB32:    t7 = (t0 + 4411);
    xsi_report(t7, 41U, 2);
    goto LAB33;

LAB34:    t14 = 0;

LAB37:    if (t14 < 32U)
        goto LAB38;
    else
        goto LAB36;

LAB38:    t2 = (t4 + t14);
    t6 = (t5 + t14);
    if (*((unsigned char *)t2) != *((unsigned char *)t6))
        goto LAB35;

LAB39:    t14 = (t14 + 1);
    goto LAB37;

LAB40:    xsi_set_current_line(103, ng0);
    t2 = (t0 + 4452);
    t5 = (t0 + 4468);
    t9 = ((IEEE_P_2592010699) + 2332);
    t11 = (t10 + 0U);
    t12 = (t11 + 0U);
    *((int *)t12) = 0;
    t12 = (t11 + 4U);
    *((int *)t12) = 15;
    t12 = (t11 + 8U);
    *((int *)t12) = 1;
    t13 = (15 - 0);
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
    t16 = (t0 + 4476);
    t21 = ((IEEE_P_2592010699) + 2332);
    t23 = (t22 + 0U);
    t24 = (t23 + 0U);
    *((int *)t24) = 0;
    t24 = (t23 + 4U);
    *((int *)t24) = 7;
    t24 = (t23 + 8U);
    *((int *)t24) = 1;
    t25 = (7 - 0);
    t14 = (t25 * 1);
    t14 = (t14 + 1);
    t24 = (t23 + 12U);
    *((unsigned int *)t24) = t14;
    t19 = xsi_base_array_concat(t19, t20, t21, (char)97, t7, t8, (char)97, t16, t22, (char)101);
    t14 = (16U + 8U);
    t26 = (t14 + 8U);
    t27 = (32U != t26);
    if (t27 == 1)
        goto LAB44;

LAB45:    t24 = (t0 + 1828);
    t28 = (t24 + 32U);
    t29 = *((char **)t28);
    t30 = (t29 + 40U);
    t31 = *((char **)t30);
    memcpy(t31, t19, 32U);
    xsi_driver_first_trans_fast(t24);
    xsi_set_current_line(104, ng0);
    t2 = (t0 + 1864);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(105, ng0);
    t2 = (t0 + 1900);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(106, ng0);
    t3 = (1 * 1000LL);
    t2 = (t0 + 1496);
    xsi_process_wait(t2, t3);

LAB48:    *((char **)t1) = &&LAB49;
    goto LAB1;

LAB41:    goto LAB40;

LAB43:    goto LAB41;

LAB44:    xsi_size_not_matching(32U, t26, 0);
    goto LAB45;

LAB46:    xsi_set_current_line(107, ng0);
    t2 = (t0 + 868U);
    t4 = *((char **)t2);
    t2 = (t0 + 4484);
    t27 = 1;
    if (32U == 32U)
        goto LAB52;

LAB53:    t27 = 0;

LAB54:    if (t27 == 0)
        goto LAB50;

LAB51:    xsi_set_current_line(108, ng0);
    t3 = (1 * 1000LL);
    t2 = (t0 + 1496);
    xsi_process_wait(t2, t3);

LAB60:    *((char **)t1) = &&LAB61;
    goto LAB1;

LAB47:    goto LAB46;

LAB49:    goto LAB47;

LAB50:    t9 = (t0 + 4516);
    xsi_report(t9, 34U, 2);
    goto LAB51;

LAB52:    t14 = 0;

LAB55:    if (t14 < 32U)
        goto LAB56;
    else
        goto LAB54;

LAB56:    t6 = (t4 + t14);
    t7 = (t2 + t14);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB53;

LAB57:    t14 = (t14 + 1);
    goto LAB55;

LAB58:    xsi_set_current_line(112, ng0);
    t2 = (t0 + 4550);
    t5 = (t0 + 4566);
    t9 = ((IEEE_P_2592010699) + 2332);
    t11 = (t10 + 0U);
    t12 = (t11 + 0U);
    *((int *)t12) = 0;
    t12 = (t11 + 4U);
    *((int *)t12) = 15;
    t12 = (t11 + 8U);
    *((int *)t12) = 1;
    t13 = (15 - 0);
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
    t16 = (t0 + 4574);
    t21 = ((IEEE_P_2592010699) + 2332);
    t23 = (t22 + 0U);
    t24 = (t23 + 0U);
    *((int *)t24) = 0;
    t24 = (t23 + 4U);
    *((int *)t24) = 7;
    t24 = (t23 + 8U);
    *((int *)t24) = 1;
    t25 = (7 - 0);
    t14 = (t25 * 1);
    t14 = (t14 + 1);
    t24 = (t23 + 12U);
    *((unsigned int *)t24) = t14;
    t19 = xsi_base_array_concat(t19, t20, t21, (char)97, t7, t8, (char)97, t16, t22, (char)101);
    t14 = (16U + 8U);
    t26 = (t14 + 8U);
    t27 = (32U != t26);
    if (t27 == 1)
        goto LAB62;

LAB63:    t24 = (t0 + 1828);
    t28 = (t24 + 32U);
    t29 = *((char **)t28);
    t30 = (t29 + 40U);
    t31 = *((char **)t30);
    memcpy(t31, t19, 32U);
    xsi_driver_first_trans_fast(t24);
    xsi_set_current_line(113, ng0);
    t2 = (t0 + 1864);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(114, ng0);
    t2 = (t0 + 1900);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(115, ng0);
    t3 = (1 * 1000LL);
    t2 = (t0 + 1496);
    xsi_process_wait(t2, t3);

LAB66:    *((char **)t1) = &&LAB67;
    goto LAB1;

LAB59:    goto LAB58;

LAB61:    goto LAB59;

LAB62:    xsi_size_not_matching(32U, t26, 0);
    goto LAB63;

LAB64:    xsi_set_current_line(116, ng0);
    t2 = (t0 + 868U);
    t4 = *((char **)t2);
    t2 = (t0 + 4582);
    t27 = 1;
    if (32U == 32U)
        goto LAB70;

LAB71:    t27 = 0;

LAB72:    if (t27 == 0)
        goto LAB68;

LAB69:    xsi_set_current_line(117, ng0);
    t3 = (1 * 1000LL);
    t2 = (t0 + 1496);
    xsi_process_wait(t2, t3);

LAB78:    *((char **)t1) = &&LAB79;
    goto LAB1;

LAB65:    goto LAB64;

LAB67:    goto LAB65;

LAB68:    t9 = (t0 + 4614);
    xsi_report(t9, 34U, 2);
    goto LAB69;

LAB70:    t14 = 0;

LAB73:    if (t14 < 32U)
        goto LAB74;
    else
        goto LAB72;

LAB74:    t6 = (t4 + t14);
    t7 = (t2 + t14);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB71;

LAB75:    t14 = (t14 + 1);
    goto LAB73;

LAB76:    xsi_set_current_line(123, ng0);

LAB82:    *((char **)t1) = &&LAB83;
    goto LAB1;

LAB77:    goto LAB76;

LAB79:    goto LAB77;

LAB80:    goto LAB2;

LAB81:    goto LAB80;

LAB83:    goto LAB81;

}


extern void work_a_3873357361_2372691052_init()
{
	static char *pe[] = {(void *)work_a_3873357361_2372691052_p_0};
	xsi_register_didat("work_a_3873357361_2372691052", "isim/TB_Data_Reducer_isim_beh.exe.sim/work/a_3873357361_2372691052.didat");
	xsi_register_executes(pe);
}
