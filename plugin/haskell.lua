local ht = require('haskell-tools')
local bufnr = vim.api.nvim_get_current_buf()
local opts = { noremap = true, silent = true, buffer = bufnr, }
local wk = require("which-key")
wk.add({
    { "<leader>t", group = "Haskell" },
    { "<leader>tc", vim.lsp.codelens.run, desc = "CodeLens" },
    { "<leader>th", ht.hoogle.hoogle_signature, desc = "Search for signature" },
    { "<leader>te", ht.lsp.buf_eval_all, desc = "Evaluate code snippet" },
    { "<leader>tr", ht.repl.toggle, desc = "Toggle GHCi repl" },
})
