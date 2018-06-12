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
static const char *ng0 = "C:/Users/Alessandro/Documents/GitHub/MyDLX/FCU/FCU.vhd";
extern char *IEEE_P_2592010699;



static void work_a_3918584861_3212880686_p_0(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned int t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    xsi_set_current_line(97, ng0);
    t2 = (t0 + 868U);
    t3 = *((char **)t2);
    t2 = (t0 + 2420U);
    t4 = *((char **)t2);
    t5 = 1;
    if (6U == 6U)
        goto LAB8;

LAB9:    t5 = 0;

LAB10:    if (t5 == 1)
        goto LAB5;

LAB6:    t8 = (t0 + 868U);
    t9 = *((char **)t8);
    t8 = (t0 + 2488U);
    t10 = *((char **)t8);
    t11 = 1;
    if (6U == 6U)
        goto LAB14;

LAB15:    t11 = 0;

LAB16:    t1 = t11;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(100, ng0);
    t2 = (t0 + 4388);
    t3 = (t2 + 32U);
    t4 = *((char **)t3);
    t7 = (t4 + 40U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);

LAB3:    t2 = (t0 + 4336);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(98, ng0);
    t14 = (t0 + 4388);
    t15 = (t14 + 32U);
    t16 = *((char **)t15);
    t17 = (t16 + 40U);
    t18 = *((char **)t17);
    *((unsigned char *)t18) = (unsigned char)3;
    xsi_driver_first_trans_fast(t14);
    goto LAB3;

LAB5:    t1 = (unsigned char)1;
    goto LAB7;

LAB8:    t6 = 0;

LAB11:    if (t6 < 6U)
        goto LAB12;
    else
        goto LAB10;

LAB12:    t2 = (t3 + t6);
    t7 = (t4 + t6);
    if (*((unsigned char *)t2) != *((unsigned char *)t7))
        goto LAB9;

LAB13:    t6 = (t6 + 1);
    goto LAB11;

LAB14:    t12 = 0;

LAB17:    if (t12 < 6U)
        goto LAB18;
    else
        goto LAB16;

LAB18:    t8 = (t9 + t12);
    t13 = (t10 + t12);
    if (*((unsigned char *)t8) != *((unsigned char *)t13))
        goto LAB15;

LAB19:    t12 = (t12 + 1);
    goto LAB17;

}

