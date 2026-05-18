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

	vim.keymap.set("n", "]h", gitsigns.next_hunk, { desc = "Next hunk" })
	vim.keymap.set("n", "[h", gitsigns.prev_hunk, { desc = "Previous hunk" })
	vim.keymap.set("n", "<Leader>gs", gitsigns.stage_hunk, { desc = "Stage hunk" })
	vim.keymap.set("n", "<Leader>gr", gitsigns.reset_hunk, { desc = "Reset hunk" })
	vim.keymap.set("v", "<Leader>gs", function()
		gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
	end, { desc = "Stage selected hunk" })
	vim.keymap.set("v", "<Leader>gr", function()
		gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
	end, { desc = "Reset selected hunk" })
	vim.keymap.set("n", "<Leader>gS", gitsigns.stage_buffer, { desc = "Stage buffer" })
	vim.keymap.set("n", "<Leader>gR", gitsigns.reset_buffer, { desc = "Reset buffer" })
	vim.keymap.set("n", "<Leader>gu", gitsigns.undo_stage_hunk, { desc = "Undo stage hunk" })
	vim.keymap.set("n", "<Leader>gp", gitsigns.preview_hunk, { desc = "Preview hunk" })
	vim.keymap.set("n", "<Leader>gbl", function()
		gitsigns.blame_line({ full = true })
	end, { desc = "Blame line" })
	vim.keymap.set("n", "<Leader>gB", gitsigns.toggle_current_line_blame, { desc = "Toggle line blame" })
	vim.keymap.set("n", "<Leader>gd", gitsigns.diffthis, { desc = "Diff this" })
	vim.keymap.set("n", "<Leader>gD", function()
		gitsigns.diffthis("~")
	end, { desc = "Diff against ~" })
	vim.keymap.set({ "o", "x" }, "ih", "<Cmd><C-U>Gitsigns select_hunk<CR>", { desc = "Select hunk" })
end

return M
