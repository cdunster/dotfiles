local M = {}

M.config = function()
    vim.g.vimwiki_list = {{
        path = '~/Dropbox/vimwiki',
        syntax = 'markdown',
        ext = '.md',
        links_space_char = '_'
    }}

    local wk = require("which-key")

    --Vimwiki key bindings for <leader>+w.
    wk.register({
        name = "+vimwiki",
        ["w"] = "Open default wiki index file",
        ["t"] = "Open default wiki index file in new tab",
        ["s"] = "List available wiki index files",
        ["i"] = "Open default diary index file",
    }, { prefix = "<leader>w"})

    --Vimwiki diary key bindings for <leader>+w+<leader>.
    wk.register({
        name = "+diary",
        ["i"] = "Generate diary links",
        ["w"] = "Open today's entry",
        ["t"] = "Open today's entry in new tab",
        ["m"] = "Open tomorrow's entry",
        ["y"] = "Open yesterday's entry",
    }, { prefix = "<leader>w<leader>"})
end

return M
