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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *IEEE_P_3620187407;
char *IEEE_P_3499444699;
char *WORK_P_3647430093;
char *IEEE_P_3972351953;
char *IEEE_P_1242562249;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    work_p_3647430093_init();
    ieee_p_1242562249_init();
    work_a_1338418084_3212880686_init();
    work_a_3703560880_3212880686_init();
    work_a_2078075551_3212880686_init();
    work_a_3505010001_3212880686_init();
    work_a_0039690659_1181938964_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    ieee_p_3972351953_init();
    work_a_4204905405_3212880686_init();
    work_a_1758065307_3212880686_init();
    work_a_3034253397_3212880686_init();
    work_a_0946993026_3212880686_init();
    work_a_3717842476_3212880686_init();
    work_a_1928810450_3212880686_init();
    work_a_3909502000_1181938964_init();
    work_a_1367549779_3212880686_init();
    work_a_3524064664_1181938964_init();
    work_a_2571779848_1181938964_init();
    work_a_3327541287_1181938964_init();
    work_a_1965221906_3212880686_init();
    work_a_2982189144_1181938964_init();
    work_a_1344535767_3212880686_init();
    work_a_3734057397_3212880686_init();
    work_a_0883098610_1181938964_init();
    work_a_1729280472_1181938964_init();
    work_a_1628648614_3212880686_init();
    work_a_0486375513_3212880686_init();
    work_a_4019674778_1181938964_init();
    work_a_3804253598_1181938964_init();
    work_a_1537870504_3212880686_init();
    work_a_0998292212_3212880686_init();
    work_a_0861415847_3212880686_init();
    work_a_3486197611_1181938964_init();
    work_a_4005098931_2372691052_init();


    xsi_register_tops("work_a_4005098931_2372691052");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    WORK_P_3647430093 = xsi_get_engine_memory("work_p_3647430093");
    IEEE_P_3972351953 = xsi_get_engine_memory("ieee_p_3972351953");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");

    return xsi_run_simulation(argc, argv);

}