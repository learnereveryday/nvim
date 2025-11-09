local my_lsp = require("configs.lspconfig")
local utils = require("configs.utils")

local ignore_install = {}

local function filter(tbl, exclude)
    local res = {}
    for _, item in ipairs(tbl or {}) do
        local skip = utils.table_contains(exclude, item)
        if not skip then
            table.insert(res, item)
        end
    end
    return res
end

require("mason-lspconfig").setup({
    ensure_installed = filter(my_lsp.servers, ignore_install),
    automatic_installation = false,
})
