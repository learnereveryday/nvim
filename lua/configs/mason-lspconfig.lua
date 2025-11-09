local my_lsp = require("configs.lspconfig")

local ignore_install = {}

local function filter(tbl, exclude)
    local res = {}
    for _, item in ipairs(tbl or {}) do
        local skip = false
        for _, ex in ipairs(exclude) do
            if item == ex then
                skip = true
                break
            end
        end
        if not skip then
            table.insert(res, item)
        end
    end
    return res
end

return {
    ensure_installed = filter(my_lsp.servers, ignore_install),
    automatic_installation = false,
}
