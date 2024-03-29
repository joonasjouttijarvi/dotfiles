local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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
vim.g.mapleader = " "
require("lazy").setup({

	-------------------- Pluugins --------------------

	-- Mason

	{
		"williamboman/mason.nvim",
	},
	-- nvim-neo-tree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	},
	-- Lsp

	-- LSP Support
	{ "neovim/nvim-lspconfig" }, -- Required
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" }, -- Optional

	-- Autocompletion
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-nvim-lua" },
	{ "saadparwaiz1/cmp_luasnip" },
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
	},
	{ "rafamadriz/friendly-snippets" },

	-- Zenmode
	{ "folke/zen-mode.nvim" },

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- fzf telescope

	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	},

	--catpuccin
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	--Undo tree
	{ "mbbill/undotree" },

	--Fugitive
	{ "tpope/vim-fugitive" },

	--commenting
	{ "tpope/vim-commentary" },

	-- alpha vim startup screen
	{
		"goolord/alpha-nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
	},
	-- Trouble
	{
		"folke/trouble.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				position = "bottom",
				icons = true,
				auto_open = false,
				mode = "workspace_diagnostics",
				signs = {
					warning = "⚠",
					hint = "➤",
					information = "ℹ",
					other = "⚡",
				},
				use_diagnostic_signs = true,
			})
		end,
	},

	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"kyazdani42/nvim-web-devicons", -- optional dependency
		},
	},
	-- airblade rooter
	{ "airblade/vim-rooter" },

	-- The greatest of all plugins ever made by mankind (and womankind) and its blazingly fast
	{ "theprimeagen/harpoon" },

	-- lspkind
	{ "onsails/lspkind-nvim" },

	-- indent-blankline
	{ "lukas-reineke/indent-blankline.nvim" },

	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"mxsdev/nvim-dap-vscode-js",
			-- build debugger from source
			{
				"microsoft/vscode-js-debug",
				opt = true,
				run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
			},
		},
	},
	{
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				log_level = "error",
				auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			})
		end,
	},
	{
		"rmagatti/session-lens",
		config = function()
			require("session-lens").setup({})
		end,
	},
	-- Copilot
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				filetypes = {
					yaml = false,
					markdown = false,
					help = false,
					gitcommit = false,
					gitrebase = false,
					hgcommit = false,
					svn = false,
					cvs = false,
					["."] = false,
				},
			})
		end,
	},

	--Neoclip
	{ "AckslD/nvim-neoclip.lua" },

	-- colorizer
	{ "NvChad/nvim-colorizer.lua" },

	-- toggleterm
	{
		"akinsho/toggleterm.nvim",
		version = "*",
	},

	-- Markdown preview

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	-- Autopairs
	{ "windwp/nvim-autopairs" },

	-- refactoring primeagen

	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("refactoring").setup()
		end,
	},
	--treesitter autotag
	{ "windwp/nvim-ts-autotag" },
	-- surround

	{ "tpope/vim-surround" },

	-- diffview

	{
		"sindrets/diffview.nvim",
		config = function()
			require("diffview").setup()
		end,
	},

	-- catppuccin

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},

	-- "magnificient" coderunner plugin
	{ "joonasjouttijarvi/nvim-coderunner" },

	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neo-tree/neo-tree.nvim",
		},
		config = function()
			require("lsp-file-operations").setup()
		end,
	},

	-- clangd extensions
	{ "p00f/clangd_extensions.nvim" },

	-- none ls
	{ "nvimtools/none-ls.nvim" },

	-- 3rd
	{
		"3rd/image.nvim",
		lazy = true,
	},

	-- onedark theme
	{ "navarasu/onedark.nvim" },

	-- react snippets
	{
		"dsznajder/vscode-es7-javascript-react-snippets",
		lazy = true,
	},

	-- gitsigns
	{ "lewis6991/gitsigns.nvim" },

	-- copilot chat
	{
		"jellydn/CopilotChat.nvim",
		dependencies = { "github/copilot.vim" },
		opts = {
			show_help = "no", -- Show help text for CopilotChatInPlace, default: yes
			debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
		},
		build = function()
			vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
		end,
		event = "VeryLazy",
	},
})
