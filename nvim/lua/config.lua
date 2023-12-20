local vim = vim
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups

vim.opt.termguicolors = true
require("catppuccin").setup({
	flavour = "mocha",
	transparent_background = true,
	term_colors = true,
})

vim.cmd("colorscheme catppuccin")

-- Lsp setup

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = cmp.mapping.preset.insert({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	--jump forward
	["<C-f>"] = cmp.mapping.scroll_docs(4),
	-- jump backward
	["<C-b>"] = cmp.mapping.scroll_docs(-4),
	--select with enter
	["<CR>"] = cmp.mapping.confirm(),
	["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil
require("luasnip.loaders.from_vscode").lazy_load()

-- cmp colorscheme with nice palette from tokyonight
-- gray

vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { bg = "NONE", strikethrough = true, fg = "#808080" })
-- blue
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = "NONE", fg = "#569CD6" })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { link = "CmpIntemAbbrMatch" })
-- light blue
vim.api.nvim_set_hl(0, "CmpItemKindVariable", { bg = "NONE", fg = "#9CDCFE" })
vim.api.nvim_set_hl(0, "CmpItemKindInterface", { link = "CmpItemKindVariable" })
vim.api.nvim_set_hl(0, "CmpItemKindText", { link = "CmpItemKindVariable" })
-- pink
vim.api.nvim_set_hl(0, "CmpItemKindFunction", { bg = "NONE", fg = "#C586C0" })
vim.api.nvim_set_hl(0, "CmpItemKindMethod", { link = "CmpItemKindFunction" })
-- front
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { bg = "NONE", fg = "#D4D4D4" })
vim.api.nvim_set_hl(0, "CmpItemKindProperty", { link = "CmpItemKindKeyword" })
vim.api.nvim_set_hl(0, "CmpItemKindUnit", { link = "CmpItemKindKeyword" })

local cmp_kinds = {
	Text = "  ",
	Method = "  ",
	Function = "  ",
	Constructor = "  ",
	Field = "  ",
	Variable = "  ",
	Class = "  ",
	Interface = "  ",
	Module = "  ",
	Property = "  ",
	Unit = "  ",
	Value = "  ",
	Enum = "  ",
	Keyword = "  ",
	Snippet = "  ",
	Color = "  ",
	File = "  ",
	Reference = "  ",
	Folder = "  ",
	EnumMember = "  ",
	Constant = "  ",
	Struct = "  ",
	Event = "  ",
	Operator = "  ",
	TypeParameter = "  ",
	Copilot = "",
}

local function setup_cmp()
	cmp.setup({
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		--cmp window styles
		window = {
			completion = cmp.config.window.bordered({
				border = "none",
			}),
			documentation = cmp.config.window.bordered({
				border = "none",
			}),
		},

		mapping = cmp_mappings,
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
		}, {
			{ name = "path" },
			{ name = "buffer" },
			{ name = "cmp_luasnip" },
			{ name = "cmdline" },
			{ name = "git" },
			{ name = "nvim_lsp_signature_help" },
			{ name = "copilot" },
		}),

		formatting = {
			fields = { "abbr", "kind" },
			format = function(entry, vim_item)
				vim_item.kind = cmp_kinds[vim_item.kind]
				vim_item.abbr = vim_item.abbr:sub(1, 20)
				return vim_item
			end,
		},
	})
end

setup_cmp()

vim.cmd([[
  autocmd BufRead,BufNewFile *.robot setfiletype robot
]])

-- disable newline commenting

vim.cmd([[autocmd FileType * set formatoptions-=ro]])

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	inlay_hints = {
		show_parameter_hints = true,
	},
})

-- Setup telescope
require("telescope").setup({
	-- lsp definitons and references
	preview = {
		filetypes = { "default" },
	},
	-- telescope plugins
	extensions = {
		neoclip = {
			history = true,
		},
		session_lens = {
			shorten_path = true,
			theme_conf = {
				border = true,
				previewer = true,
				prompt = true,
			},
		},
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})

-- Load telescope extensions
require("telescope").load_extension("neoclip")
require("telescope").load_extension("session-lens")
require("telescope").load_extension("refactoring")
require("telescope").load_extension("fzf")

--format on save with conform
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
-- yank to system clipboard
vim.cmd([[set clipboard+=unnamedplus]])
-- flash on yank
vim.cmd([[au TextYankPost * silent! lua vim.highlight.on_yank()]])

-- Setup airblade/vim-footer
vim.g.rooter_patterns = { ".git", "package.json", "Cargo.toml", "go.mod", "Makefile", "pom.xml", "build.gradle" }
vim.g.rooter_silent_chdir = 1

-- Setup harpoon
require("harpoon").setup({
	global_settings = {
		save_on_toggle = true,
		save_on_change = true,
	},
})

-- Setup copilot

vim.g.copilot_filetypes = { yaml = true, json = true, toml = true, lua = true, markdown = true, vim = true }

-- Setup indent-blankline
require("ibl").setup({})

require("dap-vscode-js").setup({
	adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
})

for _, language in ipairs({ "typescript", "javascript" }) do
	require("dap").configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = vim.fn.getcwd(),
			sourceMaps = true,
			protocol = "inspector",
			console = "integratedTerminal",
			internalConsoleOptions = "neverOpen",
			skipFiles = { "<node_internals>/**" },
		},
		{
			type = "pwa-chrome",
			request = "launch",
			name = "Launch Chrome",
			url = "http://localhost:3000",
			webRoot = "${workspaceFolder}",
			sourceMaps = true,
			protocol = "inspector",
			console = "integratedTerminal",
			internalConsoleOptions = "neverOpen",
			skipFiles = { "<node_internals>/**" },
		},
		{
			type = "node-terminal",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = vim.fn.getcwd(),
			sourceMaps = true,
			protocol = "inspector",
			console = "integratedTerminal",
			internalConsoleOptions = "neverOpen",
			skipFiles = { "<node_internals>/**" },
		},
	}
