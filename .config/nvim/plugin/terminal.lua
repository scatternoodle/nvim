local set = vim.opt_local

-- Set local settings for terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
	desc = "scatternoodle-on-term-open",
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		set.number = false
		set.relativenumber = false
		set.scrolloff = 0

		-- make a buffer-local keymap override so that pressing c-t again deletes
		-- the terminal buffer, closing the terminal process.
		vim.api.nvim_buf_set_keymap(0, "n", "<c-t>", "<cmd>bdelete!<cr>", {})
	end,
})

-- Open a terminal at the bottom of the screen with a fixed height.
vim.keymap.set("n", "<c-t>", function()
	vim.cmd.new()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 12)
	vim.wo.winfixheight = true
	vim.cmd.term()
	vim.cmd.startinsert()
end)

-- Press c-t to quit terminal while in terminal (insert) mode.
-- If already in normal mode, just do :q instead
vim.keymap.set("t", "<c-t>", function()
	vim.cmd("bdelete!")
end)

-- Easily hit escape in terminal mode to go back to normal mode.
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
