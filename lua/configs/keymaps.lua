local wk = require("which-key")

vim.g.mapleader = " "


wk.add({
    { "<leader>p", group = "Files" },
    { "<leader>pv", vim.cmd.Oil, desc = "Launch File Maneger" }
})

wk.add({
    { "<leader>wq", "<cmd>wq<CR>", desc ="Save and Exit" },
    { "<leader>q", "<cmd>q<CR>", desc ="Quit" },
    { "<leader>w", "<cmd>w<CR>", desc ="Save" },
    { "<leader>y", "\"+y", desc ="Copy" },
    { "<leader>n", "n", desc = "Jump to next search" },
    { "<leader>u", vim.cmd.UndotreeToggle, desc = "UndoTree" }
})

wk.add({
    { "<leader>n",  group = "Noice" },
    { "<leader>nd", "<cmd>NoiceDismiss<CR>", desc = "Noice Dismiss" }
})
wk.add({
    { "<leader>g",  group = "Git" },
    { "<leader>gb", ":Gitsigns blame_line<CR>", desc = "Git Blame For current line" },
    { "<leader>gf", vim.cmd.Git,                desc = "Fugitive" }
})

vim.keymap.set("v", "N", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "T", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("v", "<leader>y", "\"+y")

vim.keymap.set("n", "t", "k")
vim.keymap.set("v", "t", "k")
vim.keymap.set("n", "n", "j")
vim.keymap.set("n", "s", "l")
vim.keymap.set("v", "n", "j")
vim.keymap.set("v", "s", "l")
