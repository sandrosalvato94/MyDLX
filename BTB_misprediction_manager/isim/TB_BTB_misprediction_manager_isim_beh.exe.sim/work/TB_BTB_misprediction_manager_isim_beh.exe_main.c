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
char *IEEE_P_1242562249;
char *WORK_P_3647430093;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    work_p_3647430093_init();
    work_a_2010076020_3212880686_init();
    work_a_1622427447_3212880686_init();
    work_a_2238716949_2712257714_init();
    work_a_1097973800_3212880686_init();
    work_a_2984372892_3212880686_init();
    work_a_1820635504_3212880686_init();
    work_a_4198489089_1181938964_init();
    work_a_4109842091_3212880686_init();
    work_a_1947288536_3212880686_init();
    work_a_3604777672_3212880686_init();
    work_a_3734057397_3212880686_init();
    work_a_2074538848_1181938964_init();
    work_a_2176950510_2372691052_init();


    xsi_register_tops("work_a_2176950510_2372691052");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    WORK_P_3647430093 = xsi_get_engine_memory("work_p_3647430093");

    return xsi_run_simulation(argc, argv);

}
