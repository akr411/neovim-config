local M = {}

M.plugins = {
	"https://github.com/lewis6991/gitsigns.nvim",
}

function M.setup()
	local icons = require("core.icons")
	local gitsigns = require("gitsigns")

	local signs = {
		add = { text = icons.ui.gitsigns_add },
		change = { text = icons.ui.gitsigns_change },
		delete = { text = icons.ui.gitsigns_delete },
		topdelete = { text = icons.ui.gitsigns_topdelete },
		changedelete = { text = icons.ui.gitsigns_changedelete },
	}

	gitsigns.setup({
		signs = vim.tbl_extend("force", signs, { untracked = { text = icons.ui.gitsigns_untracked } }),
		signs_staged = signs,
		current_line_blame_opts = { delay = 500 },
		attach_to_untracked = true,
	})

	local map = require("core.utils").mapper()

	map("n", "]h", gitsigns.next_hunk, "Next hunk")
	map("n", "[h", gitsigns.prev_hunk, "Previous hunk")
	map("n", "<Leader>gs", gitsigns.stage_hunk, "Stage hunk")
	map("n", "<Leader>gr", gitsigns.reset_hunk, "Reset hunk")
	map("v", "<Leader>gs", function()
		gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
	end, "Stage selected hunk")
	map("v", "<Leader>gr", function()
		gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
	end, "Reset selected hunk")
	map("n", "<Leader>gS", gitsigns.stage_buffer, "Stage buffer")
	map("n", "<Leader>gR", gitsigns.reset_buffer, "Reset buffer")
	map("n", "<Leader>gu", gitsigns.undo_stage_hunk, "Undo stage hunk")
	map("n", "<Leader>gp", gitsigns.preview_hunk, "Preview hunk")
	map("n", "<Leader>gbl", function()
		gitsigns.blame_line({ full = true })
	end, "Blame line")
	map("n", "<Leader>gB", gitsigns.toggle_current_line_blame, "Toggle line blame")
	map("n", "<Leader>gd", gitsigns.diffthis, "Diff this")
	map("n", "<Leader>gD", function()
		gitsigns.diffthis("~")
	end, "Diff against ~")
	map({ "o", "x" }, "ih", "<Cmd><C-U>Gitsigns select_hunk<CR>", "Select hunk")
end

return M
