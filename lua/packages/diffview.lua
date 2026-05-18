local M = {}

M.plugins = {
	"https://github.com/sindrets/diffview.nvim",
}

function M.setup()
	local icons = require("core.icons")

	require("diffview").setup({
		enhanced_diff_hl = true,
		file_panel = {
			listing_style = "tree",
			win_config = { width = 35 },
		},
		file_history_panel = {
			win_config = { height = 16 },
		},
		icons = {
			folder_closed = icons.ui.folder_closed,
			folder_open = icons.ui.folder_open,
		},
		signs = {
			fold_closed = icons.ui.fold_closed,
			fold_open = icons.ui.fold_open,
			done = icons.ui.ok,
		},
		file_status_icons = {
			added = icons.ui.diff_added,
			deleted = icons.ui.diff_deleted,
			modified = icons.ui.diff_modified,
			renamed = icons.ui.diff_renamed,
			copied = icons.ui.diff_copied,
			unmerged = icons.ui.diff_unmerged,
			unknown = icons.ui.diff_unknown,
		},
	})

	vim.keymap.set("n", "<Leader>gv", "<Cmd>DiffviewOpen<CR>", { desc = "Diffview open" })
	vim.keymap.set("n", "<Leader>gh", "<Cmd>DiffviewFileHistory %<CR>", { desc = "File history" })
	vim.keymap.set("n", "<Leader>gH", "<Cmd>DiffviewFileHistory<CR>", { desc = "Repo history" })
	vim.keymap.set(
		"n",
		"<Leader>gx",
		"<Cmd>DiffviewClose<CR>",
		{ desc = icons.label("Diffview close", icons.ui.diffview_close) }
	)
end

return M
