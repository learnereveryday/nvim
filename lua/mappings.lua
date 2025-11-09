require("nvchad.mappings")

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("t", "<ESC>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

local builtin = require("telescope.builtin")
map("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
map("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
map("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
map("n", "<leader>/", function()
    builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 10,
        previewer = false,
    }))
end, { desc = "[/] Fuzzily search in current buffer" })

-- map yank to OSC52 copy
local osc52 = require("osc52")
map("n", "<leader>y", osc52.copy_operator, { expr = true })
map("n", "<leader>yy", "<leader>y_", { remap = true })
map("v", "<leader>y", osc52.copy_visual)
