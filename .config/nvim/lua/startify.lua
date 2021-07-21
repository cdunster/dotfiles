-- Automatically update sessions before quitting or loading a new session.
vim.g.startify_session_persistence = 1
-- When opening a file or bookmark, change to the root directory.
vim.g.startify_change_to_vcs_root = 1
-- Set header to Unicode instead of ASCII.
vim.g.startify_fortune_use_unicode = 1
-- Do not show empty buffer or quit links on the welcome page.
vim.g.startify_enable_special = 0

vim.g.startify_custom_header = vim.fn['startify#center']({
    [[ __  __          ___    ___                 __      __                 ___       __  ____     ]],
    [[/\ \/\ \        /\_ \  /\_ \               /\ \  __/\ \               /\_ \     /\ \ \/\ \    ]],
    [[\ \ \_\ \     __\//\ \ \//\ \     ___      \ \ \/\ \ \ \    ___   _ __\//\ \    \_\ \ \ \ \   ]],
    [[ \ \  _  \  / __`\\ \ \  \ \ \   / __`\     \ \ \ \ \ \ \  / __`\/\` __\\ \ \   / _` \ \ \ \  ]],
    [[  \ \ \ \ \/\  __/ \_\ \_ \_\ \_/\ \L\ \__   \ \ \_/ \_\ \/\ \L\ \ \ \/  \_\ \_/\ \L\ \ \ \_\ ]],
    [[   \ \_\ \_\ \____\/\____\/\____\ \____/\ \   \ `\___x___/\ \____/\ \_\  /\____\ \___,_\ \/\_\]],
    [[    \/_/\/_/\/____/\/____/\/____/\/___/\ \/    \/___//__/  \/___/  \/_/  \/____/\/__,_ /\ \/_/]],
    [[                                        \/                                                    ]],
})

vim.g.startify_lists = {
    { type = 'sessions',  header = {'   Sessions'}       },
    { type = 'bookmarks', header = {'   Bookmarks'}      },
    { type = 'files',     header = {'   Recent Files'}            },
    { type = 'dir',       header = {'   Files in ' .. vim.fn.getcwd()} },
    { type = 'commands',  header = {'   Commands'}       }
}

