local lint = require('lint')
local wk = require('which-key')

lint.linters_by_ft = {
    markdown = {'vale'},
    python = {'pylint'},
    lua = {'luac'},
    javascript = {'eslint_d'},
    typescript = {'eslint_d'},
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({"BufEnter", "BufWritePost", "InsertLeave" }, {
    group = lint_augroup,
    callback = function()
        lint.try_lint()
    end,
})

wk.add({
    { "<leader>ll", function() lint.try_lint() end, desc = "Trigger linting for current file"},
})
