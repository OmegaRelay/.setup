vim.opt.colorcolumn = "80"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true


-- Focus NvimTree on open
vim.api.nvim_create_autocmd(
    "VimEnter",
    {
        callback = function (args)

            local file = vim.api.nvim_buf_get_name(args.buf)

            if file == "" then
                vim.cmd("NvimTreeFocus")
            end
        end
    }
)

