local clang_format = require("clang-format")

return { -- Better autoformat replacer - add language replacers as desired.
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			-- Disable "format_on_save lsp_fallback" for languages that don't
			-- have a well standardized coding style. You can add additional
			-- languages here or re-enable it for the disabled ones.
			local disable_filetypes = { c = true, cpp = true }
			return {
				timeout_ms = 500,
				lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
			}
		end,

		formatters = {
			clang_format = {
				prepend_args = {
					clang_format.get_style_arg(nil, 8),
				},
			},
		},

		-- see https://github.com/stevearc/conform.nvim?tab=readme-ov-file#customizing-formatters
		formatters_by_ft = {
			lua = { "stylua" },
			c = { "clang_format" },
			cpp = { "clang_format" },
			json = { "prettier" },
			yaml = { "prettier" },
			sql = { "sleek" },
			-- Conform can also run multiple formatters sequentially
			-- python = { "isort", "black" },
			--
			-- You can use 'stop_after_first' to run the first available formatter from the list
			-- javascript = { "prettierd", "prettier", stop_after_first = true },
		},
	},
}
