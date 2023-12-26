-- Function to toggle padding
function toggle_padding()
	if vim.wo.foldcolumn == "0" then
		-- Set padding when foldcolumn is not set
		vim.wo.foldcolumn = "9"
		vim.wo.signcolumn = "yes:9"
	else
		-- Remove padding when foldcolumn is set
		vim.wo.foldcolumn = "0"
		vim.wo.signcolumn = "yes"
	end
end

-- Keymap to toggle the padding
vim.api.nvim_set_keymap("n", "<leader>cm", ":lua toggle_padding()<CR>", { noremap = true, silent = true })
