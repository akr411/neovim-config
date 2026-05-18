local M = {}

M.plugins = {
	"https://github.com/folke/which-key.nvim",
}

function M.setup()
	local icons = require("core.icons")
	local wk = require("which-key")

	wk.setup({
		delay = 400,
		win = { border = "single" },
		icons = {
			breadcrumb = icons.wk.breadcrumb,
			separator = icons.wk.separator,
			ellipsis = icons.wk.ellipsis,
			mappings = icons.have_nerd_font,
			keys = icons.have_nerd_font and {} or {
				Up = "Up ",
				Down = "Down ",
				Left = "Left ",
				Right = "Right ",
				C = "C-",
				M = "M-",
				D = "D-",
				S = "S-",
				CR = "Enter ",
				Esc = "Esc ",
				NL = "Enter ",
				BS = "BS ",
				Space = "Space ",
				Tab = "Tab ",
			},
		},
	})

	wk.add({
		{ "<Leader>b", group = icons.group_label("buffer", "buffer") },
		{ "<Leader>c", group = icons.group_label("code", "code") },
		{ "<Leader>d", group = icons.group_label("debug", "debug") },
		{ "<Leader>f", group = icons.group_label("find", "find") },
		{ "<Leader>g", group = icons.group_label("git", "git") },
		{ "<Leader>j", group = icons.group_label("java", "java") },
		{ "<Leader>je", group = icons.group_label("extract", "extract") },
		{ "<Leader>l", group = icons.group_label("lsp", "lsp") },
		{ "<Leader>m", group = icons.group_label("markdown", "markdown") },
		{ "<Leader>n", group = icons.group_label("neotest", "neotest") },
		{ "<Leader>p", group = icons.group_label("pack", "pack/path") },
		{ "<Leader>r", group = icons.group_label("refactor", "refactor") },
		{ "<Leader>s", group = icons.group_label("split", "split") },
		{ "<Leader>S", group = icons.group_label("session", "session") },
		{ "<Leader>t", group = icons.group_label("toggle", "toggle") },
		{ "<Leader>x", group = icons.group_label("trouble", "trouble") },
		{ "]", group = icons.group_label("next", "next") },
		{ "[", group = icons.group_label("prev", "prev") },
	})
end

return M
