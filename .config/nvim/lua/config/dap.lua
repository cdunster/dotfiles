local M = {}

M.config = function()
    local dap = require("dap")

    -- Setup lldb-vscode adapter.
    dap.adapters.lldb = {
        type = "executable",
        command = "/usr/bin/lldb-vscode",
        name = "lldb"
    }

    -- Setup debug configurations for C.
    dap.configurations.c = {
        {
            name = "Launch",
            type = "lldb",
            request = "launch",
            program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
            args = {},
            runInTerminal = false,
        },
        {
            name = "Attach to Remote",
            type = "lldb",
            request = "launch",
            program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
            MIMode = "gdb",
            miDebuggerServerAddress = "localhost:3333",
            miDebuggerPath = "/usr/bin/gdb-multiarch",
        },
    }

    -- Add a UI to navigate DAP.
    require("dapui").setup()

    -- Show parameter values as virtual text when debugging.
    require("nvim-dap-virtual-text").setup()

    local wk = require("which-key")
    wk.register({
        ["d"] = { "<cmd>lua require('dapui').open()<CR>", "Open debugger" },
        ["D"] = { "<cmd>lua require('dap').close() require('dapui').close()<CR>", "Open debugger" },
        ["b"] = { "<cmd>lua require('dap').toggle_breakpoint()<CR>", "Toggle breakpoint" },
        ["v"] = { "<cmd>lua require('dapui').eval()<CR>", "Evaluate expression" },
    }, { prefix = "<leader>c" })

    wk.register({
        ["v"] = { "<cmd>lua require('dapui').eval()<CR>", "Evaluate expression" },
    }, { mode = "v", prefix = "<leader>c" })

    wk.register({
        ["<F5>"] = { "<cmd>lua require('dap').continue()<CR>", "Debug continue" },
        ["<F10>"] = { "<cmd>lua require('dap').step_over()<CR>", "Debug step over" },
        ["<F11>"] = { "<cmd>lua require('dap').step_into()<CR>", "Debug step into" },
    })
end

return M
