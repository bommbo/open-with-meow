local function launch()
	local buffers = vim.api.nvim_list_bufs()

	local cursor_args = {}
	for _, buffer in ipairs(buffers) do
		if vim.api.nvim_buf_is_valid(buffer) then
			local cursor = vim.api.nvim_win_get_cursor(0)
			table.insert(cursor_args, "+" .. cursor[1] .. ":" .. cursor[2] + 1)
		end
	end

	local file_names = {}
	for _, buffer in ipairs(buffers) do
		if vim.api.nvim_buf_is_valid(buffer) then
			table.insert(file_names, vim.api.nvim_buf_get_name(buffer))
		end
	end
	-- commandline: emacs +line numbers:column numbers file_name
	-- eg: file: a.txt / line number -> 1 / column number -> 2
	-- emacs +1:2 a.txt
	vim.cmd(string.format("silent !alacritty -e emacs -nw %s %s &", table.concat(cursor_args, " "), table.concat(file_names, " ")))
end
return {
	launch = launch,
}
