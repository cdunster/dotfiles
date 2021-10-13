local M = {}

M.config = function()
    require("nvim-treesitter.configs").setup {
        indent = { enable = true },
        highlight = { enable = true },
        textobjects = {
            select = {
                enable = true,
                -- Automatically jump forward to textobj.
                lookahead = true,
                keymaps = {
                    -- Use capture groups defined in textobjects.scm
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                },
            },
        },
    }

    -- Add Which Key descriptions to bindings.
    local wk = require("which-key")
    wk.register({
        ["if"] = "inner function",
        ["af"] = "a function",
    }, { mode = "x" })

    wk.register({
        ["if"] = "inner function",
        ["af"] = "a function",
    }, { mode = "o" })

end

return M
