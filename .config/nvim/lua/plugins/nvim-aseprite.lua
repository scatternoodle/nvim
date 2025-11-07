return {
	-- Uncomment to use github default branch
	"scatternoodle/aseprite.nvim",

	-- Uncomment dir and name to use local dev version
	-- dir = "",
	-- name = "nvim-aseprite",

	event = "VeryLazy",
	opts = {},
	keys = {
		{ "<leader>a", desc = "Aseprite" },
		{ "<leader>ar", "<cmd>AsepriteRestart<cr>", desc = "Restart Aseprite" },
		{ "<leader>as", "<cmd>AsepriteStop<cr>", desc = "Stop Aseprite" },
	},
}
