local my_lsp = require("configs.lspconfig")
local utils = require("configs.utils")

local ignore_install = {}

return {
    ensure_installed = utils.filter(my_lsp.servers, ignore_install),
    automatic_installation = false,
}
