function setup_g5plus
    echo -e "Putting Power Board in Factory Mode\n----------------------------------------"
    send_diag factory

    echo -e "\nErasing Persistent Storage (EEPROM)\n----------------------------------------"
    send_diag 0x1040

    echo -e "\nWriting Product Variant ID\n----------------------------------------"
    send_diag 0x1044 '0A00'

    echo -e "\nWriting Product Number\n----------------------------------------"
    send_diag 0x1002 '001122334455667788990011'

    echo -e "\nSetting Number of Phases\n----------------------------------------"
    send_diag 0x1216 0x01

    echo -e "\nSetting Critical Temperature Threshold\n----------------------------------------"
    send_diag 0x1017 '00009642'

    echo -e "\nSetting Over Temperature Threshold\n----------------------------------------"
    send_diag 0x102E '00009042'

    echo -e "\nSetting High Temperature Threshold\n----------------------------------------"
    send_diag 0x1019 '00008842'

    echo -e "\nSetting Low Temperature Threshold\n----------------------------------------"
    send_diag 0x101B '0000f0c1'

    echo -e "\nResetting Power Controller\n----------------------------------------"
    send_diag 0x1103
end

