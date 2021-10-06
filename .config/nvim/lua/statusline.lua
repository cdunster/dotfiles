--Set the custom statusline.
--TODO: Use proper Lua API when supported.
vim.api.nvim_exec([[
    set statusline=                                                             "Clear the statusline.
    set statusline+=[%n]                                                        "Add the buffer number to the statusline.
    set statusline+=\ %<%f%m                                                    "Add file name and modified/readonly flag to the statusline.
    set statusline+=\ %{coc#status()}%{get(b:,'coc_current_function','')}       "Add warning and error count from LSP.
    set statusline+=%=                                                          "Right-align the following.
    set statusline+=%{FugitiveHead()}                                           "Add the git branch name.
]], false)
