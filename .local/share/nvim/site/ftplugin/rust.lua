--Format code on save.
vim.g.rustfmt_autosave = 1

local wk = require("which-key")

--Local/language specific bindings.
wk.register({
    name = "+Rust lang",
    ["r"] = { "<cmd>Crun<cr>", "Cargo run" },
    ["t"] = { "<cmd>Ctest<cr>", "Cargo test" },
    ["T"] = { "<cmd>RustTest<cr>", "Run test under cursor" },
}, { prefix = "<localleader>" })
