local builtin = require('telescope.builtin')
local wk = require('which-key')

wk.add({
    { "<leader>f", group = "Telescope" },
    { "<leader>ff", builtin.find_files, desc = "Find Files" },
    { "<leader>fo", builtin.oldfiles, desc = "Find Old Files" },
    { "<leader>fb", builtin.buffers, desc = "Find Buffers" },
    { "<leader>fz", builtin.live_grep, desc = "Find Words" },
    { "<leader>fg", builtin.git_files, desc = "Find Git Files" },
})

