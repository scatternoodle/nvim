-- c-style.lua - mostly some fussy stuff because clang-format doesn't always behave
-- quite like I want it. To be used in conjunction with a proper clang-format
-- config.

vim.opt_local.cindent = true
vim.opt_local.cinoptions:append({
	-- Indent 'case' labels relative to 'switch'
	-- '0' aligns 'case' with 'switch' column 0, 'S0' aligns 'switch' statement with 0 and cases inside
	-- 's' aligns 'case' label with 'switch', then 'sw' sets the indent
	-- 's1' puts 'case' at indent 1 relative to 'switch'
	"s0",

	-- Indent of opening brace for functions
	-- 'f0' puts function open brace at indent 0 relative to function line
	-- Since clang-format puts it on a new line, but aligned with the function's scope,
	-- this ensures Neovim doesn't indent it further.
	"f0",

	-- Indent of opening brace for switch case blocks
	-- 'j0' aligns the block within a case with the case label
	-- This means if your case label is indented, the brace will be too.
	-- If your clang-format puts it on a new line, it needs to align with the start of the block.
	"j0",

	-- This might be useful to ensure blocks within if/else/while/for
	-- (where clang-format keeps braces on the same line) are correctly handled,
	-- though `f0` and `j0` are the main ones for your custom styles.
	-- "p0", -- Parameter lists,
	-- "t0", -- Top-level class/struct/union/enum declarations
	-- "g0", -- global variables
	-- "w0", -- while loops
	-- "W0", -- do-while loops
	-- "c0", -- catch clauses
	-- "l0", -- lambda expressions
})
