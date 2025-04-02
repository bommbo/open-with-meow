local function launch()

	local current_buf = vim.api.nvim_get_current_buf()
	local file_names = vim.api.nvim_buf_get_name(current_buf)
	-- print("Current File:", file_names)
	local cursor = vim.api.nvim_win_get_cursor(0) -- (row, col)
	local cursor_args = string.format("+%d:%d", cursor[1], cursor[2] + 1)
	-- print(string.format("Cursor Arg: %s", cursor_args))

	-- eg: file: a.txt / line number -> 1 / column number -> 2
	-- emacs +1:2 a.txt
	vim.cmd(string.format("silent !alacritty -e emacs -nw %s %s &", cursor_args, file_names))
end
return {
	launch = launch,
}
