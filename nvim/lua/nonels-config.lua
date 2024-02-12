local null_ls = require("null-ls")

null_ls.setup({
  sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.completion.spell,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.clang_format,
		-- null_ls.builtins.diagnostics.cpplint,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.isort,
		null_ls.builtins.formatting.autoflake,
		null_ls.builtins.formatting.google_java_format,
		null_ls.builtins.diagnostics.gitlint,
    -- null_ls.builtins.diagnostics.eslint_d,
	},
})
