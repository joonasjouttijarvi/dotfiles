local fn, cmd = vim.fn, vim.cmd

function My_statusline()
	local branch = fn.FugitiveHead()
	if branch and #branch > 0 then
		branch = "  " .. branch
	end

	-- Line status current_line/total_lines
	local total_lines = fn.line("$")
	local current_line = fn.line(".")
	local line_status = current_line .. " | " .. total_lines

	-- Return the statusline string
	return branch .. " %f%m%=" .. line_status .. " %l:%c"
end

cmd([[ set statusline=%!luaeval('My_statusline()') ]])
