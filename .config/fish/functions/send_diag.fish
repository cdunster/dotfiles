function send_diag
    argparse -x 'dst,pow,saf,com' 'dst=' 'pow' 'saf' 'com' 't/timeout=!_validate_int' 's/service=' 'd/data=' -- $argv
    or return

    switch $argv[1]
        case factory
            diag --serial=/dev/ttyUSB0 --powermode factory
            return
        case list
            __send_diag_list_services | fzf
            return
        case get_firmware_version
            set argv[1] 0x1000
        case get_git_describe
            set argv[1] 0x1037
        case get_product_number
            set argv[1] 0x1001
        case get_serial_number
            set argv[1] 0x1003
        case get_hardware_version
            set argv[1] 0x1005
        case get_num_phases
            set argv[1] 0x1006
        case get_num_ntcs
            set argv[1] 0x1007
        case get_hmi_hardware_version
            set argv[1] 0x1008
        case get_number_of_copr_licenses
            set argv[1] 0x100D
        case get_copr_license_info
            set argv[1] 0x100F
        case read_external_ct_calibration_value
            set argv[1] 0x1010
        case write_external_ct_calibration_value
            set argv[1] 0x1011
        case read_internal_ct_calibration_value
            set argv[1] 0x1012
        case write_internal_ct_calibration_value
            set argv[1] 0x1013
        case read_internal_voltage_calibration_value
            set argv[1] 0x1014
        case write_internal_voltage_calibration_value
            set argv[1] 0x1015
        case read_internal_phase_correction_value
            set argv[1] 0x1046
        case write_internal_phase_correction_value
            set argv[1] 0x1047
        case get_critical_temperature_threshold
            set argv[1] 0x1016
        case set_critical_temperature_threshold
            set argv[1] 0x1017
        case authorization_state
            set argv[1] 0x1027
        case get_high_temperature_threshold
            set argv[1] 0x1018
        case set_high_temperature_threshold
            set argv[1] 0x1019
        case get_low_temperature_threshold
            set argv[1] 0x101A
        case set_low_temperature_threshold
            set argv[1] 0x101B
        case get_over_temperature_threshold
            set argv[1] 0x102D
        case set_over_temperature_threshold
            set argv[1] 0x102E
        case get_internal_voltage
            set argv[1] 0x101E
        case get_internal_frequency
            set argv[1] 0x101F
        case get_internal_power_measurements
            set argv[1] 0x1020
        case set_hems_state
            set argv[1] 0x1021
        case get_hems_state
            set argv[1] 0x104A
        case get_regulatory_domain
            set argv[1] 0x1022
        case set_regulatory_domain
            set argv[1] 0x1023
        case get_persistent_counter
            set argv[1] 0x102B
        case dimming_method
            set argv[1] 0x1024
        case get_internal_power_factor
            set argv[1] 0x1048
        case get_operation_mode
            set argv[1] 0x10F0
        case enter_diagnostic_mode
            set argv[1] 0x10FE
        case notify_comboard_ready
            set argv[1] 0x1300
        case notify_installer_ap_active
            set argv[1] 0x1301
        case set_energy_offer_state
            set argv[1] 0x1302
        case get_energy_offer_state
            set argv[1] 0x1303
        case get_auth_enabled
            set argv[1] 0x1304
        case set_auth_enabled
            set argv[1] 0x1305
        case set_ambient_light_response
            set argv[1] 0x1306
        case get_ambient_light_response
            set argv[1] 0x1307
        case set_backend_connection_status
            set argv[1] 0x1308
        case get_backend_connection_status
            set argv[1] 0x1309
        case start_update
            set argv[1] 0x1100
        case enter_fw_update_mode
            set argv[1] 0x103C
        case exit_fw_update_mode
            set argv[1] 0x103D
        case data_update
            set argv[1] 0x1101
        case verify_update
            set argv[1] 0x1102
        case software_reset
            set argv[1] 0x1103
        case enter_sleep_mode
            set argv[1] 0x1127
        case get_rdp_level
            set argv[1] 0x1129
        case get_custom_coil_conf
            set argv[1] 0x112A
        case set_custom_coil_conf
            set argv[1] 0x112B
        case initialize_external_stpms_for_factory
            set argv[1] 0x1213
        case get_reset_cause
            set argv[1] 0x1104
        case safety_mcu_reset
            set argv[1] 0x1126
        case get_number_logged_errors
            set argv[1] 0x1028
        case get_logged_error
            set argv[1] 0x1029
        case clr_logged_errors
            set argv[1] 0x1106
        case set_logged_error
            set argv[1] 0x102A
        case error_notification
            set argv[1] 0x1039
        case reset_persistent_counter
            set argv[1] 0x102C
        case get_dip_switch_group_a
            set argv[1] 0x1107
        case get_dip_switch_group_b
            set argv[1] 0x1108
        case get_internal_CT_current
            set argv[1] 0x1109
        case get_external_CT_current
            set argv[1] 0x110A
        case get_all_CT_current
            set argv[1] 0x110B
        case get_stpm_register
            set argv[1] 0x110E
        case set_stpm_register
            set argv[1] 0x110F
        case get_int_stpm_register
            set argv[1] 0x1122
        case set_int_stpm_register
            set argv[1] 0x1123
        case get_power_board_charging_limit
            set argv[1] 0x1009
        case set_com_board_charging_limit
            set argv[1] 0x1049
        case get_hmi_led_states
            set argv[1] 0x100A
        case get_rcd_error_status
            set argv[1] 0x100B
        case get_ev_plugged_status
            set argv[1] 0x100C
        case get_temperature_derating_info
            set argv[1] 0x1114
        case get_temperature_celsius
            set argv[1] 0x1110
        case get_temperature_raw
            set argv[1] 0x1111
        case get_cpu_temperature_celsius
            set argv[1] 0x1112
        case get_cpu_temperature_raw
            set argv[1] 0x1113
        case get_socket_temperature_celsius
            set argv[1] 0x1116
        case get_raw_cp_values
            set argv[1] 0x1115
        case get_com_presence
            set argv[1] 0x1117
        case ctrl_com_power
            set argv[1] 0x1205
        case ctrl_com_wakeup
            set argv[1] 0x1128
        case power_cycle_com
            set argv[1] 0x1210
        case request_to_sleep
            set argv[1] 0x1038
        case get_state_of_charge
            set argv[1] 0x1121
        case set_high_level_communication
            set argv[1] 0x102F
        case req_high_level_communication
            set argv[1] 0x1030
        case set_concurrent_high_level_communication
            set argv[1] 0x1031
        case subscribe_to_service
            set argv[1] 0x1032
        case get_active_bank
            set argv[1] 0x1124
        case get_highest_prior_error
            set argv[1] 0x1125
        case hmi_mcu_reset
            set argv[1] 0x112D
        case set_product_number
            set argv[1] 0x1002
        case set_serial_number
            set argv[1] 0x1004
        case set_hardware_version
            set argv[1] 0x1215
        case set_num_phases
            set argv[1] 0x1216
        case set_num_ntcs
            set argv[1] 0x1217
        case set_led_driver_register
            set argv[1] 0x111A
        case set_led_factory_settings
            set argv[1] 0x1118
        case ctrl_led_brightness
            set argv[1] 0x111C
        case ctrl_led_colors
            set argv[1] 0x111B
        case get_led_driver_register
            set argv[1] 0x1119
        case generate_pwm
            set argv[1] 0x1203
        case generate_clock
            set argv[1] 0x1204
        case get_light_sensor_register
            set argv[1] 0x111D
        case set_light_sensor_register
            set argv[1] 0x111E
        case get_light_intensity
            set argv[1] 0x111F
        case set_light_sensor_factory_settings
            set argv[1] 0x1120
        case start_self_test
            set argv[1] 0x1200
        case get_self_test_results
            set argv[1] 0x120B
        case start_stress_test
            set argv[1] 0x1202
        case start_ext_stpm_current_calibration
            set argv[1] 0x120e
        case start_int_stpm_current_calibration
            set argv[1] 0x1212
        case start_int_stpm_phase_calibration
            set argv[1] 0x1220
        case start_int_stpm_voltage_calibration
            set argv[1] 0x1214
        case get_stpm_last_calibration_status
            set argv[1] 0x120f
        case set_rdp_level
            set argv[1] 0x1211
        case set_system_time
            set argv[1] 0x120C
        case get_system_time
            set argv[1] 0x120D
        case set_deep_sleep_logic
            set argv[1] 0x1218
        case get_deep_sleep_logic
            set argv[1] 0x1219
        case verify_root_certificate_hash
            set argv[1] 0x112C
        case get_safety_fault_type
            set argv[1] 0x220A
        case get_rcd_measured_leakage_dc
            set argv[1] 0x220C
        case get_rcd_measured_leakage_ac
            set argv[1] 0x2217
        case get_rcd_last_trip_leakage
            set argv[1] 0x220D
        case get_relay_state
            set argv[1] 0x2206
        case get_relay_feedback_state
            set argv[1] 0x2207
        case get_test_coil_state
            set argv[1] 0x2208
        case get_cpu_temp
            set argv[1] 0x220F
        case get_safety_ntc_temp
            set argv[1] 0x2216
        case get_rcd_offset
            set argv[1] 0x2219
        case get_rcd_gain
            set argv[1] 0x221A
        case get_rcd_state
            set argv[1] 0x2218
        case get_pe_state
            set argv[1] 0x220E
        case get_firmware_version_safety
            set argv[1] 0x2204
        case get_cp_current_and_pwm
            set argv[1] 0x2205
        case get_unique_identifier
            set argv[1] 0x1025
        case set_maximum_charging_current_per_phase
            set argv[1] 0x1026
        case factory_reset
            set argv[1] 0x120A
        case communicate_reboot
            set argv[1] 0x1035
        case set_evse_availability
            set argv[1] 0x1033
        case get_evse_availability
            set argv[1] 0x1034
        case communicate_bcb_toggle
            set argv[1] 0x1036
        case get_security_pad
            set argv[1] 0x103A
        case generate_security_pad
            set argv[1] 0x103B
        case set_external_ct_coil_type
            set argv[1] 0x103E
        case get_external_ct_coil_type
            set argv[1] 0x103F
        case set_ground_loss_monitor_config
            set argv[1] 0x1042
        case get_ground_loss_monitor_config
            set argv[1] 0x1043
        case write_product_variant_id
            set argv[1] 0x1044
        case get_product_variant_id
            set argv[1] 0x1045
        case test_can_send
            set argv[1] 0x1400
        case set_can_id
            set argv[1] 0x1401
        case test_can_get_msg
            set argv[1] 0x1410
        case set_lock_state
            set argv[1] 0x1402
        case get_lock_state
            set argv[1] 0x1403
        case get_pp_max_current
            set argv[1] 0x100E
        case enable_digital_input1
            set argv[1] 0x1404
        case enable_digital_input2
            set argv[1] 0x1405
        case read_digital_input1_state
            set argv[1] 0x1406
        case read_digital_input2_state
            set argv[1] 0x1407
        case write_digital_output1
            set argv[1] 0x1408
        case write_digital_output2
            set argv[1] 0x1409
        case set_safety_weld_monitoring_state
            set argv[1] 0x1411
        case get_safety_weld_monitoring_state
            set argv[1] 0x1412
        case disable_diagnostics_over_can
            set argv[1] 0x1413
        case get_configured_maximum_charging_current
            set argv[1] 0x1414
        case set_max_static_current
            set argv[1] 0x1415
        case get_max_static_current
            set argv[1] 0x1416
        case set_max_facility_current
            set argv[1] 0x1417
        case get_max_facility_current
            set argv[1] 0x1418
    end

    if test -n "$_flag_saf"
        set _flag_dst 0x20
    else if test -n "$_flag_com"
        set _flag_dst 0x30
    else if test -z "$_flag_dst"
        set _flag_dst 0x10
    end

    if test -z "$_flag_timeout"
        set _flag_timeout 3000
    end

    if test -z "$_flag_service"
        if test -z "$argv[1]"
            echo "No service provided."
            return
        end
        set _flag_service $argv[1]
    end

    if test -z "$_flag_data"
        set _flag_data $argv[2]
    end

    diag --serial=/dev/ttyUSB0 --timeout $_flag_timeout --message="{Dst:$_flag_dst, Svc:$_flag_service, Dat:$_flag_data}"
