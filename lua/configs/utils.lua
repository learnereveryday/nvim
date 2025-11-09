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

-- return a new table excluding items from the exclude list
function M.filter(tbl, exclude)
    local res = {}
    for _, item in ipairs(tbl or {}) do
        local skip = M.table_contains(exclude, item)
        if not skip then
            table.insert(res, item)
        end
    end
    return res
end

return M
