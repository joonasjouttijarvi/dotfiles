local fn, cmd = vim.fn, vim.cmd

function My_statusline()
	local branch = fn.FugitiveHead()

	if branch and #branch > 0 then
		branch = "  " .. branch
	end

	return branch .. " %f%m%=%l:%c"
end

cmd([[ set statusline=%!luaeval('My_statusline()') ]])