end

function __send_diag_list_services
     echo get_firmware_version: 0x1000
     echo get_git_describe: 0x1037
     echo get_product_number: 0x1001
     echo get_serial_number: 0x1003
     echo get_hardware_version: 0x1005
     echo get_num_phases: 0x1006
     echo get_num_ntcs: 0x1007
     echo get_hmi_hardware_version: 0x1008
     echo get_number_of_copr_licenses: 0x100D
     echo get_copr_license_info: 0x100F
     echo read_external_ct_calibration_value: 0x1010
     echo write_external_ct_calibration_value: 0x1011
     echo read_internal_ct_calibration_value: 0x1012
     echo write_internal_ct_calibration_value: 0x1013
     echo read_internal_voltage_calibration_value: 0x1014
     echo write_internal_voltage_calibration_value: 0x1015
     echo read_internal_phase_correction_value: 0x1046
     echo write_internal_phase_correction_value: 0x1047
     echo get_critical_temperature_threshold: 0x1016
     echo set_critical_temperature_threshold: 0x1017
     echo authorization_state: 0x1027
     echo get_high_temperature_threshold: 0x1018
     echo set_high_temperature_threshold: 0x1019
     echo get_low_temperature_threshold: 0x101A
     echo set_low_temperature_threshold: 0x101B
     echo get_over_temperature_threshold: 0x102D
     echo set_over_temperature_threshold: 0x102E
     echo get_internal_voltage: 0x101E
     echo get_internal_frequency: 0x101F
     echo get_internal_power_measurements: 0x1020
     echo set_hems_state: 0x1021
     echo get_hems_state: 0x104A
     echo get_regulatory_domain: 0x1022
     echo set_regulatory_domain: 0x1023
     echo get_persistent_counter: 0x102B
     echo dimming_method: 0x1024
     echo get_internal_power_factor: 0x1048
     echo get_operation_mode: 0x10F0
     echo enter_diagnostic_mode: 0x10FE
     echo notify_comboard_ready: 0x1300
     echo notify_installer_ap_active: 0x1301
     echo set_energy_offer_state: 0x1302
     echo get_energy_offer_state: 0x1303
     echo get_auth_enabled: 0x1304
     echo set_auth_enabled: 0x1305
     echo set_ambient_light_response: 0x1306
     echo get_ambient_light_response: 0x1307
     echo set_backend_connection_status: 0x1308
     echo get_backend_connection_status: 0x1309
     echo start_update: 0x1100
     echo enter_fw_update_mode: 0x103C
     echo exit_fw_update_mode: 0x103D
     echo data_update: 0x1101
     echo verify_update: 0x1102
     echo software_reset: 0x1103
     echo enter_sleep_mode: 0x1127
     echo get_rdp_level: 0x1129
     echo get_custom_coil_conf: 0x112A
     echo set_custom_coil_conf: 0x112B
     echo initialize_external_stpms_for_factory: 0x1213
     echo get_reset_cause: 0x1104
     echo safety_mcu_reset: 0x1126
     echo get_number_logged_errors: 0x1028
     echo get_logged_error: 0x1029
     echo clr_logged_errors: 0x1106
     echo set_logged_error: 0x102A
     echo error_notification: 0x1039
     echo reset_persistent_counter: 0x102C
     echo get_dip_switch_group_a: 0x1107
     echo get_dip_switch_group_b: 0x1108
     echo get_internal_CT_current: 0x1109
     echo get_external_CT_current: 0x110A
     echo get_all_CT_current: 0x110B
     echo get_stpm_register: 0x110E
     echo set_stpm_register: 0x110F
     echo get_int_stpm_register: 0x1122
     echo set_int_stpm_register: 0x1123
     echo get_power_board_charging_limit: 0x1009
     echo set_com_board_charging_limit: 0x1049
     echo get_hmi_led_states: 0x100A
     echo get_rcd_error_status: 0x100B
     echo get_ev_plugged_status: 0x100C
     echo get_temperature_derating_info: 0x1114
     echo get_temperature_celsius: 0x1110
     echo get_temperature_raw: 0x1111
     echo get_cpu_temperature_celsius: 0x1112
     echo get_cpu_temperature_raw: 0x1113
     echo get_socket_temperature_celsius: 0x1116
     echo get_raw_cp_values: 0x1115
     echo get_com_presence: 0x1117
     echo ctrl_com_power: 0x1205
     echo ctrl_com_wakeup: 0x1128
     echo power_cycle_com: 0x1210
     echo request_to_sleep: 0x1038
     echo get_state_of_charge: 0x1121
     echo set_high_level_communication: 0x102F
     echo req_high_level_communication: 0x1030
     echo set_concurrent_high_level_communication: 0x1031
     echo subscribe_to_service: 0x1032
     echo get_active_bank: 0x1124
     echo get_highest_prior_error: 0x1125
     echo hmi_mcu_reset: 0x112D
     echo set_product_number: 0x1002
     echo set_serial_number: 0x1004
     echo set_hardware_version: 0x1215
     echo set_num_phases: 0x1216
     echo set_num_ntcs: 0x1217
     echo set_led_driver_register: 0x111A
     echo set_led_factory_settings: 0x1118
     echo ctrl_led_brightness: 0x111C
     echo ctrl_led_colors: 0x111B
     echo get_led_driver_register: 0x1119
     echo generate_pwm: 0x1203
     echo generate_clock: 0x1204
     echo get_light_sensor_register: 0x111D
     echo set_light_sensor_register: 0x111E
     echo get_light_intensity: 0x111F
     echo set_light_sensor_factory_settings: 0x1120
     echo start_self_test: 0x1200
     echo get_self_test_results: 0x120B
     echo start_stress_test: 0x1202
     echo start_ext_stpm_current_calibration: 0x120e
     echo start_int_stpm_current_calibration: 0x1212
     echo start_int_stpm_phase_calibration: 0x1220
     echo start_int_stpm_voltage_calibration: 0x1214
     echo get_stpm_last_calibration_status: 0x120f
     echo set_rdp_level: 0x1211
     echo set_system_time: 0x120C
     echo get_system_time: 0x120D
     echo set_deep_sleep_logic: 0x1218
     echo get_deep_sleep_logic: 0x1219
     echo verify_root_certificate_hash: 0x112C
     echo get_safety_fault_type: 0x220A
     echo get_rcd_measured_leakage_dc: 0x220C
     echo get_rcd_measured_leakage_ac: 0x2217
     echo get_rcd_last_trip_leakage: 0x220D
     echo get_relay_state: 0x2206
     echo get_relay_feedback_state: 0x2207
     echo get_test_coil_state: 0x2208
     echo get_cpu_temp: 0x220F
     echo get_safety_ntc_temp: 0x2216
     echo get_rcd_offset: 0x2219
     echo get_rcd_gain: 0x221A
     echo get_rcd_state: 0x2218
     echo get_pe_state: 0x220E
     echo get_firmware_version_safety: 0x2204
     echo get_cp_current_and_pwm: 0x2205
     echo get_unique_identifier: 0x1025
     echo set_maximum_charging_current_per_phase: 0x1026
     echo factory_reset: 0x120A
     echo communicate_reboot: 0x1035
     echo set_evse_availability: 0x1033
     echo get_evse_availability: 0x1034
     echo communicate_bcb_toggle: 0x1036
     echo get_security_pad: 0x103A
     echo generate_security_pad: 0x103B
     echo set_external_ct_coil_type: 0x103E
     echo get_external_ct_coil_type: 0x103F
     echo set_ground_loss_monitor_config: 0x1042
     echo get_ground_loss_monitor_config: 0x1043
     echo write_product_variant_id: 0x1044
     echo get_product_variant_id: 0x1045
     echo test_can_send: 0x1400
     echo set_can_id: 0x1401
     echo test_can_get_msg: 0x1410
     echo set_lock_state: 0x1402
     echo get_lock_state: 0x1403
     echo get_pp_max_current: 0x100E
     echo enable_digital_input1: 0x1404
     echo enable_digital_input2: 0x1405
     echo read_digital_input1_state: 0x1406
     echo read_digital_input2_state: 0x1407
     echo write_digital_output1: 0x1408
     echo write_digital_output2: 0x1409
     echo set_safety_weld_monitoring_state: 0x1411
     echo get_safety_weld_monitoring_state: 0x1412
     echo disable_diagnostics_over_can: 0x1413
     echo get_configured_maximum_charging_current: 0x1414
     echo set_max_static_current: 0x1415
     echo get_max_static_current: 0x1416
     echo set_max_facility_current: 0x1417
     echo get_max_facility_current: 0x1418
end
