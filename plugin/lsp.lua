require('lsp-zero')
local lsp_zero = require('lsp-zero')
local wk = require('which-key')

lsp_zero.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    wk.add({
        { "<leader>m", group = "Definition" },
        { "<leader>md", function() vim.lsp.buf.definition() end, desc = "Goto Definition" },
        { "<leader>mf", function() vim.lsp.buf.format({ async = false, timeout_ms = 10000 }) end, desc = "Format" },
        { "<leader>v", group = "LSP" },
        { "<leader>vw", function() vim.lsp.buf.workspace_symbol() end, desc = "Workspace Symbol" },
        { "<leader>vc", function() vim.lsp.buf.code_action() end, desc = "Code Actions" },
        { "<leader>vx", function() vim.lsp.buf.references() end, desc = "References" },
        { "<leader>vr", function() vim.lsp.buf.rename() end, desc = "Rename" },
        { "<leader>vh", function() vim.lsp.buf.hover() end, desc = "Hover Tips" },
        { "<leader>vd", function() vim.diagnostic.open_float() end, desc = "Launch Diagnostics" },
        { "<leader>vdn", function() vim.diagnostic.goto_next() end, desc = "Goto Next" },
        { "<leader>vdp", function() vim.diagnostic.goto_prev() end, desc = "Goto Previous" },
    })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'tsserver', 'pyright', 'lua_ls', 'rust_analyzer', 'clangd' },
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
    }
})


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'luasnip', keyword_length = 2 },
        { name = 'buffer',  keyword_length = 3 },
    },
    formatting = lsp_zero.cmp_format(),
    mapping = cmp.mapping.preset.insert({
        ['<m-t>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<m-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<m-e>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
})

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        {
            name = 'cmdline',
            option = {
                ignore_cmds = {'Man', '!'}
            }
        }
    })
})

require 'lspconfig'.gleam.setup {}
