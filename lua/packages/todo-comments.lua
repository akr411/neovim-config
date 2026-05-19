local M = {}

M.plugins = {
	"https://github.com/folke/todo-comments.nvim",
}

function M.setup()
	local icons = require("core.icons")
	local tc = require("todo-comments")

	tc.setup({
		signs = true,
		keywords = {
			FIX = { icon = icons.ui.todo_fix, color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
			TODO = { icon = icons.ui.todo_todo, color = "info" },
			HACK = { icon = icons.ui.todo_hack, color = "warning" },
			WARN = { icon = icons.ui.todo_warn, color = "warning", alt = { "WARNING", "XXX" } },
			PERF = { icon = icons.ui.todo_perf, alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
			NOTE = { icon = icons.ui.todo_note, color = "hint", alt = { "INFO" } },
			TEST = { icon = icons.ui.todo_test, color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
		},
	})

	local map = require("core.utils").mapper()
	map("n", "<Leader>ft", "<Cmd>TodoFzfLua<CR>", "Find TODOs")
	map("n", "]t", tc.jump_next, "Next TODO")
	map("n", "[t", tc.jump_prev, "Prev TODO")
end

return M
