-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups

vim.opt.termguicolors = true



-- Setup nvim-tree

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- Setup theme 
require('onedark').setup {
    style = 'darker'
}
require('onedark').load()

-- Setup lualine
require('lualine').setup {
    options = {
	theme = 'onedark'
    }
}

-- Setup bufferline
require('bufferline').setup{}

-- Lsp setup
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
 end)

lsp.setup()

-- Setup telescope
require('telescope').setup {
    defaults = {
        file_ignore_patterns = { "node_modules" },
    }
}
-- Setup null-ls

local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.terraform_fmt,
        null_ls.builtins.formatting.sqlformat,
        null_ls.builtins.formatting.sqlfluff,
    },
})

