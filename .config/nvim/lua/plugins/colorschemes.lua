local addScheme = function(s)
	return { s, priority = 1000 }
end

return {

	-- This actually sets the colorscheme, and allows you to change the colorscheme
	-- (e.g. using Telescope) and persist your choice between sessions.
	{
		dir = "~/.config/nvim/lua/colorscheme-saver",
		lazy = false,
		priority = 900,
		init = function()
			require("colorscheme-saver").setup()
		end,
	},

	-- Add colorscheme plugins below...
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	addScheme("rebelot/kanagawa.nvim"),
	addScheme("miikanissi/modus-themes.nvim"),
	addScheme("folke/tokyonight.nvim"),
	addScheme("Shatur/neovim-ayu"),
	-- addScheme("RRethy/base16-nvim"), -- so many in this one, it's overwhelming and messes with telescope
	addScheme("xero/miasma.nvim"),
	addScheme("cocopon/iceberg.vim"),
	addScheme("ntk148v/komau.vim"),
	addScheme("LuRsT/austere.vim"),
	addScheme("maxmx03/fluoromachine.nvim"),
	addScheme("rockerBOO/boo-colorscheme-nvim"),
	addScheme("neanias/everforest-nvim"),
	addScheme("savq/melange-nvim"),
	addScheme("olivercederborg/poimandres.nvim"),
	addScheme("slugbyte/lackluster.nvim"),
	addScheme("ramojus/mellifluous.nvim"),
	addScheme("thesimonho/kanagawa-paper.nvim"),
	addScheme("rose-pine/neovim"),
	addScheme("projekt0n/github-nvim-theme"),
	addScheme("Mofiqul/vscode.nvim"),
	addScheme("Mofiqul/dracula.nvim"),
	addScheme("shaunsingh/nord.nvim"),
	addScheme("nyoom-engineering/oxocarbon.nvim"),
	addScheme("AlexvZyl/nordic.nvim"),
	addScheme("bluz71/vim-moonfly-colors"),

	{
		"zenbones-theme/zenbones.nvim",
		-- Optionally install Lush. Allows for more configuration or extending the colorscheme
		-- If you don't want to install lush, make sure to set g:zenbones_compat = 1
		-- In Vim, compat mode is turned on as Lush only works in Neovim.
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		-- you can set set configuration options here
		-- config = function()
		--     vim.g.zenbones_darken_comments = 45
		--     vim.cmd.colorscheme('zenbones')
		-- end
	},
}