end
-- dapui setup
require("dapui").setup()

-- Setup rust-tools

local rt = require("rust-tools")

rt.setup({})
-- neoclip setup
require("neoclip").setup()

-- triggers CursorHold event faster
vim.opt.updatetime = 200

require("barbecue").setup({
	create_autocmd = false, -- prevent barbecue from updating itself automatically
	theme = {
		-- this highlight is used to override other highlights
		-- you can take advantage of its `bg` and set a background throughout your winbar
		-- (e.g. basename will look like this: { fg = "#c0caf5", bold = true })
		normal = { fg = "#c0caf5" },

		-- these highlights correspond to symbols table from config
		ellipsis = { fg = "#737aa2" },
		separator = { fg = "#737aa2" },
		modified = { fg = "#737aa2" },

		-- these highlights represent the _text_ of three main parts of barbecue
		dirname = { fg = "#737aa2" },
		basename = { bold = true },
		context = {},

		-- these highlights are used for context/navic icons
		context_file = { fg = "#ac8fe4" },
		context_module = { fg = "#ac8fe4" },
		context_namespace = { fg = "#ac8fe4" },
		context_package = { fg = "#ac8fe4" },
		context_class = { fg = "#ac8fe4" },
		context_method = { fg = "#ac8fe4" },
		context_property = { fg = "#ac8fe4" },
		context_field = { fg = "#ac8fe4" },
		context_constructor = { fg = "#ac8fe4" },
		context_enum = { fg = "#ac8fe4" },
		context_interface = { fg = "#ac8fe4" },
		context_function = { fg = "#ac8fe4" },
		context_variable = { fg = "#ac8fe4" },
		context_constant = { fg = "#ac8fe4" },
		context_string = { fg = "#ac8fe4" },
		context_number = { fg = "#ac8fe4" },
		context_boolean = { fg = "#ac8fe4" },
		context_array = { fg = "#ac8fe4" },
		context_object = { fg = "#ac8fe4" },
		context_key = { fg = "#ac8fe4" },
		context_null = { fg = "#ac8fe4" },
		context_enum_member = { fg = "#ac8fe4" },
		context_struct = { fg = "#ac8fe4" },
		context_event = { fg = "#ac8fe4" },
		context_operator = { fg = "#ac8fe4" },
		context_type_parameter = { fg = "#ac8fe4" },
	},
})

vim.api.nvim_create_autocmd({
	"WinResized",
	"BufWinEnter",
	"CursorHold",
	"InsertLeave",

	-- include this if you have set `show_modified` to `true`
	"BufModifiedSet",
}, {
	group = vim.api.nvim_create_augroup("barbecue.updater", {}),
	callback = function()
		require("barbecue.ui").update()
	end,
})
-- colorizer setup
require("colorizer").setup({
	-- disable colorizer for certain filetypes
	disable = {
		"markdown",
		"gitcommit",
		"gitrebase",
		"go",
		"json",
		"yaml",
		"toml",
		"vimwiki",
		"telescope",
		"packer",
		"alpha",
		"nvimtree",
		"undotree",
		"dashboard",
		"flutterToolsOutline",
	},
})

--autopairs setup
require("nvim-autopairs").setup({
	disable_filetype = { "TelescopePrompt", "Alpha" },
})

-- setup refactoring
require("refactoring").setup({})

-- setup coderunner

require("coderunner")

-- setup makdown preview

vim.g.mkdp_browser = "firefox"

vim.cmd([[autocmd BufRead,BufNewFile Jenkinsfile setfiletype groovy]])

-- toggleterm setup
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	hidden = true,
	direction = "float",
	float_opts = {
		border = "single",
		winblend = 3,
	},
})

function Lazygit_toggle()
	lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua Lazygit_toggle()<CR>", { noremap = true, silent = true })
