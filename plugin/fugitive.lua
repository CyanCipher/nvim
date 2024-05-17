local wk = require("which-key")

wk.register({
    ["<leader>g"] = { name = "+GIT" },
    ["<leader>gs"] = { vim.cmd.Git, "Fugitive" }
})
