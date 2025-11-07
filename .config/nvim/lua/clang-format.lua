local M = {}

local default_clang_format_file = "~/.config/clang-format/.clang-format"

-- Gets the --style arg for the clang-format CLI.
-- @param filepath (text|nil|false) alternate .clang-format filepath. If nil/false,
-- default config filepath defined in this file will be used.
-- @param default_indent_width (number) if no filepath provided and default config
-- file not found, the number provided will be used as the IndentWidth arg to clang-format
function M.get_style_arg(filepath, default_indent_width)
	if not filepath then
		filepath = vim.fn.expand(default_clang_format_file)
	end

	local args = "--style="
	local f = io.open(filepath, "r")
	if not f then
		args = args .. [["{BasedOnStyle: llvm, ]] .. string.format('IndentWidth: %d}"', default_indent_width)
		vim.notify(
			string.format(
				"[clang-format] Config file not found at %s. Falling back to default args: %s",
				filepath,
				args
			)
		)
		return args
	end
	io.close(f)
	args = args .. "file:" .. filepath
	return args
end

return M
