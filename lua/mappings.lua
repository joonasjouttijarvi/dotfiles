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


-- save with w 
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")

-- make directory named 'new folder' in current directory
vim.keymap.set("n", "<leader>mk", "<cmd>!mkdir -p new_folder<CR>")

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
vim.keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>",{ silent = true })
--focus nvimtree
vim.keymap.set("n", "<leader>f", ":NvimTreeFocus<CR>")
--refresh nvimtree control + r)
vim.keymap.set("n", "<leader>r", ":NvimTreeRefresh<CR>")

-- telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope grep_string<CR>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")
-- Undotree
vim.keymap.set("n", "<leader>uu", ":UndotreeToggle<CR>")
-- LSP-zero


vim.keymap.set("n", "<leader>lsp", ":LspInfo<CR>")



-- lsp
vim.keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set ("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>")
vim.keymap.set ("n", "<leader>ls", "<cmd>lua vim.lsp.buf.references()<CR>")
vim.keymap.set ("n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set ("n", "<leader>lf", "<cmd>lua vim.lsp.buf.implementation()<CR>")


-- Prettier
vim.keymap.set("n", "<leader>pe", ":Prettier<CR>")


