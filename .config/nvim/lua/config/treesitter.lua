local M = {}

M.config = function()
    require("nvim-treesitter.configs").setup {
        indent = { enable = true },
        highlight = { enable = true },
    }
end

return M
