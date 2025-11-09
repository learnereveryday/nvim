local lint = require("lint")
local utils = require("configs.utils")

local ignore_install = {}

local function filter(tbl, exclude)
    local res = {}
    for _, v in pairs(tbl) do
        for _, linter in ipairs(v) do
            if not utils.table_contains(exclude, linter) then
                table.insert(res, linter)
            end
        end
    end
    return res
end

require("mason-nvim-lint").setup({
    ensure_installed = filter(lint.linters_by_ft, ignore_install),
    automatic_installation = false,
})
-- require("mason-nvim-lint").setup({
--     ensure_installed = filter(lint.linters_by_ft, ignore_install),
--     automatic_installation = false,
-- })
