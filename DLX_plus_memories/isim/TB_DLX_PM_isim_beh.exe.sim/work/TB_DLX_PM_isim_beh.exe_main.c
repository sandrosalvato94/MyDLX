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
char *STD_TEXTIO;
char *IEEE_P_3564397177;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    std_textio_init();
    ieee_p_3564397177_init();
    work_p_3647430093_init();
    work_a_4109842091_3212880686_init();
    work_a_3604777672_3212880686_init();
    work_a_4204905405_3212880686_init();
    work_a_1758065307_3212880686_init();
    work_a_2225044523_3212880686_init();
    work_a_2816852233_3212880686_init();
    work_a_0529144519_3212880686_init();
    work_a_3498768353_3212880686_init();
    work_a_3843924458_1181938964_init();
    work_a_1947288536_3212880686_init();
    work_a_3563538915_3212880686_init();
    work_a_0861415847_3212880686_init();
    work_a_3295581965_3212880686_init();
    work_a_1193160951_3212880686_init();
    work_a_2287144457_1181938964_init();
    work_a_2136053293_3212880686_init();
    work_a_3592550330_3212880686_init();
    work_a_3471347560_3212880686_init();
    work_a_2443037535_3212880686_init();
    work_a_2725826503_3212880686_init();
    work_a_2688850460_3212880686_init();
    work_a_2618441636_1181938964_init();
    work_a_0527128558_3212880686_init();
    work_a_3703560880_3212880686_init();
    work_a_1217357343_3212880686_init();
    work_a_3505010001_3212880686_init();
    work_a_0114351377_1181938964_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    ieee_p_3972351953_init();
    work_a_0946993026_3212880686_init();
    work_a_0601749698_3212880686_init();
    work_a_1928810450_3212880686_init();
    work_a_3909502000_1181938964_init();
    work_a_1367549779_3212880686_init();
    work_a_3524064664_1181938964_init();
    work_a_2571779848_1181938964_init();
    work_a_1996449132_1181938964_init();
    work_a_3653095897_3212880686_init();
    work_a_4197128966_1181938964_init();
    work_a_2278385363_3212880686_init();
    work_a_3734057397_3212880686_init();
    work_a_3433902699_1181938964_init();
    work_a_1190182627_1181938964_init();
    work_a_1335199062_3212880686_init();
    work_a_0264933966_3212880686_init();
    work_a_0110497899_1181938964_init();
    work_a_1310717279_1181938964_init();
    work_a_1199342472_3212880686_init();
    work_a_3719406840_1181938964_init();
    work_a_3916381177_3212880686_init();
    work_a_1526596786_1181938964_init();
    work_a_2922643520_1181938964_init();
    work_a_2833986652_1181938964_init();
    work_a_3918584861_3212880686_init();
    work_a_0880225211_1181938964_init();
    work_a_1768506737_3212880686_init();
    work_a_1262680338_3212880686_init();
    work_a_1386942913_3212880686_init();
    work_a_1568287310_3212880686_init();
    work_a_0848970640_3212880686_init();
    work_a_2096391741_1181938964_init();
    work_a_3678626554_3212880686_init();
    work_a_3299639750_3212880686_init();
    work_a_1651869769_3212880686_init();
    work_a_3162054707_3212880686_init();
    work_a_2010076020_3212880686_init();
    work_a_1622427447_3212880686_init();
    work_a_2238716949_2712257714_init();
    work_a_1097973800_3212880686_init();
    work_a_2984372892_3212880686_init();
    work_a_1820635504_3212880686_init();
    work_a_0823605779_1181938964_init();
    work_a_1731894988_3212880686_init();
    work_a_2272201931_1181938964_init();
    work_a_1324578579_1181938964_init();
    work_a_1579710584_3212880686_init();
    work_a_0134658111_2373810918_init();
    work_a_2047204476_3212880686_init();
    work_a_1548699895_2372691052_init();


    xsi_register_tops("work_a_1548699895_2372691052");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    WORK_P_3647430093 = xsi_get_engine_memory("work_p_3647430093");
    IEEE_P_3972351953 = xsi_get_engine_memory("ieee_p_3972351953");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    IEEE_P_3564397177 = xsi_get_engine_memory("ieee_p_3564397177");

    return xsi_run_simulation(argc, argv);

}
