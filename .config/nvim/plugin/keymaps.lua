-- General vanilla neovim keymaps, we will still have plugin-specific keymaps inside
-- the respective plugin configs.

local set = vim.keymap.set

-- Clear highlights on search when pressing <Esc> in normal mode
set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Navigate splits
set("n", "<c-j>", "<c-w><c-j>")
set("n", "<c-k>", "<c-w><c-k>")
set("n", "<c-l>", "<c-w><c-l>")
set("n", "<c-h>", "<c-w><c-h>")

-- Resize splits
set("n", "<M-,>", "<c-w>5<")
set("n", "<M-.>", "<c-w>5>")
set("n", "<M-p>", "<C-W>+")
set("n", "<M-n>", "<C-W>-")

-- Diagnostic
set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- In diff mode only, jk to navigate between changes.
set("n", "<M-j>", function()
	if vim.opt.diff:get() then
		vim.cmd([[normal! ]c]])
	else
		vim.cmd([[m .+1<CR>==]])
	end
end)
set("n", "<M-k>", function()
	if vim.opt.diff:get() then
		vim.cmd([[normal! [c]])
	else
		vim.cmd([[m .-2<CR>==]])
	end
end)
