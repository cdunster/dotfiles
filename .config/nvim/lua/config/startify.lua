local M = {}

M.config = function()
    -- Automatically update sessions before quitting or loading a new session.
    vim.g.startify_session_persistence = 1
    -- When opening a file or bookmark, change to the root directory.
    vim.g.startify_change_to_vcs_root = 1
    -- Set header to Unicode instead of ASCII.
    vim.g.startify_fortune_use_unicode = 1
    -- Do not show empty buffer or quit links on the welcome page.
    vim.g.startify_enable_special = 0
    -- Sort the session list by recently used instead of alphabetically.
    vim.g.startify_session_sort = 1

    vim.g.startify_custom_header = vim.fn['startify#center']({
        [[ ╔══╗ ╔══╦═══════╦══╗    ╔══╗    ╔═══════╗    ╔══╗ ╔══╦═══════╦═══════╦══╗    ╔══════╗╔══╗ ]],
        [[ ║  ║ ║  ║  ╔════╣  ║    ║  ║    ║  ╔═╗  ║    ║  ╠═╣  ║  ╔═╗  ║  ╔═╗  ║  ║    ║  ╔╗  ╚╣  ║ ]],
        [[ ║  ║ ║  ║  ║    ║  ║    ║  ║    ║  ║ ║  ║    ║  ║ ║  ║  ║ ║  ║  ║ ║  ║  ║    ║  ║╚╗  ║  ║ ]],
        [[ ║  ╚═╝  ║  ╚═══╗║  ║    ║  ║    ║  ║ ║  ║    ║  ║ ║  ║  ║ ║  ║  ╚═╝  ║  ║    ║  ║ ║  ║  ║ ]],
        [[ ║  ╔═╗  ║  ╔═══╝║  ║    ║  ║    ║  ║ ║  ║    ║  ║ ║  ║  ║ ║  ║  ╔╗  ╔╣  ║    ║  ║ ║  ║  ║ ]],
        [[ ║  ║ ║  ║  ║    ║  ║    ║  ║    ║  ║ ║  ║    ║  ║ ║  ║  ║ ║  ║  ║║  ╚╣  ║    ║  ║╔╝  ╠══╝ ]],
        [[ ║  ║ ║  ║  ╚════╣  ╚════╣  ╚════╣  ╚═╝  ╠═╗  ║  ╝ ╚  ║  ╚═╝  ║  ║╚╗  ║  ╚════╣  ╚╝  ╔╬══╗ ]],
        [[ ╚══╝ ╚══╩═══════╩═══════╩═══════╩═══════╣ ║  ╚═══════╩═══════╩══╝ ╚══╩═══════╩══════╝╚══╝ ]],
        [[                                         ╚═╝                                               ]],
    })

    vim.g.startify_lists = {
        { type = 'sessions',  header = {'   Sessions'}       },
        { type = 'commands',  header = {'   Commands'}       },
        { type = 'bookmarks', header = {'   Bookmarks'}      },
        { type = 'files',     header = {'   Recent Files'}            },
        { type = 'dir',       header = {'   Files in ' .. vim.fn.getcwd()} },
    }

    vim.g.startify_commands = {
        { g = { 'G5+', 'SLoad G5+' } },
        { r = { 'RACE', 'SLoad RACE' } },
        { w = { 'Vimwiki', 'VimwikiIndex' } },
    }
end

return M
