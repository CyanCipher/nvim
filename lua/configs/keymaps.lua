local wk = require("which-key")

vim.g.mapleader = " "


wk.register({
    p = {
        name = "Files",
        v = { vim.cmd.Oil, "File Manager"}
    },
}, { prefix = "<leader>" })

wk.register({
    ["<leader>wq"] = { "<cmd>wq<CR>", "Save and Exit"},
    ["<leader>q"] = { "<cmd>q<CR>", "Quit"},
    ["<leader>w"] = { "<cmd>w<CR>", "Save"},
    ["<leader>y"] = { "\"+y", "Copy"},
    ["<leader>n"] = { "n", "Jump to next search"},
    ["<leader>u"] = { vim.cmd.UndotreeToggle, "UndoTree"}
})

wk.register({
    ["<leader>n"] = { name = "Noice" },
    ["<leader>nd"] = { "<cmd>NoiceDismiss<CR>", "Noice Dismiss"}
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

