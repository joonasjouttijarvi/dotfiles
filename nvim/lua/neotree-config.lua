local M = {}

function M.setup()
	local neo_tree = require("neo-tree")
	neo_tree.setup({
		window = {
			width = 40,
			position = "float",
		},
		--disable tabs
		startup = false,
		use_libuv_file_watcher = true,
		source_selector = {
			winbar = true,
		},
	})
end
return M
