local M = {}

require("git-worktree").on_tree_change(
    function(op, metadata)
        require("plenary.job"):new({
            "git", "submodule", "update", "--recursive", "--init"
        }):start()
    end
)

M.config = function()
    require("telescope").load_extension("git_worktree")

    local wk = require("which-key")
    wk.register({
        name = "+worktrees",
        ["n"] = { "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>", "Create new worktree" },
        ["w"] = { "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", "List worktrees" },
    }, { prefix = "<leader>gw" })
end

return M
