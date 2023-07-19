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
    update_focused_file = {
        enable = true,
    },
})

-- Setup theme
require("tokyonight").setup({
    style = "night",
    transparent = true,
    terminal_colors = true,
    styles = {
        sidebars = "dark",
        floats = "dark",
    },
    sidebars = { "qf", "vista_kind", "terminal", "packer" },
})
vim.cmd([[colorscheme tokyonight]])

-- Setup lualine
require("lualine").setup({
    options = {
        theme = "tokyonight",
    },
    sections = {
        lualine_c = {
            require("auto-session.lib").current_session_name,
        },
    },
})

-- Setup bufferline
require("bufferline").setup({})

-- Lsp setup
local lsp = require("lsp-zero").preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil
require("luasnip.loaders.from_vscode").lazy_load()

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
})
cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = cmp_mappings,
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    },
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

-- yank to system clipboard
vim.cmd([[set clipboard+=unnamedplus]])
-- flash on yank
vim.cmd([[au TextYankPost * silent! lua vim.highlight.on_yank()]])

--Autosession setups
require("auto-session").setup({
    log_level = vim.log.levels.ERROR,
    auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    auto_session_use_git_branch = false,

    auto_session_enable_last_session = true,

    -- ⚠️ This will only work if Telescope.nvim is installed
    -- The following are already the default values, no need to provide them if these are already the settings you want.
    session_lens = {
        -- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = false,
    },
})

-- Set mapping for searching a session.
-- ⚠️ This will only work if Telescope.nvim is installed
vim.keymap.set("n", "<leader>ts", require("auto-session.session-lens").search_session, {
    noremap = true,
})
