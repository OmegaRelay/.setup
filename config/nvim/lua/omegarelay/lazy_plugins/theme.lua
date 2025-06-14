function ApplyColorScheme(color)
    color = color or "everforest"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    'sainnhe/everforest',
    config = function()
        ApplyColorScheme()
    end,
}
