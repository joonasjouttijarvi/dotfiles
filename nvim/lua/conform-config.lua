local M = {}

function M.setup()
	local conform = require("conform")
	conform.setup({
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "autoflake", "black" },
			javascript = { "prettier" },
			java = { "google-java-format" },
			cs = { "dotnet-format" },
			html = { "prettier" },
			css = { "prettier" },
			scss = { "prettier" },
			json = { "prettier" },
			yaml = { "yamlfmt" },
			markdown = { "prettier" },
			groovy = { "prettier" },
			cpp = { "clang-format" },
		},
	})
end

return M
