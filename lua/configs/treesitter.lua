pcall(function()
    dofile(vim.g.base46_cache .. "syntax")
    dofile(vim.g.base46_cache .. "treesitter")
end)

return {
    ensure_installed = {
        "bash",
        "fish",
        "lua",
        "luadoc",
        "markdown",
        "printf",
        "python",
        "toml",
        "vim",
        "vimdoc",
        "yaml",
    },

    auto_install = true,

    highlight = {
        enable = true,
        use_languagetree = true,
    },

    indent = { enable = true },
}
