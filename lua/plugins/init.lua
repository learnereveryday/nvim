return {
    { import = "nvchad.blink.lazyspec" },

    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        opts = require("configs.treesitter"),
    },

    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- uncomment for format on save
        opts = require("configs.conform"),
    },

    {
        "zapling/mason-conform.nvim",
        event = "VeryLazy",
        dependencies = { "conform.nvim" },
        opts = require("configs.mason-conform"),
    },

    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.lint")
        end,
    },

    {
        "rshkarin/mason-nvim-lint",
        event = "VeryLazy",
        dependencies = { "nvim-lint" },
        config = function()
            require("configs.mason-lint")
        end,
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.lspconfig")
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lspconfig" },
        config = function()
            require("configs.mason-lspconfig")
        end,
    },

    {
        "ojroques/nvim-osc52",
        config = function()
            local osc52 = require("osc52")

            -- integrate with clipboard
            vim.g.clipboard = {
                name = "osc52",
                copy = {
                    ["+"] = osc52.copy,
                    ["*"] = osc52.copy,
                },
                paste = {
                    ["+"] = function()
                        return {}
                    end,
                    ["*"] = function()
                        return {}
                    end,
                },
            }

            vim.o.clipboard = "unnamedplus"
        end,
    },
}
