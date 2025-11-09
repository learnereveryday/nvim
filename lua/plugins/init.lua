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
        opts = require("configs.mason-lspconfig"),
    },

    {
        "ojroques/nvim-osc52",
        event = "VeryLazy", -- or remove this to load immediately
        config = function()
            local osc52 = require("osc52")

            -- map yank to OSC52 copy
            vim.keymap.set("n", "<leader>y", osc52.copy_operator, { expr = true })
            vim.keymap.set("n", "<leader>yy", "<leader>y_", { remap = true })
            vim.keymap.set("v", "<leader>y", osc52.copy_visual)

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

            vim.opt.clipboard = "unnamedplus"
        end,
    },
    -- test new blink
    -- {
    -- 	"nvim-treesitter/nvim-treesitter",
    -- 	opts = {
    -- 		ensure_installed = {
    -- 			"vim", "lua", "vimdoc",
    --      "html", "css"
    -- 		},
    -- 	},
    -- },
}
