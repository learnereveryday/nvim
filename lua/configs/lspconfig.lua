-- 1. Load NvChad's LSP defaults (on_attach, capabilities, etc.)
local nvlsp = require("nvchad.configs.lspconfig")
nvlsp.defaults()

local on_attach = nvlsp.on_attach
local on_init = nvlsp.on_init
local capabilities = nvlsp.capabilities

-- 2. List of servers you want enabled
local servers = { "cssls", "html", "lua_ls", "pyright" }

for _, lsp in ipairs(servers) do
    vim.lsp.config(lsp, {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
    })
end

-- 3. Optional: special config for lua_ls
vim.lsp.config("lua_ls", {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                enable = true, -- tutorial example
            },
            workspace = {
                library = {
                    vim.fn.expand("$VIMRUNTIME/lua"),
                    vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
                    vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
                    vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
})

-- 4. Finally, enable all servers using the defaults + any overrides above
vim.lsp.enable(servers)

return {
    servers = servers,
}
