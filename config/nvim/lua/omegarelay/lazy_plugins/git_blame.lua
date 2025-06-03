return {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    opts = {
        enabled = true,
        message_template = " <author> • <date> • <<sha>>",
        date_format = "%S:%M:%H %d-%m-%Y ",
        virtual_text_column = 80,
    },
}
