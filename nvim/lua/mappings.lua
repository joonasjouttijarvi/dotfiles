--close :x
vim.keymap.set("n", "X", "<cmd>q<CR>")
-- add to jump list
vim.keymap.set("n", "k", "v:count > 1 ? 'gk' : 'k'", { expr = true })
vim.keymap.set("n", "j", "v:count > 1 ? 'gj' : 'j'", { expr = true })
-- open window on right side of screen sl
vim.keymap.set("n", "<leader>sl", "<C-w>v")
-- save with w
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { silent = true, noremap = true })
-- :noh with leader hl
vim.keymap.set("n", "<leader>/", ":noh<CR>", { silent = true, noremap = true })

-- tabclose with control t
vim.keymap.set("n", "<C-x>", "<cmd>tabclose<CR>", { silent = true, noremap = true })

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- select all text ggVG
vim.keymap.set("n", "<leader>aa", "ggVG", { silent = true, noremap = true })

-- remap for change all instances of word under cursor

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- ################################### PLUGIN MAPPINGS #########################################------
--Nvimtree
vim.keymap.set("n", "<leader>tt", ":Neotree toggle position=float<CR>", { silent = true })

-- Telescope
local builtin = require("telescope.builtin")

-- telescope open commands
vim.keymap.set("n", "<leader>te", ":Telescope<CR>", { silent = true, noremap = true })

vim.keymap.set("n", "<leader>ff", builtin.find_files, { silent = true, noremap = true })
vim.keymap.set("n", "<leader>fs", builtin.grep_string, { silent = true, noremap = true })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { silent = true, noremap = true })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { silent = true, noremap = true })
vim.keymap.set("n", "<leader>fc", builtin.git_commits, { silent = true, noremap = true })
--lsp stuff for telescope
vim.keymap.set("n", "<leader>ft", builtin.treesitter, { silent = true, noremap = true })
vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, { silent = true, noremap = true })
vim.keymap.set("n", "<leader>fi", builtin.lsp_implementations, { silent = true, noremap = true })
vim.keymap.set("n", "<leader>fj", "<cmd>Telescope jumplist<CR>", { silent = true })
vim.keymap.set("n", "<leader>fds", builtin.lsp_document_symbols, { silent = true, noremap = true })

-- Undotree
vim.keymap.set("n", "<leader>uu", ":UndotreeToggle<CR>", { silent = true })

-- lsp
vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>")
vim.keymap.set("n", "<leader>ls", "<cmd>lua vim.lsp.buf.references()<CR>")
vim.keymap.set("n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>")
vim.keymap.set("n", "<leader>fo", "<cmd>lua vim.lsp.buf.format()<CR>")
vim.keymap.set("n", "H", "<cmd>lua vim.lsp.buf.hover()<CR>")

-- Fugitive
vim.keymap.set("n", "<leader>git", ":Git<CR>")
vim.keymap.set("n", "<leader>gl", ":Git pull<CR>")
vim.keymap.set("n", "<leader>gb", ":Git blame<CR>")
vim.keymap.set("n", "<leader>gaa", ":Git add .<CR>")
vim.keymap.set("n", "<leader>gd", ":Gdiffsplit<CR>")

--open terminal window horizontal split on lower half of screen and toggle terminal window
vim.keymap.set("n", "<leader>th", ":belowright split | resize 15 | terminal<CR>", { silent = true })
-- commands in terminal window
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- change working directory to the directory of the open buffer
vim.keymap.set("n", "<leader>cd", ":cd %:p:h<CR>:pwd<CR>")

-- Trouble
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true })
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true })
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true })
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true })
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true })

-- Neoclip

vim.keymap.set("n", "<leader>yh", "<cmd>Telescope neoclip<CR>", { silent = true })

-- Harpoon mappings

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu, { silent = true })
vim.keymap.set("n", "<leader>ha", mark.add_file, { silent = true })

-- dap
vim.keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", { silent = true })
vim.keymap.set("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { silent = true })
vim.keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.step_over()<CR>", { silent = true })
vim.keymap.set("n", "<leader>di", "<cmd>lua require'dap'.step_into()<CR>", { silent = true })
vim.keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<CR>", { silent = true })
-- dapui toggle
vim.keymap.set("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<CR>", { silent = true })

-- diffview

vim.keymap.set("n", "<leader>df", ":DiffviewOpen<CR>", { silent = true })

-- refactor mappings

vim.keymap.set({ "n", "x" }, "<leader>re", function()
	require("telescope").extensions.refactoring.refactors()
end)

-- coderunner mappings

vim.api.nvim_set_keymap("n", "<Leader>rc", ':lua require"coderunner".run_code()<CR>', { noremap = true, silent = true })

-- Zen mode mappings
vim.keymap.set("n", "<leader>zm", ":ZenMode<CR>", { silent = true })

-- markdown preview

vim.keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>", { silent = true })
