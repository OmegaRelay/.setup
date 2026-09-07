return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        local treesitter = require 'nvim-treesitter'
        local ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "go" }
        treesitter.install(ensure_installed)

        -- Highlighting
        vim.api.nvim_create_autocmd('FileType', {
            pattern = { table.concat(treesitter.get_installed(), ",") },
            callback = function() vim.treesitter.start() end,
        })
    end
}
