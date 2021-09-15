# Options
complete --command send_diag --exclusive --condition "__fish_not_contain_opt dst pow saf com" --long dst --description "Manually set the destination address"
complete --command send_diag --exclusive --condition "__fish_not_contain_opt dst pow saf com" --long pow --description "Set the destination address to the Power Controller"
complete --command send_diag --exclusive --condition "__fish_not_contain_opt dst pow saf com" --long saf --description "Set the destination address to the Safety Controller"
complete --command send_diag --exclusive --condition "__fish_not_contain_opt dst pow saf com" --long com --description "Set the destination address to the Communication Board Controller"
complete --command send_diag --exclusive --long timeout --short t --description "Set the response timeout"

# Special subcommand
complete --command send_diag --exclusive --condition __fish_use_subcommand --arguments factory --description "Put the Power Controller into factory mode"
complete --command send_diag --exclusive --condition __fish_use_subcommand --arguments list --description "List the avaiable services in fzf"

# Available services (from xml)
complete --command send_diag --exclusive --description "get_firmware_version" --condition __fish_use_subcommand --arguments "0x1000"
complete --command send_diag --exclusive --description "get_git_describe" --condition __fish_use_subcommand --arguments "0x1037"
complete --command send_diag --exclusive --description "get_product_number" --condition __fish_use_subcommand --arguments "0x1001"
complete --command send_diag --exclusive --description "get_serial_number" --condition __fish_use_subcommand --arguments "0x1003"
complete --command send_diag --exclusive --description "get_hardware_version" --condition __fish_use_subcommand --arguments "0x1005"
complete --command send_diag --exclusive --description "get_num_phases" --condition __fish_use_subcommand --arguments "0x1006"
complete --command send_diag --exclusive --description "get_num_ntcs" --condition __fish_use_subcommand --arguments "0x1007"
complete --command send_diag --exclusive --description "get_hmi_hardware_version" --condition __fish_use_subcommand --arguments "0x1008"
complete --command send_diag --exclusive --description "get_number_of_copr_licenses" --condition __fish_use_subcommand --arguments "0x100D"
complete --command send_diag --exclusive --description "get_copr_license_info" --condition __fish_use_subcommand --arguments "0x100F"
complete --command send_diag --exclusive --description "read_external_ct_calibration_value" --condition __fish_use_subcommand --arguments "0x1010"
complete --command send_diag --exclusive --description "write_external_ct_calibration_value" --condition __fish_use_subcommand --arguments "0x1011"
complete --command send_diag --exclusive --description "read_internal_ct_calibration_value" --condition __fish_use_subcommand --arguments "0x1012"
complete --command send_diag --exclusive --description "write_internal_ct_calibration_value" --condition __fish_use_subcommand --arguments "0x1013"
complete --command send_diag --exclusive --description "read_internal_voltage_calibration_value" --condition __fish_use_subcommand --arguments "0x1014"
complete --command send_diag --exclusive --description "write_internal_voltage_calibration_value" --condition __fish_use_subcommand --arguments "0x1015"
complete --command send_diag --exclusive --description "read_internal_phase_correction_value" --condition __fish_use_subcommand --arguments "0x1046"
complete --command send_diag --exclusive --description "write_internal_phase_correction_value" --condition __fish_use_subcommand --arguments "0x1047"
complete --command send_diag --exclusive --description "get_critical_temperature_threshold" --condition __fish_use_subcommand --arguments "0x1016"
complete --command send_diag --exclusive --description "set_critical_temperature_threshold" --condition __fish_use_subcommand --arguments "0x1017"
complete --command send_diag --exclusive --description "authorization_state" --condition __fish_use_subcommand --arguments "0x1027"
complete --command send_diag --exclusive --description "get_high_temperature_threshold" --condition __fish_use_subcommand --arguments "0x1018"
complete --command send_diag --exclusive --description "set_high_temperature_threshold" --condition __fish_use_subcommand --arguments "0x1019"
complete --command send_diag --exclusive --description "get_low_temperature_threshold" --condition __fish_use_subcommand --arguments "0x101A"
complete --command send_diag --exclusive --description "set_low_temperature_threshold" --condition __fish_use_subcommand --arguments "0x101B"
complete --command send_diag --exclusive --description "get_over_temperature_threshold" --condition __fish_use_subcommand --arguments "0x102D"
complete --command send_diag --exclusive --description "set_over_temperature_threshold" --condition __fish_use_subcommand --arguments "0x102E"
complete --command send_diag --exclusive --description "get_internal_voltage" --condition __fish_use_subcommand --arguments "0x101E"
complete --command send_diag --exclusive --description "get_internal_frequency" --condition __fish_use_subcommand --arguments "0x101F"
complete --command send_diag --exclusive --description "get_internal_power_measurements" --condition __fish_use_subcommand --arguments "0x1020"
complete --command send_diag --exclusive --description "set_hems_state" --condition __fish_use_subcommand --arguments "0x1021"
complete --command send_diag --exclusive --description "get_hems_state" --condition __fish_use_subcommand --arguments "0x104A"
complete --command send_diag --exclusive --description "get_regulatory_domain" --condition __fish_use_subcommand --arguments "0x1022"
complete --command send_diag --exclusive --description "set_regulatory_domain" --condition __fish_use_subcommand --arguments "0x1023"
complete --command send_diag --exclusive --description "get_persistent_counter" --condition __fish_use_subcommand --arguments "0x102B"
complete --command send_diag --exclusive --description "dimming_method" --condition __fish_use_subcommand --arguments "0x1024"
complete --command send_diag --exclusive --description "get_internal_power_factor" --condition __fish_use_subcommand --arguments "0x1048"
complete --command send_diag --exclusive --description "get_operation_mode" --condition __fish_use_subcommand --arguments "0x10F0"
complete --command send_diag --exclusive --description "enter_diagnostic_mode" --condition __fish_use_subcommand --arguments "0x10FE"
complete --command send_diag --exclusive --description "notify_comboard_ready" --condition __fish_use_subcommand --arguments "0x1300"
complete --command send_diag --exclusive --description "notify_installer_ap_active" --condition __fish_use_subcommand --arguments "0x1301"
complete --command send_diag --exclusive --description "set_energy_offer_state" --condition __fish_use_subcommand --arguments "0x1302"
complete --command send_diag --exclusive --description "get_energy_offer_state" --condition __fish_use_subcommand --arguments "0x1303"
complete --command send_diag --exclusive --description "get_auth_enabled" --condition __fish_use_subcommand --arguments "0x1304"
complete --command send_diag --exclusive --description "set_auth_enabled" --condition __fish_use_subcommand --arguments "0x1305"
complete --command send_diag --exclusive --description "set_ambient_light_response" --condition __fish_use_subcommand --arguments "0x1306"
complete --command send_diag --exclusive --description "get_ambient_light_response" --condition __fish_use_subcommand --arguments "0x1307"
complete --command send_diag --exclusive --description "set_backend_connection_status" --condition __fish_use_subcommand --arguments "0x1308"
complete --command send_diag --exclusive --description "get_backend_connection_status" --condition __fish_use_subcommand --arguments "0x1309"
complete --command send_diag --exclusive --description "start_update" --condition __fish_use_subcommand --arguments "0x1100"
complete --command send_diag --exclusive --description "enter_fw_update_mode" --condition __fish_use_subcommand --arguments "0x103C"
complete --command send_diag --exclusive --description "exit_fw_update_mode" --condition __fish_use_subcommand --arguments "0x103D"
complete --command send_diag --exclusive --description "data_update" --condition __fish_use_subcommand --arguments "0x1101"
complete --command send_diag --exclusive --description "verify_update" --condition __fish_use_subcommand --arguments "0x1102"
complete --command send_diag --exclusive --description "software_reset" --condition __fish_use_subcommand --arguments "0x1103"
complete --command send_diag --exclusive --description "enter_sleep_mode" --condition __fish_use_subcommand --arguments "0x1127"
complete --command send_diag --exclusive --description "get_rdp_level" --condition __fish_use_subcommand --arguments "0x1129"
complete --command send_diag --exclusive --description "get_custom_coil_conf" --condition __fish_use_subcommand --arguments "0x112A"
complete --command send_diag --exclusive --description "set_custom_coil_conf" --condition __fish_use_subcommand --arguments "0x112B"
complete --command send_diag --exclusive --description "initialize_external_stpms_for_factory" --condition __fish_use_subcommand --arguments "0x1213"
complete --command send_diag --exclusive --description "get_reset_cause" --condition __fish_use_subcommand --arguments "0x1104"
complete --command send_diag --exclusive --description "safety_mcu_reset" --condition __fish_use_subcommand --arguments "0x1126"
complete --command send_diag --exclusive --description "get_number_logged_errors" --condition __fish_use_subcommand --arguments "0x1028"
complete --command send_diag --exclusive --description "get_logged_error" --condition __fish_use_subcommand --arguments "0x1029"
complete --command send_diag --exclusive --description "clr_logged_errors" --condition __fish_use_subcommand --arguments "0x1106"
complete --command send_diag --exclusive --description "set_logged_error" --condition __fish_use_subcommand --arguments "0x102A"
complete --command send_diag --exclusive --description "error_notification" --condition __fish_use_subcommand --arguments "0x1039"
complete --command send_diag --exclusive --description "reset_persistent_counter" --condition __fish_use_subcommand --arguments "0x102C"
complete --command send_diag --exclusive --description "get_dip_switch_group_a" --condition __fish_use_subcommand --arguments "0x1107"
complete --command send_diag --exclusive --description "get_dip_switch_group_b" --condition __fish_use_subcommand --arguments "0x1108"
complete --command send_diag --exclusive --description "get_internal_CT_current" --condition __fish_use_subcommand --arguments "0x1109"
complete --command send_diag --exclusive --description "get_external_CT_current" --condition __fish_use_subcommand --arguments "0x110A"
complete --command send_diag --exclusive --description "get_all_CT_current" --condition __fish_use_subcommand --arguments "0x110B"
complete --command send_diag --exclusive --description "get_stpm_register" --condition __fish_use_subcommand --arguments "0x110E"
complete --command send_diag --exclusive --description "set_stpm_register" --condition __fish_use_subcommand --arguments "0x110F"
complete --command send_diag --exclusive --description "get_int_stpm_register" --condition __fish_use_subcommand --arguments "0x1122"
complete --command send_diag --exclusive --description "set_int_stpm_register" --condition __fish_use_subcommand --arguments "0x1123"
complete --command send_diag --exclusive --description "get_power_board_charging_limit" --condition __fish_use_subcommand --arguments "0x1009"
complete --command send_diag --exclusive --description "set_com_board_charging_limit" --condition __fish_use_subcommand --arguments "0x1049"
complete --command send_diag --exclusive --description "get_hmi_led_states" --condition __fish_use_subcommand --arguments "0x100A"
complete --command send_diag --exclusive --description "get_rcd_error_status" --condition __fish_use_subcommand --arguments "0x100B"
complete --command send_diag --exclusive --description "get_ev_plugged_status" --condition __fish_use_subcommand --arguments "0x100C"
complete --command send_diag --exclusive --description "get_temperature_derating_info" --condition __fish_use_subcommand --arguments "0x1114"
complete --command send_diag --exclusive --description "get_temperature_celsius" --condition __fish_use_subcommand --arguments "0x1110"
complete --command send_diag --exclusive --description "get_temperature_raw" --condition __fish_use_subcommand --arguments "0x1111"
complete --command send_diag --exclusive --description "get_cpu_temperature_celsius" --condition __fish_use_subcommand --arguments "0x1112"
complete --command send_diag --exclusive --description "get_cpu_temperature_raw" --condition __fish_use_subcommand --arguments "0x1113"
complete --command send_diag --exclusive --description "get_socket_temperature_celsius" --condition __fish_use_subcommand --arguments "0x1116"
complete --command send_diag --exclusive --description "get_raw_cp_values" --condition __fish_use_subcommand --arguments "0x1115"
complete --command send_diag --exclusive --description "get_com_presence" --condition __fish_use_subcommand --arguments "0x1117"
complete --command send_diag --exclusive --description "ctrl_com_power" --condition __fish_use_subcommand --arguments "0x1205"
complete --command send_diag --exclusive --description "ctrl_com_wakeup" --condition __fish_use_subcommand --arguments "0x1128"
complete --command send_diag --exclusive --description "power_cycle_com" --condition __fish_use_subcommand --arguments "0x1210"
complete --command send_diag --exclusive --description "request_to_sleep" --condition __fish_use_subcommand --arguments "0x1038"
complete --command send_diag --exclusive --description "get_state_of_charge" --condition __fish_use_subcommand --arguments "0x1121"
complete --command send_diag --exclusive --description "set_high_level_communication" --condition __fish_use_subcommand --arguments "0x102F"
complete --command send_diag --exclusive --description "req_high_level_communication" --condition __fish_use_subcommand --arguments "0x1030"
complete --command send_diag --exclusive --description "set_concurrent_high_level_communication" --condition __fish_use_subcommand --arguments "0x1031"
complete --command send_diag --exclusive --description "subscribe_to_service" --condition __fish_use_subcommand --arguments "0x1032"
complete --command send_diag --exclusive --description "get_active_bank" --condition __fish_use_subcommand --arguments "0x1124"
complete --command send_diag --exclusive --description "get_highest_prior_error" --condition __fish_use_subcommand --arguments "0x1125"
complete --command send_diag --exclusive --description "hmi_mcu_reset" --condition __fish_use_subcommand --arguments "0x112D"
complete --command send_diag --exclusive --description "set_product_number" --condition __fish_use_subcommand --arguments "0x1002"
complete --command send_diag --exclusive --description "set_serial_number" --condition __fish_use_subcommand --arguments "0x1004"
complete --command send_diag --exclusive --description "set_hardware_version" --condition __fish_use_subcommand --arguments "0x1215"
complete --command send_diag --exclusive --description "set_num_phases" --condition __fish_use_subcommand --arguments "0x1216"
complete --command send_diag --exclusive --description "set_num_ntcs" --condition __fish_use_subcommand --arguments "0x1217"
complete --command send_diag --exclusive --description "set_led_driver_register" --condition __fish_use_subcommand --arguments "0x111A"
complete --command send_diag --exclusive --description "set_led_factory_settings" --condition __fish_use_subcommand --arguments "0x1118"
complete --command send_diag --exclusive --description "ctrl_led_brightness" --condition __fish_use_subcommand --arguments "0x111C"
complete --command send_diag --exclusive --description "ctrl_led_colors" --condition __fish_use_subcommand --arguments "0x111B"
complete --command send_diag --exclusive --description "get_led_driver_register" --condition __fish_use_subcommand --arguments "0x1119"
complete --command send_diag --exclusive --description "generate_pwm" --condition __fish_use_subcommand --arguments "0x1203"
complete --command send_diag --exclusive --description "generate_clock" --condition __fish_use_subcommand --arguments "0x1204"
complete --command send_diag --exclusive --description "get_light_sensor_register" --condition __fish_use_subcommand --arguments "0x111D"
complete --command send_diag --exclusive --description "set_light_sensor_register" --condition __fish_use_subcommand --arguments "0x111E"
complete --command send_diag --exclusive --description "get_light_intensity" --condition __fish_use_subcommand --arguments "0x111F"
complete --command send_diag --exclusive --description "set_light_sensor_factory_settings" --condition __fish_use_subcommand --arguments "0x1120"
complete --command send_diag --exclusive --description "start_self_test" --condition __fish_use_subcommand --arguments "0x1200"
complete --command send_diag --exclusive --description "get_self_test_results" --condition __fish_use_subcommand --arguments "0x120B"
complete --command send_diag --exclusive --description "start_stress_test" --condition __fish_use_subcommand --arguments "0x1202"
complete --command send_diag --exclusive --description "start_ext_stpm_current_calibration" --condition __fish_use_subcommand --arguments "0x120e"
complete --command send_diag --exclusive --description "start_int_stpm_current_calibration" --condition __fish_use_subcommand --arguments "0x1212"
complete --command send_diag --exclusive --description "start_int_stpm_phase_calibration" --condition __fish_use_subcommand --arguments "0x1220"
complete --command send_diag --exclusive --description "start_int_stpm_voltage_calibration" --condition __fish_use_subcommand --arguments "0x1214"
complete --command send_diag --exclusive --description "get_stpm_last_calibration_status" --condition __fish_use_subcommand --arguments "0x120f"
complete --command send_diag --exclusive --description "set_rdp_level" --condition __fish_use_subcommand --arguments "0x1211"
complete --command send_diag --exclusive --description "set_system_time" --condition __fish_use_subcommand --arguments "0x120C"
complete --command send_diag --exclusive --description "get_system_time" --condition __fish_use_subcommand --arguments "0x120D"
complete --command send_diag --exclusive --description "set_deep_sleep_logic" --condition __fish_use_subcommand --arguments "0x1218"
complete --command send_diag --exclusive --description "get_deep_sleep_logic" --condition __fish_use_subcommand --arguments "0x1219"
complete --command send_diag --exclusive --description "verify_root_certificate_hash" --condition __fish_use_subcommand --arguments "0x112C"
complete --command send_diag --exclusive --description "get_safety_fault_type" --condition __fish_use_subcommand --arguments "0x220A"
complete --command send_diag --exclusive --description "get_rcd_measured_leakage_dc"  --condition __fish_use_subcommand --arguments "0x220C"
complete --command send_diag --exclusive --description "get_rcd_measured_leakage_ac" --condition __fish_use_subcommand --arguments "0x2217"
complete --command send_diag --exclusive --description "get_rcd_last_trip_leakage" --condition __fish_use_subcommand --arguments "0x220D"
complete --command send_diag --exclusive --description "get_relay_state" --condition __fish_use_subcommand --arguments "0x2206"
complete --command send_diag --exclusive --description "get_relay_feedback_state" --condition __fish_use_subcommand --arguments "0x2207"
complete --command send_diag --exclusive --description "get_test_coil_state" --condition __fish_use_subcommand --arguments "0x2208"
complete --command send_diag --exclusive --description "get_cpu_temp" --condition __fish_use_subcommand --arguments "0x220F" 
complete --command send_diag --exclusive --description "get_safety_ntc_temp" --condition __fish_use_subcommand --arguments "0x2216" 
complete --command send_diag --exclusive --description "get_rcd_offset" --condition __fish_use_subcommand --arguments "0x2219"
complete --command send_diag --exclusive --description "get_rcd_gain" --condition __fish_use_subcommand --arguments "0x221A"
complete --command send_diag --exclusive --description "get_rcd_state" --condition __fish_use_subcommand --arguments "0x2218"
complete --command send_diag --exclusive --description "get_pe_state" --condition __fish_use_subcommand --arguments "0x220E"
complete --command send_diag --exclusive --description "get_firmware_version_safety"  --condition __fish_use_subcommand --arguments "0x2204"
complete --command send_diag --exclusive --description "get_cp_current_and_pwm" --condition __fish_use_subcommand --arguments "0x2205"
complete --command send_diag --exclusive --description "get_unique_identifier" --condition __fish_use_subcommand --arguments "0x1025"
complete --command send_diag --exclusive --description "set_maximum_charging_current_per_phase" --condition __fish_use_subcommand --arguments "0x1026"
complete --command send_diag --exclusive --description "factory_reset" --condition __fish_use_subcommand --arguments "0x120A"
complete --command send_diag --exclusive --description "communicate_reboot" --condition __fish_use_subcommand --arguments "0x1035"
complete --command send_diag --exclusive --description "set_evse_availability" --condition __fish_use_subcommand --arguments "0x1033"
complete --command send_diag --exclusive --description "get_evse_availability" --condition __fish_use_subcommand --arguments "0x1034"
complete --command send_diag --exclusive --description "communicate_bcb_toggle" --condition __fish_use_subcommand --arguments "0x1036"
complete --command send_diag --exclusive --description "get_security_pad" --condition __fish_use_subcommand --arguments "0x103A"
complete --command send_diag --exclusive --description "generate_security_pad" --condition __fish_use_subcommand --arguments "0x103B"
complete --command send_diag --exclusive --description "set_external_ct_coil_type" --condition __fish_use_subcommand --arguments "0x103E"
complete --command send_diag --exclusive --description "get_external_ct_coil_type" --condition __fish_use_subcommand --arguments "0x103F"
complete --command send_diag --exclusive --description "set_ground_loss_monitor_config" --condition __fish_use_subcommand --arguments "0x1042"
complete --command send_diag --exclusive --description "get_ground_loss_monitor_config" --condition __fish_use_subcommand --arguments "0x1043"
complete --command send_diag --exclusive --description "write_product_variant_id" --condition __fish_use_subcommand --arguments "0x1044"
complete --command send_diag --exclusive --description "get_product_variant_id" --condition __fish_use_subcommand --arguments "0x1045"
complete --command send_diag --exclusive --description "test_can_send" --condition __fish_use_subcommand --arguments "0x1400"
complete --command send_diag --exclusive --description "set_can_id" --condition __fish_use_subcommand --arguments "0x1401"
complete --command send_diag --exclusive --description "test_can_get_msg" --condition __fish_use_subcommand --arguments "0x1410"
complete --command send_diag --exclusive --description "set_lock_state" --condition __fish_use_subcommand --arguments "0x1402"
complete --command send_diag --exclusive --description "get_lock_state" --condition __fish_use_subcommand --arguments "0x1403"
complete --command send_diag --exclusive --description "get_pp_max_current" --condition __fish_use_subcommand --arguments "0x100E"
complete --command send_diag --exclusive --description "enable_digital_input1" --condition __fish_use_subcommand --arguments "0x1404"
complete --command send_diag --exclusive --description "enable_digital_input2" --condition __fish_use_subcommand --arguments "0x1405"
complete --command send_diag --exclusive --description "read_digital_input1_state" --condition __fish_use_subcommand --arguments "0x1406"
complete --command send_diag --exclusive --description "read_digital_input2_state" --condition __fish_use_subcommand --arguments "0x1407"
complete --command send_diag --exclusive --description "write_digital_output1" --condition __fish_use_subcommand --arguments "0x1408"
complete --command send_diag --exclusive --description "write_digital_output2" --condition __fish_use_subcommand --arguments "0x1409"
complete --command send_diag --exclusive --description "set_safety_weld_monitoring_state" --condition __fish_use_subcommand --arguments "0x1411"
complete --command send_diag --exclusive --description "get_safety_weld_monitoring_state" --condition __fish_use_subcommand --arguments "0x1412"
complete --command send_diag --exclusive --description "disable_diagnostics_over_can" --condition __fish_use_subcommand --arguments "0x1413"
complete --command send_diag --exclusive --description "get_configured_maximum_charging_current" --condition __fish_use_subcommand --arguments "0x1414"
complete --command send_diag --exclusive --description "set_max_static_current" --condition __fish_use_subcommand --arguments "0x1415"
complete --command send_diag --exclusive --description "get_max_static_current" --condition __fish_use_subcommand --arguments "0x1416"
complete --command send_diag --exclusive --description "set_max_facility_current" --condition __fish_use_subcommand --arguments "0x1417"
complete --command send_diag --exclusive --description "get_max_facility_current" --condition __fish_use_subcommand --arguments "0x1418"
