-- Put code here that critically needs to run before plugins are loaded

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.cmd("set termguicolors")

-- Set up lazy, which will handle plugins.
-- Plugin configs go in their own files, so not much more to do in init.lua.

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

-- Add lazy to the `runtimepath`, this allows us to `require` it.
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ import = "plugins" }, {
	change_detection = {
		enabled = true,
		notify = true,
	},
})
