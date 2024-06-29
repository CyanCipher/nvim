require('lsp-zero')
local lsp_zero = require('lsp-zero')
local wk = require('which-key')

lsp_zero.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    wk.register({
        m = {
            name = "Def",
            d = { function() vim.lsp.buf.definition() end, "Goto Definition" },
            f = { function() vim.lsp.buf.format({ async = false, timeout_ms = 10000 }) end, "Format" },
        },

        v = {
            name = "+LSP",
            w = { function() vim.lsp.buf.workspace_symbol() end, "Workspace Symbol"},
            c = { function() vim.lsp.buf.code_action() end, "Code Actions"},
            r = { function() vim.lsp.buf.references() end, "References"},
            n = { function() vim.lsp.buf.rename() end, "Rename"},
            k = { function() vim.lsp.buf.hover() end, "Hover Tips"},
            d = {
                name = "+Diagnostic",
                d = { function() vim.diagnostic.open_float() end, "Launch Diagnostics"},
                n = { function() vim.diagnostic.goto_next() end, "Goto Next"},
                p = { function() vim.diagnostic.goto_prev() end, "Goto Previous"},
            }
        },
    }, { prefix = "<leader>" })
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
