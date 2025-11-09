local lint = require("lint")
local utils = require("configs.utils")

-- List of linters to ignore during install
local ignore_install = {}

require("mason-nvim-lint").setup({
    ensure_installed = utils.filter(lint.linters_by_ft, ignore_install),
    automatic_installation = false,
})
