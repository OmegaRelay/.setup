return {
    'mfussenegger/nvim-dap',
    recommended = true,
    desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",

    dependencies = {
        "rcarriga/nvim-dap-ui",
        "jay-babu/mason-nvim-dap.nvim",
        -- virtual text for the debugger
        {
            "theHamsta/nvim-dap-virtual-text",
            opts = {},
        },
    },
    config = function()
        local dap = require("dap")

        vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

        -- setup dap config by VsCode launch.json file
        local vscode = require("dap.ext.vscode")
        local json = require("plenary.json")
        vscode.json_decode = function(str)
            return vim.json.decode(json.json_strip_comments(str))
        end

        local widgets = require("dap.ui.widgets")
        local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { desc = desc })
        end

        map("<leader>dB", function()
            dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
        end, "Breakpoint Condition")
        map("<leader>db", function()
            dap.toggle_breakpoint()
        end, "Toggle Breakpoint")
        map("<leader>dc", function()
            dap.continue()
        end, "Run/Continue")
        map("<leader>da", function()
            dap.continue({ before = get_args })
        end, "Run with Args")
        map("<leader>dC", function()
            dap.run_to_cursor()
        end, "Run to Cursor")
        map("<leader>dg", function()
            dap.goto_()
        end, "Go to Line (No Execute)")
        map("<leader>di", function()
            dap.step_into()
        end, "Step Into")
        map("<leader>dj", function()
            dap.down()
        end, "Down")
        map("<leader>dk", function()
            dap.up()
        end, "Up")
        map("<leader>dl", function()
            dap.run_last()
        end, "Run Last")
        map("<leader>do", function()
            dap.step_over()
        end, "Step Over")
        map("<leader>dO", function()
            dap.step_out()
        end, "Step Out")
        map("<leader>dP", function()
            dap.pause()
        end, "Pause")
        map("<leader>dr", function()
            dap.repl.toggle()
        end, "Toggle REPL")
        map("<leader>ds", function()
            dap.session()
        end, "Session")
        map("<leader>dt", function()
            dap.terminate()
        end, "Terminate")
        map("<leader>dw", function()
            widgets.hover()
        end, "Widgets")
    end,
}
