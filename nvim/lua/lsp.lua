local nvim_lsp = require("lspconfig")

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "", --  or another preferred icon for error
			[vim.diagnostic.severity.WARN] = "", --  or another preferred icon for warning
			[vim.diagnostic.severity.INFO] = "", --  or another preferred icon for info
			[vim.diagnostic.severity.HINT] = "➤", --  or another preferred icon for hint
		},
	},
})

-- set lsp icons for diagnostics
local diagnostic_signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "➤" },
	{ name = "DiagnosticSignInfo", text = "" },
}
for _, sign in ipairs(diagnostic_signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
end

-- function for toggling inlay hints
local inlay_hints_enabled = false

function ToggleInlayHints()
	inlay_hints_enabled = not inlay_hints_enabled
	if inlay_hints_enabled then
		-- Enable inlay hints
		vim.lsp.inlay_hint.enable(0, true)
	else
		-- Refresh to remove the inlay hints
		vim.lsp.inlay_hint.enable(0, false)
	end
end

vim.api.nvim_set_keymap("n", "<leader>ih", ":lua ToggleInlayHints()<CR>", { noremap = true, silent = true })

require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"pyright",
		"jdtls",
		"robotframework_ls",
		"lua_ls",
		"jsonls",
		"eslint",
		"clangd",
		"yamlls",
	},
	automatic_installation = true,
})

-- Lsp server setups

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("typescript-tools").setup({
	settings = {
		-- spawn additional tsserver instance to calculate diagnostics on it
		separate_diagnostic_server = true,
		-- "change"|"insert_lea" determine when the client asks the server about diagnostic
		publish_diagnostic_on = "insert_leave",
		-- array of strings("fix_all"|"add_missing_imports"|"remove_unused"|
		-- "remove_unused_imports"|"organize_imports") -- or string "all"
		-- to include all supported code actions
		-- specify commands exposed as code_actions
		expose_as_code_action = "all",
		-- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
		-- not exists then standard path resolution strategy is applied
		tsserver_path = nil,
		-- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
		-- (see 💅 `styled-components` support section)
		tsserver_plugins = {},
		-- this value is passed to: https:js.org/api/cli.html#--max-old-space-sizesize-in-megabytes
		-- memory limit in megabytes or "auto"(basically no limit)
		tsserver_max_memory = "auto",
		-- described below
		tsserver_format_options = {},
		tsserver_file_preferences = {
			includeInlayEnumMemberValueHints = true,
			includeInlayFunctionLikeReturnTypeHints = true,
			includeInlayFunctionParameterTypeHints = true,
			includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
			includeInlayParameterNameHintsWhenArgumentMatchesName = true,
			includeInlayPropertyDeclarationTypeHints = true,
			includeInlayVariableTypeHints = true,
			quotePreference = "auto",
		},
		-- locale of all tsserver messages, supported locales you can find here:
		-- https://github.com/microsoft/TypeScript/blob/3c221fc086be52b19801f6e8d82596d04607ede6/src/compiler/utilitiesPublic.ts#L620
		tsserver_locale = "en",
		-- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
		complete_function_calls = true,
		include_completions_with_insert_text = true,
		-- CodeLens
		-- WARNING: Experimental feature also in VSCode, because it might hit performance of server.
		-- possible values: ("off"|"all"|"implementations_only"|"references_only")
		code_lens = "all",
		-- by default code lenses are displayed on all referencable values and for some of you it can
		-- be too much this option reduce count of them by removing member references from lenses
		disable_member_code_lens = false,
	},
})
nvim_lsp.jdtls.setup({
	capabilities = capabilities,
})

nvim_lsp.pyright.setup({
	capabilities = capabilities,
})

nvim_lsp.eslint.setup({
	capabilities = capabilities,
})
nvim_lsp.yamlls.setup({
	capabilities = capabilities,
})
nvim_lsp.robotframework_ls.setup({

	cmd = { "robotframework_ls" },
	filetypes = { "robot" },
	settings = {
		robot = {
			filetype = "robot",
			pythonpath = "/opt/homebrew/lib/python3.11/site-packages/robotframework_ls",
		},
	},
})
nvim_lsp.lua_ls.setup({
	cmd = { "/opt/homebrew/bin/lua-language-server" },
	settings = {
		Lua = {
			hint = {
				enable = true,
				-- list nubering for inlay hints false
			},
			runtime = {
				version = "LuaJIT",
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
		},
	},
})

--clangd setup
nvim_lsp.clangd.setup({})
