local wk = require("which-key")

--Use K to show documentation in preview window.
wk.register({
    ["K"] = { "<cmd>lua show_documentation()<cr>", "Peek token documentation" },
})

function show_documentation()
    if vim.bo.filetype == "vim" or vim.bo.filetype == "help" then
        vim.api.nvim_command("execute 'h '.expand('<cword>')")
    elseif vim.fn["coc#rpc#ready()"] then
        vim.fn.CocActionAsync("doHover")
    else
        vim.api.nvim_command("execute '!' . &keywordprg . ' ' . expand('<cword>')")
    end
end

wk.register({
    --Trigger CoC completion with Ctrl+Space in insert mode.
    ["<C-space>"] = { "coc#refresh()", "Open CoC completion" },
    --Make <enter> select first completion item.
    ["<CR>"] = { "pumvisible() ? coc#_select_confirm() : '<C-g>u<CR><c-r>=coc#on_enter()<CR>'", "CoC confirm selection" },
    --Navigate CoC Completion list with Tab and Shift+Tab.
    ["<TAB>"] = { "pumvisible() ? '<C-n>' : '<TAB>'", "Select next CoC item" },
    ["<S-TAB>"] = { "pumvisible() ? '<C-p>' : '<S-TAB>'", "Select previous CoC item" },
}, { mode = "i", expr = true, silent = true })

--Navigate errors.
wk.register({
    ["[e"] = { "<Plug>(coc-diagnostic-prev)", "Go to previous error" },
    ["]e"] = { "<Plug>(coc-diagnostic-next)", "Go to next error" },
})

--Code navigation. With g prefix.
wk.register({
    ["d"] = { "<Plug>(coc-definition)", "Go to definition" },
    ["y"] = { "<Plug>(coc-type-definition)", "Go to type definition" },
    ["i"] = { "<Plug>(coc-implementation)", "Go to implementation" },
    ["r"] = { "<Plug>(coc-references)", "List references" },
}, { prefix = "g" })

--Map function and class text objects
--NOTE: Requires 'textDocument.documentSymbol' support from the language server.
wk.register({
    ["if"] = { "<Plug>(coc-funcobj-i)", "Inside function" },
    ["af"] = { "<Plug>(coc-funcobj-a)", "Around function" },
    ["ic"] = { "<Plug>(coc-classobj-i)", "Inside class" },
    ["ac"] = { "<Plug>(coc-classobj-a)", "Around class" },
}, { mode = "x" })

wk.register({
    ["if"] = { "<Plug>(coc-funcobj-i)", "Inside function" },
    ["af"] = { "<Plug>(coc-funcobj-a)", "Around function" },
    ["ic"] = { "<Plug>(coc-classobj-i)", "Inside class" },
    ["ac"] = { "<Plug>(coc-classobj-a)", "Around class" },
}, { mode = "o" })

--Code action bindings with <leader>+c.
wk.register({
    name = "+code",
    ["r"] = { "<Plug>(coc-rename)", "Rename token" },
    ["a"] = { "<Plug>(coc-codeaction-line)", "List code actions" },
    ["e"] = { "<cmd>CocList diagnostics<cr>", "List errors" },
    ["o"] = { "<cmd>CocList outline<cr>", "List code outline" },
    ["s"] = { "<cmd>CocList -I symbols<cr>", "List code symbols" },
}, { prefix = "<leader>c" })
