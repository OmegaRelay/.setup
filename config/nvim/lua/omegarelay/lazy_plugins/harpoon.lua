return {
    'theprimeagen/harpoon',
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "[A]dd File to Harpoon" })
        vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
    end
}
