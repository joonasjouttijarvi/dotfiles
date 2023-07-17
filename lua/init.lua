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
require("onedark").setup({
    style = "darker",
})
require("onedark").load()

-- Setup lualine
require("lualine").setup({
    options = {
        theme = "onedark",
    },
})

-- Setup bufferline
require("bufferline").setup({})

-- Lsp setup
local lsp = require("lsp-zero").preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

-- cmp setup and enter keymap for confirm
local cmp = require("cmp")

cmp.setup({
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
    },

    require("luasnip.loaders.from_vscode").lazy_load(),
})

lsp.setup()

-- Setup telescope
require("telescope").setup({
    defaults = {
        file_ignore_patterns = { "node_modules" },
    },
})
-- Setup null-ls

local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.eslint_d,
        null_ls.builtins.completion.spell,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.sqlformat,
        null_ls.builtins.formatting.sqlfluff,
        --code actions
    },
})
--format on save
vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])
