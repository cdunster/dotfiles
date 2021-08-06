function send_diag
    argparse -x 'dst,pow,saf,com' 'dst=' 'pow' 'saf' 'com' 't/timeout=!_validate_int' 's/service=' 'd/data=' -- $argv
    or return

    if test "$argv[1]" = "factory"
        diag --serial=/dev/ttyUSB0 --powermode factory
        return
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

