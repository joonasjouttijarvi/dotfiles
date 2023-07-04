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

-- Lsp setup
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup()
