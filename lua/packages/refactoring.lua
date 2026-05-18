local M = {}

M.plugins = {
	"https://github.com/ThePrimeagen/refactoring.nvim",
	"https://github.com/lewis6991/async.nvim",
}

function M.setup()
	local keymap = vim.keymap.set
	local refactor = require("refactoring")
	local refactor_debug = require("refactoring.debug")

	refactor.setup()

	keymap({ "n", "x" }, "<Leader>re", refactor.extract_func, { desc = "Extract function" })
	keymap({ "n", "x" }, "<Leader>rv", refactor.extract_var, { desc = "Extract variable" })
	keymap({ "n", "x" }, "<Leader>ri", refactor.inline_var, { desc = "Inline variable" })
	keymap({ "n", "x" }, "<Leader>rI", refactor.inline_func, { desc = "Inline function" })
	keymap({ "n", "x" }, "<Leader>rs", refactor.select_refactor, { desc = "Select refactor" })

	keymap("n", "<Leader>rp", function()
		return refactor_debug.print_var({ output_location = "below" }) .. "iw"
	end, { desc = "Debug print var below", expr = true })
	keymap("x", "<Leader>rp", function()
		return refactor_debug.print_var({ output_location = "below" })
	end, { desc = "Debug print var below", expr = true })
	keymap("n", "<Leader>rP", function()
		return refactor_debug.print_var({ output_location = "above" }) .. "iw"
	end, { desc = "Debug print var above", expr = true })
	keymap("x", "<Leader>rP", function()
		return refactor_debug.print_var({ output_location = "above" })
	end, { desc = "Debug print var above", expr = true })
	keymap({ "n", "x" }, "<Leader>rc", function()
		refactor_debug.cleanup({ restore_view = true })
	end, { desc = "Clean debug prints" })
end

return M
