vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'EdenEast/nightfox.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    use('mbbill/undotree')

    use('tpope/vim-fugitive')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            { 'neovim/nvim-lspconfig' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'rafamadriz/friendly-snippets' },
        }
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true},
        config = function()
            local lualine = require('lualine')

            lualine.setup {
                options = {
                    theme = 'base16',
                }
            }
        end,
    }

    use {
        'VonHeikemen/fine-cmdline.nvim',
        requires = {
            { 'MunifTanjim/nui.nvim' }
        }
    }

    use { 'alexghergh/nvim-tmux-navigation', config = function()
        local nvim_tmux_nav = require('nvim-tmux-navigation')

        nvim_tmux_nav.setup {
            disable_when_zoomed = true -- defaults to false
        }

        vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
        vim.keymap.set('n', "<C-t>", nvim_tmux_nav.NvimTmuxNavigateDown)
        vim.keymap.set('n', "<C-n>", nvim_tmux_nav.NvimTmuxNavigateUp)
        vim.keymap.set('n', "<C-s>", nvim_tmux_nav.NvimTmuxNavigateRight)
        vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
        vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
    end
    }

    use { 'nvim-lua/plenary.nvim' }

    use { 'ThePrimeagen/harpoon' }

    use {
        'mfussenegger/nvim-dap',
        requires = {
            'rcarriga/nvim-dap-ui',
            'leoluz/nvim-dap-go',
            'mfussenegger/nvim-dap-python',
        },
        config = function()
            local dap, dapui = require('dap'), require('dapui')
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

            vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, {})
            vim.keymap.set("n", "<leader>dc", dap.continue, {})
        end,
    }

    use { 'nvim-tree/nvim-web-devicons' }

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use {
        'lervag/vimtex',
    }

    use { 
        'ellisonleao/gruvbox.nvim'
    }

    use {
        'Exafunction/codeium.vim',
      config = function ()
        -- Change '<C-g>' here to any keycode you like.
        vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
        vim.keymap.set('i', '<C-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
        vim.keymap.set('i', '<C-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
        vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
      end,
    }

    use {
        'xiyaowong/transparent.nvim'
    }

    use {
        'ThePrimeagen/vim-be-good'
    }

    use {
        'kepano/flexoki-neovim', as = 'flexoki'
    }

    use {
        'RRethy/nvim-base16'
    }

    use {
        'HiPhish/rainbow-delimiters.nvim'
    }

    use {
        'AlphaTechnolog/pywal.nvim', as = 'pywal'
    }

    use {
        "nvim-neotest/nvim-nio"
    }

    use {
      "folke/which-key.nvim",
      config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("which-key").setup {
        }
      end
    }

    use {
        "nathanaelkane/vim-indent-guides"
    }
end)
