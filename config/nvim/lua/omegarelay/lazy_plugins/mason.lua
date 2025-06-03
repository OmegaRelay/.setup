return {
    "williamboman/mason.nvim",
    config = function()
        require("mason").setup()
        vim.keymap.set("n", "<leader>m", vim.cmd.Mason, { desc = "Open [M]ason" })
    end
}
