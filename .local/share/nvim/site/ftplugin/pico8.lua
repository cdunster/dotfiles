local wk = require("which-key")

--Local/language specific bindings.
wk.register({
    name = "+PICO-8",
    ["r"] = { "<cmd>!pico8 -run %<cr>", "Run cart in PICO-8" },
    ["e"] = { "<cmd>!pico8 %<cr>", "Edit in PICO-8" },
}, { prefix = "<localleader>" })
