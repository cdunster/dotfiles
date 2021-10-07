--Set the custom statusline.
--TODO: Use proper Lua API when supported.
vim.api.nvim_exec([[
    set statusline=                                                             "Clear the statusline.
    set statusline+=[%n]                                                        "Add the buffer number to the statusline.
    set statusline+=\ %<%f%m                                                    "Add file name and modified/readonly flag to the statusline.
    set statusline+=\ %{v:lua.LspStatus()}                                      "Add warning and error count from LSP.
    set statusline+=%=                                                          "Right-align the following.
    set statusline+=%{FugitiveHead()}                                           "Add the git branch name.
]], false)

function _G.LspStatus()
    if vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
        return ""
    end

    local err = vim.lsp.diagnostic.get_count(0, [[Error]])
    local warn = vim.lsp.diagnostic.get_count(0, [[Warning]])
    return "E"..tostring(err).." W"..tostring(warn)
end
