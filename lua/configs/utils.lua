local M = {}

-- check if a table contains a value
function M.table_contains(tbl, value)
    for _, v in ipairs(tbl or {}) do
        if v == value then
            return true
        end
    end
    return false
end

return M
