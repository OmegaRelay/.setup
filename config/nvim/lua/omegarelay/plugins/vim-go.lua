return {
    "fatih/vim-go",
    config = function()
        vim.g.go_addtags_transform = "camelcase"
        vim.g.go_addtags_skip_unexported = true
    end,
}
