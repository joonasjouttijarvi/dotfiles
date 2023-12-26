local fn, cmd = vim.fn, vim.cmd

function My_statusline()
	local branch = fn.FugitiveHead()
	if branch and #branch > 0 then
		branch = "  " .. branch
	end

	-- Calculate the percentage
	local total_lines = fn.line("$")
	local current_line = fn.line(".")
	local percent = (current_line / total_lines) * 100
	local line_percentage = string.format("  %3d%%%% ", percent) -- Added spaces for distance

	-- Return the statusline string
	return branch .. " %f%m%=" .. line_percentage .. " %l:%c"
end

cmd([[ set statusline=%!luaeval('My_statusline()') ]])
