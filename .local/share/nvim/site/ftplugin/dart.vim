"Do not show the output when running a Flutter command.
let g:flutter_show_log_on_run = 0

"Local/language specific bindings.
let g:which_key_map['l'] = {
    \ 'name': '+local/lang',
    \ 'e': [':FlutterEmulatorsLaunch flutter_emulator', 'launch-emulator'],
    \ 'l': [':FlutterRun', 'launch-app'],
    \ 'r': [':FlutterHotReload', 'hot-reload'],
    \ 'R': [':FlutterHotRestart', 'hot-restart'],
    \ 'q': [':FlutterQuit', 'quit-app'],
    \ }

