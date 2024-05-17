local builtin = require('telescope.builtin')
local wk = require('which-key')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ss', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

wk.register({
    ["<leader>f"] = { name = "Telescope" },
    ["<leader>ff"] = {builtin.find_files, "Find Files"},
})

