local M = {}

M.config = function()
    vim.o.completeopt = 'menu,menuone,noselect'

    local cmp = require("cmp")
    cmp.setup({
        snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
        },
        mapping = {
            ["<C-space>"] = cmp.mapping.complete(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ['<Tab>'] = cmp.mapping.select_next_item(),
            ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        },
        sources = {
            -- These are in order of priority. (Top source shown first).
            { name = 'nvim_lsp' },
            { name = 'vsnip' },
            { name = "path" },
            { name = "buffer" },
        },
    })
end

return M
