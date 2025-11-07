-- Adapted from Robin Thrift's very helpful blog post:
-- https://robinthrift.com/posts/2023-06-22-neovim-persistent-colourscheme-changes/

local M = {}

local function ensure_file_exists(filename)
	local file = io.open(filename, "r") -- Try to open in read mode
	if file then
		-- File exists, close it
		file:close()
	else
		-- File does not exist, create it
		file = io.open(filename, "w") -- Open in write mode to create (or truncate)
		if file then
			file:close()
			print("File '" .. filename .. "' created successfully.")
		else
			print("Error: Could not create file '" .. filename .. "'.")
		end
	end
end

local function set_colorscheme(filename)
	local file = io.open(filename, "r")
	if not file then
		print("Error: Could not open file '" .. filename .. "' for reading.")
		return
	end

	local scheme = file:read("*l") -- read first line
	file:close()

	if not scheme or scheme == "" then
		-- we'll just use default until user sets one
		return
	end

	local ok, err = pcall(vim.cmd, "colorscheme " .. scheme)
	if not ok then
		print("Error: Could not set colorscheme '" .. scheme .. "': " .. err)
	end
end

local colorscheme_filepath = os.getenv("HOME") .. "/.config/nvim/lua/custom/colorscheme-saver/current_scheme.txt"

M.setup = function()
	set_colorscheme(colorscheme_filepath) -- Help needed here
	vim.api.nvim_create_autocmd("ColorScheme", {
		callback = function(args)
			ensure_file_exists(colorscheme_filepath)
			vim.fn.jobstart({ "sh", "-c", "echo '" .. args.match .. "' > " .. colorscheme_filepath })

			-- Maybe at some point we should also sync alacritty
			-- theme with this... but I have to tackle the alacritty
			-- side of this too.
			-- vim.fn.jobstart("bash -c 'source location_of_functions_file && set_alactritty_color " .. args.match .. "'")
		end,
	})
end

return M
