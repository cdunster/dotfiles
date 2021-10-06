--Do not show the output when running a Flutter command.
vim.g.flutter_show_log_on_run = 0

local wk = require("which-key")

--Local/language specific bindings.
wk.register({
    name = "+Dart lang",
    ["e"] = { "<cmd>FlutterEmulatorsLaunch flutter_emulator<cr>", "Launch emulator" },
    ["l"] = { "<cmd>FlutterRun<cr>", "Launch app" },
    ["r"] = { "<cmd>FlutterHotReload<cr>", "Hot reload" },
    ["R"] = { "<cmd>FlutterHotRestart<cr>", "Hot restart" },
    ["q"] = { "<cmd>FlutterQuit<cr>", "Quit app" },
}, { prefix = "<localleader>", buffer = 0 })
