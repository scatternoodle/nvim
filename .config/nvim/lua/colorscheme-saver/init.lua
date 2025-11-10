-- Adapted from Robin Thrift's very helpful blog post:
-- https://robinthrift.com/posts/2023-06-22-neovim-persistent-colourscheme-changes/

local M = {}

local homedir = os.getenv("HOME")
local state_dir = homedir .. "/.local/state/nvim-colorscheme-saver"
local colorscheme_filename = "current_theme.txt"
local colorscheme_filepath = state_dir .. "/" .. colorscheme_filename

local function must_get_file(filepath, op)
	local file, err = io.open(filepath, op)
	if not file then
		error("unable to open or create file at " .. filepath .. ": " .. err)
	end
	return file
end

M.setup = function()
	vim.fn.mkdir(state_dir, "p")
	local file = must_get_file(colorscheme_filepath, "r")

	local scheme = file:read("*l")
	file:close()
	if scheme and scheme ~= "" then
		local ok, err = pcall(vim.cmd, "colorscheme " .. scheme)
		if not ok then
			print("error setting colorscheme " .. scheme .. ": " .. err)
		end
	end

	vim.api.nvim_create_autocmd("ColorScheme", {
		callback = function(args)
			file = must_get_file(colorscheme_filepath, "w")
			local ok, err = pcall(function(c)
				file:write(c)
			end, args.match)
			file:close()
			if not ok then
				error("error writing coloscheme to file " .. err)
			end
		end,
	})
end

return M
