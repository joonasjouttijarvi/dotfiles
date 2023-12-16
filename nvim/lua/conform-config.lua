local M = {}

function M.setup()
	local conform = require("conform")
	conform.setup({
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "autoflake", "black" },
			javascript = { "prettier" },
			java = { "google-java-format" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			cs = { "dotnet-format" },
			html = { "prettier" },
			css = { "prettier" },
			scss = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			groovy = { "prettier" },
		},
	})
end

return M
