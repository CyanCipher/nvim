local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '

local plugins = {
	'EdenEast/nightfox.nvim',
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		dependencies = { { 'nvim-lua/plenary.nvim' } }
	},
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		lazy = true
	},
	{
		'mbbill/undotree'
	},
	{
		'tpope/vim-fugitive',
		lazy = true
	},
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
                    theme = 'auto'
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
	{
		'nvim-lua/plenary.nvim'
	},
	{
		'ThePrimeagen/harpoon'
	},
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

			wk.add({
				{ "<leader>d", group = "+DAP", icon = "" },
				{ "<leader>dt", dap.toggle_breakpoint, desc ="Toggle Breakpoint" },
				{ "<leader>dc", dap.continue, desc = "Continue" },
                { "<leader>dui", function ()
                    require("dapui").toggle("sidebar");
                end,
                desc = "Debugger UI"},
			})
		end,

	},
    {
	    'nvim-tree/nvim-web-devicons',
    },
    {
        "olexsmir/gopher.nvim",
        ft = "go",
        -- branch = "develop", -- if you want develop branch
                               -- keep in mind, it might break everything
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-treesitter/nvim-treesitter",
          "mfussenegger/nvim-dap", -- (optional) only if you use `gopher.dap`
        },
        -- (optional) will update plugin's deps on every update
        --build = function()
        --  vim.cmd.GoInstallDeps()
        --end,
        ---@type gopher.Config
    opts = {},
    },
	{
		'windwp/nvim-autopairs',
		config = function()
			require("nvim-autopairs").setup {}
		end
	},
	{
		'lervag/vimtex',
		lazy = true
	},
	{
        'morhetz/gruvbox',
		lazy = false 
	},
	{
		'xiyaowong/transparent.nvim',
		lazy = true
	},
	{
		'kepano/flexoki-neovim',
		name = 'flexoki',
		lazy = true
	},
	{
		'RRethy/nvim-base16',
		lazy = true
	},
	{
		'HiPhish/rainbow-delimiters.nvim',
	},
	{
		'AlphaTechnolog/pywal.nvim',
		name = 'pywal',
		lazy = true
	},
	{
		'nvim-neotest/nvim-nio',
		lazy = true
	},
	{
		"folke/which-key.nvim",
		lazy = true,
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		event = "VeryLazy",
		opts = {
		}
	},
	{
		'mrcjkb/haskell-tools.nvim',
		lazy = true
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {}
	},
	{
		'xiyaowong/transparent.nvim',
		lazy = true
	},
	{
		'stevearc/oil.nvim',
		lazy = true,
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"folke/noice.nvim",
		lazy = true,
		event = "VeryLazy",
		opts = {
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		}
	},
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
          -- calling `setup` is optional for customization
          require("fzf-lua").setup({})
        end
    },
	{
		'maxmx03/solarized.nvim',
		lazy = true,
		priority = 1000,
		config = function()
			vim.o.background = 'dark'
			vim.cmd.colorscheme 'solarized'
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = true
	},
	{
		"tadmccorkle/markdown.nvim",
		lazy = true,
		ft = "markdown",
		opts = {
		}
	},
	{
		"lewis6991/gitsigns.nvim",
		lazy = true
	},
	{
		'SmiteshP/nvim-navic',
		lazy = true
	},
	{
		'olimorris/onedarkpro.nvim',
		priority = 1000, -- Ensure it loads first
	},
	{
		'sainnhe/everforest'
	},
	{
		'rebelot/kanagawa.nvim'
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000
	},
	{
		'nyoom-engineering/oxocarbon.nvim',
		lazy = false
	},
    {
        'echasnovski/mini.icons',
        name = 'miniicons',
        priority = 1000
    },
    {
        'jzone1366/twilight.nvim',
        lazy = false
    },
    {
        'paulo-granthon/hyper.nvim',
        lazy = false
    },
    {
        'bluz71/vim-moonfly-colors',
        name = 'moonfly',
        lazy = false,
        priority = 1000
    },
}

local opts = {}

require("lazy").setup(plugins, opts)
