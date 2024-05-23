local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '

local plugins = {
    'wbthomason/packer.nvim',
    'EdenEast/nightfox.nvim',
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    'mbbill/undotree',
    'tpope/vim-fugitive',
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            { 'neovim/nvim-lspconfig' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-cmdline' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'rafamadriz/friendly-snippets' },
        }
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function()
            local lualine = require('lualine')

            lualine.setup {
                options = {
                    theme = 'base16',
                }
            }
        end,
    },
    {
        'alexghergh/nvim-tmux-navigation',
        config = function()
            local nvim_tmux_nav = require('nvim-tmux-navigation')

            nvim_tmux_nav.setup {
                disable_when_zoomed = true
            }

            vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
            vim.keymap.set('n', "<C-t>", nvim_tmux_nav.NvimTmuxNavigateDown)
            vim.keymap.set('n', "<C-n>", nvim_tmux_nav.NvimTmuxNavigateUp)
            vim.keymap.set('n', "<C-s>", nvim_tmux_nav.NvimTmuxNavigateRight)
            vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
            vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
        end
    },
    'nvim-lua/plenary.nvim',
    'ThePrimeagen/harpoon',
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'rcarriga/nvim-dap-ui',
            'leoluz/nvim-dap-go',
            'mfussenegger/nvim-dap-python',
        },
        config = function()
            local dap, dapui = require('dap'), require('dapui')
            local wk = require("which-key")
            require('dap-go').setup()
            require('dapui').setup()
            require('dap-python').setup()
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end

            wk.register({
                ["<leader>d"] = { name = "+DAP"},
                ["<leader>dt"] = {dap.toggle_breakpoint, "Toggle Breakpoint"},
                ["<leader>dc"] = {dap.continue, "Continue"},

            })
        end,

    },
    'nvim-tree/nvim-web-devicons',
    {
        'windwp/nvim-autopairs',
        config = function()
            require("nvim-autopairs").setup {}
        end
    },
    'lervag/vimtex',
    'ellisonleao/gruvbox.nvim',
    'xiyaowong/transparent.nvim',
    { 'kepano/flexoki-neovim',           name = 'flexoki' },
    'RRethy/nvim-base16',
    'HiPhish/rainbow-delimiters.nvim',
    { 'AlphaTechnolog/pywal.nvim', name = 'pywal' },
    'nvim-neotest/nvim-nio',
    {
        "folke/which-key.nvim",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        event = "VeryLazy",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    'mrcjkb/haskell-tools.nvim',
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    'xiyaowong/transparent.nvim',
    {
      'stevearc/oil.nvim',
      opts = {},
      dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
      "folke/noice.nvim",
      event = "VeryLazy",
      opts = {
        -- add any options here
      },
      dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        "rcarriga/nvim-notify",
        }
    },
    {
        'maxmx03/solarized.nvim',
        lazy = false,
        priority = 1000,
        config = function()
          vim.o.background = 'dark' -- or 'light'

          vim.cmd.colorscheme 'solarized'
        end,
    },
    { "rose-pine/neovim", name = "rose-pine" },
    {
      "tadmccorkle/markdown.nvim",
      ft = "markdown", -- or 'event = "VeryLazy"'
      opts = {
        -- configuration here or empty for defaults
    }
}
}

local opts = {}

require("lazy").setup(plugins, opts)
