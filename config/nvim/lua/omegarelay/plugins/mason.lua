return {
    "mason-org/mason.nvim",
    config = function()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })
        vim.keymap.set("n", "<leader>m", vim.cmd.Mason, { desc = "Open [M]ason" })
    end
}