static void work_a_3918584861_3212880686_p_1(char *t0)
{
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
    unsigned char t13;
    unsigned char t14;
    char *t15;
    char *t16;
    char *t17;
    unsigned char t18;
    unsigned int t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    unsigned char t24;
    unsigned int t25;
    char *t26;
    char *t27;
    char *t28;
    unsigned char t29;
    unsigned char t30;
    char *t31;
    char *t32;
    unsigned char t33;
    unsigned int t34;
    char *t35;
    char *t36;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;

LAB0:    xsi_set_current_line(110, ng0);
    t1 = (t0 + 8486);
    t3 = (t0 + 4424);
    t4 = (t3 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 2U);
    xsi_driver_first_trans_fast_port(t3);
    xsi_set_current_line(111, ng0);
    t1 = (t0 + 592U);
    t2 = *((char **)t1);
    t8 = *((unsigned char *)t2);
    t9 = (t8 == (unsigned char)3);
    if (t9 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 4344);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(112, ng0);
    t1 = (t0 + 684U);
    t3 = *((char **)t1);
    t1 = (t0 + 2964U);
    t4 = *((char **)t1);
    t1 = ((IEEE_P_2592010699) + 2332);
    t13 = xsi_vhdl_greaterEqual(t1, t3, 6U, t4, 6U);
    if (t13 == 1)
        goto LAB14;

LAB15:    t12 = (unsigned char)0;

LAB16:    if (t12 == 1)
        goto LAB11;

LAB12:    t15 = (t0 + 684U);
    t16 = *((char **)t15);
    t15 = (t0 + 3100U);
    t17 = *((char **)t15);
    t18 = 1;
    if (6U == 6U)
        goto LAB17;

LAB18:    t18 = 0;

LAB19:    t11 = t18;

LAB13:    if (t11 == 1)
        goto LAB8;

LAB9:    t21 = (t0 + 684U);
    t22 = *((char **)t21);
    t21 = (t0 + 3168U);
    t23 = *((char **)t21);
    t24 = 1;
    if (6U == 6U)
        goto LAB23;

LAB24:    t24 = 0;

LAB25:    t10 = t24;

LAB10:    if (t10 != 0)
        goto LAB5;

LAB7:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(115, ng0);
    t27 = (t0 + 2248U);
    t28 = *((char **)t27);
    t29 = *((unsigned char *)t28);
    t30 = (t29 == (unsigned char)3);
    if (t30 != 0)
        goto LAB29;

LAB31:
LAB30:    xsi_set_current_line(121, ng0);
    t1 = (t0 + 960U);
    t2 = *((char **)t1);
    t1 = (t0 + 3304U);
    t3 = *((char **)t1);
    t9 = 1;
    if (6U == 6U)
        goto LAB47;

LAB48:    t9 = 0;

LAB49:    if (t9 == 1)
        goto LAB44;

LAB45:    t5 = (t0 + 960U);
    t6 = *((char **)t5);
    t5 = (t0 + 3236U);
    t7 = *((char **)t5);
    t10 = 1;
    if (6U == 6U)
        goto LAB53;

LAB54:    t10 = 0;

LAB55:    t8 = t10;

LAB46:    if (t8 != 0)
        goto LAB41;

LAB43:
LAB42:    goto LAB6;

LAB8:    t10 = (unsigned char)1;
    goto LAB10;

LAB11:    t11 = (unsigned char)1;
    goto LAB13;

LAB14:    t5 = (t0 + 684U);
    t6 = *((char **)t5);
    t5 = (t0 + 3032U);
    t7 = *((char **)t5);
    t5 = ((IEEE_P_2592010699) + 2332);
    t14 = xsi_vhdl_lessthanEqual(t5, t6, 6U, t7, 6U);
    t12 = t14;
    goto LAB16;

LAB17:    t19 = 0;

LAB20:    if (t19 < 6U)
        goto LAB21;
    else
        goto LAB19;

LAB21:    t15 = (t16 + t19);
    t20 = (t17 + t19);
    if (*((unsigned char *)t15) != *((unsigned char *)t20))
        goto LAB18;

LAB22:    t19 = (t19 + 1);
    goto LAB20;

LAB23:    t25 = 0;

LAB26:    if (t25 < 6U)
        goto LAB27;
    else
        goto LAB25;

LAB27:    t21 = (t22 + t25);
    t26 = (t23 + t25);
    if (*((unsigned char *)t21) != *((unsigned char *)t26))
        goto LAB24;

LAB28:    t25 = (t25 + 1);
    goto LAB26;

LAB29:    xsi_set_current_line(117, ng0);
    t27 = (t0 + 1512U);
    t31 = *((char **)t27);
    t27 = (t0 + 1052U);
    t32 = *((char **)t27);
    t33 = 1;
    if (5U == 5U)
        goto LAB35;

LAB36:    t33 = 0;

LAB37:    if (t33 != 0)
        goto LAB32;

LAB34:
LAB33:    goto LAB30;

LAB32:    xsi_set_current_line(118, ng0);
    t36 = (t0 + 8488);
    t38 = (t0 + 4424);
    t39 = (t38 + 32U);
    t40 = *((char **)t39);
    t41 = (t40 + 40U);
    t42 = *((char **)t41);
    memcpy(t42, t36, 2U);
    xsi_driver_first_trans_fast_port(t38);
    goto LAB33;

LAB35:    t34 = 0;

LAB38:    if (t34 < 5U)
        goto LAB39;
    else
        goto LAB37;

LAB39:    t27 = (t31 + t34);
    t35 = (t32 + t34);
    if (*((unsigned char *)t27) != *((unsigned char *)t35))
        goto LAB36;

LAB40:    t34 = (t34 + 1);
    goto LAB38;

LAB41:    xsi_set_current_line(123, ng0);
    t16 = (t0 + 1604U);
    t17 = *((char **)t16);
    t16 = (t0 + 1052U);
    t20 = *((char **)t16);
    t11 = 1;
    if (5U == 5U)
        goto LAB62;

LAB63:    t11 = 0;

LAB64:    if (t11 != 0)
        goto LAB59;

LAB61:
LAB60:    goto LAB42;

LAB44:    t8 = (unsigned char)1;
    goto LAB46;

LAB47:    t19 = 0;

LAB50:    if (t19 < 6U)
        goto LAB51;
    else
        goto LAB49;

LAB51:    t1 = (t2 + t19);
    t4 = (t3 + t19);
    if (*((unsigned char *)t1) != *((unsigned char *)t4))
        goto LAB48;

LAB52:    t19 = (t19 + 1);
    goto LAB50;

LAB53:    t25 = 0;

LAB56:    if (t25 < 6U)
        goto LAB57;
    else
        goto LAB55;

LAB57:    t5 = (t6 + t25);
    t15 = (t7 + t25);
    if (*((unsigned char *)t5) != *((unsigned char *)t15))
        goto LAB54;

LAB58:    t25 = (t25 + 1);
    goto LAB56;

LAB59:    xsi_set_current_line(124, ng0);
    t22 = (t0 + 8490);
    t26 = (t0 + 4424);
    t27 = (t26 + 32U);
    t28 = *((char **)t27);
    t31 = (t28 + 40U);
    t32 = *((char **)t31);
    memcpy(t32, t22, 2U);
    xsi_driver_first_trans_fast_port(t26);
    goto LAB60;

LAB62:    t34 = 0;

LAB65:    if (t34 < 5U)
        goto LAB66;
    else
        goto LAB64;

LAB66:    t16 = (t17 + t34);
    t21 = (t20 + t34);
    if (*((unsigned char *)t16) != *((unsigned char *)t21))
        goto LAB63;

LAB67:    t34 = (t34 + 1);
    goto LAB65;

}


extern void work_a_3918584861_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3918584861_3212880686_p_0,(void *)work_a_3918584861_3212880686_p_1};
	xsi_register_didat("work_a_3918584861_3212880686", "isim/TB_FCU_isim_beh.exe.sim/work/a_3918584861_3212880686.didat");
	xsi_register_executes(pe);
}
