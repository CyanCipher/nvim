local builtin = require('telescope.builtin')
local wk = require('which-key')

wk.register({
    ["<leader>f"] = { name = "Telescope" },
    ["<leader>ff"] = {builtin.find_files, "Find Files"},
    ["<leader>fo"] = {builtin.oldfiles, "Find Old Files"},
    ["<leader>fb"] = {builtin.buffers, "Find Buffers"},
    ["<leader>fz"] = {builtin.live_grep, "Find Words"},
    ["<leader>fg"] = {builtin.git_files, "Find Git Files"},
})

