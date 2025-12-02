-- [[ General neovim settings ]]

local opt = vim.opt

opt.shada = { "'10", "<0", "s10", "h" }

-- [[ Display ]]

-- Decreased update time for snappyness
opt.updatetime = 200

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
opt.timeoutlen = 300

-- If we don't have a nerdfont already, fucking go get one what are you doing
vim.g.have_nerd_font = true

-- How to handle concealed / replaced text, e.g. in Obsidian Markdown
-- 0 - normal
-- 1 - replace with a single char if no replacement char defined
-- 2 - hide unless replacement char defined
-- 3 - hide completely
-- See :h 'conceallevel'
opt.conceallevel = 1

-- Reload file automatically (on certain events)
vim.o.autoread = true

-- Line numbers
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.scrolloff = 10

-- Display ruler
opt.colorcolumn = "80,120"

-- Keep signcolumn on by default
opt.signcolumn = "yes"

-- [[ Editing ]]

-- Preview substitutions live, as you type!
opt.inccommand = "split"

-- "" means mouse mode disabled.
opt.mouse = ""

-- Don't show the mode, since it's already in the status line
opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
	opt.clipboard = "unnamedplus"
end)

opt.breakindent = true
opt.shiftwidth = 6
opt.tabstop = 6
opt.softtabstop = 6
opt.expandtab = true

-- Save undo history
opt.undofile = true

-- [[ Search and nav ]]

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true
opt.smartcase = true

-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true
