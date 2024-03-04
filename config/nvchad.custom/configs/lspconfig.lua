local base = require("plugins.configs.lspconfig")

local on_attach = base.on_attach
local capabilities = base.capabilities


local lspconfig = require("lspconfig")

lspconfig.clangd.setup {
    on_attach = function (client, bufnr)
        client.server_capabilities.signatureHelpProvider = false
        on_attach(client, bufnr)
    end
}

-- lspconfig.cmake.setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
--     filetypes = {
--         "cmake",
--     },
--     root_dir = lspconfig.util.root_pattern("build/"),
-- })

lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"rust"},
    root_dir = lspconfig.util.root_pattern("Cargo.toml"),
})
