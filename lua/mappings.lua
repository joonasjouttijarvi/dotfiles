local vim = vim
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")
--close :x
vim.keymap.set("n", "Q", "<cmd>q<CR>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)


-- save with W 
vim.keymap.set("n", "<leader>W", "<cmd>w<CR>")


vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

--:so with double leader 
vim.keymap.set("n", "<leader><leader>", "<cmd>:so<CR>")

-- ###########  Plugins mappings ########### --

--Nvimtree
vim.keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>")

-- Telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope grep_string<CR>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")
-- Undotree
vim.keymap.set("n", "<leader>uu", ":UndotreeToggle<CR>")

-- Prettier

vim.keymap.set("n", "<leader>pp", "<cmd>Prettier<CR>")


-- LSP
vim.keymap.set("n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.references()<CR>")
vim.keymap.set("n", "<leader>ls", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
vim.keymap.set("n", "<leader>lS", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")
vim.keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>")
vim.keymap.set("n", "<leader>le", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
vim.keymap.set("n", "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")
vim.keymap.set("n", "<leader>ln", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
vim.keymap.set("n", "<leader>lp", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
vim.keymap.set("n", "<leader>lR", "<cmd>lua vim.lsp.buf.rename()<CR>")
vim.keymap.set("n", "<leader>lD", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
vim.keymap.set("n", "<leader>lI", "<cmd>lua vim.lsp.buf.implementation()<CR>")
vim.keymap.set("n", "<leader>lA", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
vim.keymap.set("n", "<leader>lR", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
vim.keymap.set("n", "<leader>lL", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
vim.keymap.set("n", "<leader>lS", "<cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>")
vim.keymap.set("n", "<leader>lW", "<cmd>lua vim.lsp.buf.document_highlight()<CR>")
vim.keymap.set("n", "<leader>lU", "<cmd>lua vim.lsp.buf.clear_references()<CR>")
vim.keymap.set("n", "<leader>lF", "<cmd>lua vim.lsp.buf.range_formatting()<CR>")
--disable warnings 
vim.keymap.set("n", "<leader>lw", "<cmd>lua vim.lsp.diagnostic.set_signs()<CR>")

