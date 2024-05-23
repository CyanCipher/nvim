local ht = require('haskell-tools')
local bufnr = vim.api.nvim_get_current_buf()
local opts = { noremap = true, silent = true, buffer = bufnr, }
local wk = require("which-key")
wk.register({
    ["<leader>t"] = { name = "+Haskell"},
    ["<leader>tc"] = { vim.lsp.codelens.run, "CodeLens"},
    ["<leader>th"] = { ht.hoogle.hoogle_signature, "Search for signature"},
    ["<leader>te"] = { ht.lsp.buf_eval_all, "Evaluate code snippet"},
    ["<leader>tr"] = { ht.repl.toggle, "Toggle GHCi repl"},
})
