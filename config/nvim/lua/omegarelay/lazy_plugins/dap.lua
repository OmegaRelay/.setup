return {
    'mfussenegger/nvim-dap',
    event = "VeryLazy",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "jay-babu/mason-nvim-dap.nvim",
        "theHamsta/nvim-dap-virtual-text",
  },
    config = function()

        local mason_dap = require("mason-nvim-dap")
        local dap = require("dap")
        local ui = require("dapui")
        local dap_virtual_text = require("nvim-dap-virtual-text")

        -- Dap Virtual Text
        dap_virtual_text.setup()

        mason_dap.setup({
            ensure_installed = { "cppdbg" },
            automatic_installation = true,
            handlers = {
                function(config)
                    require("mason-nvim-dap").default_setup(config)
                end,
            },
        })

        -- Configurations
        dap.configurations = {
            c = {
                {
                    name = "Launch file",
                    type = "cppdbg",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopAtEntry = false,
                    MIMode = "lldb",
                },
                {
                    name = "Attach to lldbserver :1234",
                    type = "cppdbg",
                    request = "launch",
                    MIMode = "lldb",
                    miDebuggerServerAddress = "localhost:1234",
                    miDebuggerPath = "/usr/bin/lldb",
                    cwd = "${workspaceFolder}",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                },
            },
        }

        -- Dap UI

        ui.setup()

        -- vim.fn.sign_define("DapBreakpoint", { text = "B" })

        dap.listeners.before.attach.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            ui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            ui.close()
        end



        local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { desc = 'DAP: ' .. desc })
        end


        vim.keymap.set('n', "<leader>d", function() end, { desc = 'DAP' })
        map(
            "<leader>dv", function()
                require("dapui").toggle()
            end, "Toggle UI View")

        map(
            "<leader>dt", function()
                require("dap").toggle_breakpoint()
            end, "Toggle Breakpoint")
        map(
            "<leader>dc",
            function()
                require("dap").continue()
            end, "Continue")
        map(
            "<leader>di",
            function()
                require("dap").step_into()
            end, "Step Into")
        map(
            "<leader>do",
            function()
                require("dap").step_over()
            end, "Step Over")
        map(
            "<leader>du",
            function()
                require("dap").step_out()
            end, "Step Out")
        map(
            "<leader>dr",
            function()
                require("dap").repl.open()
            end, "Open REPL")
        map(
            "<leader>dl",
            function()
                require("dap").run_last()
            end, "Run Last")
        map(
            "<leader>dq",
            function()
                require("dap").terminate()
                require("dapui").close()
                require("nvim-dap-virtual-text").toggle()
            end, "Terminate")
        map(
            "<leader>db",
            function()
                require("dap").list_breakpoints()
            end, "List Breakpoints")
        map(
            "<leader>de",
            function()
                require("dap").set_exception_breakpoints({ "all" })
            end, "Set Exception Breakpoints")
    end
}
