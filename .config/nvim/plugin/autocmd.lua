-- Vanilla neovim autocmds

local api = vim.api

-- Remove annoying autoformats on any buffer enter. Just doing this once in options.lua
-- doesn't work as ftplugins overrides it for each buffer that gets opened.
api.nvim_create_autocmd("BufEnter", {
	desc = "Force-remove formatoptions (overrides all FTPlugins)",
	group = api.nvim_create_augroup("scatternoodle-remove-formatoptions", { clear = true }),
	callback = function()
		vim.opt.formatoptions:remove("o")
	end,
})

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
