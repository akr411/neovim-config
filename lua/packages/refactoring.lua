local M = {}

M.plugins = {
	"https://github.com/ThePrimeagen/refactoring.nvim",
	"https://github.com/lewis6991/async.nvim",
}

function M.setup()
	local refactor = require("refactoring")
	local refactor_debug = require("refactoring.debug")
	local map = require("core.utils").mapper()

	refactor.setup()

	map({ "n", "x" }, "<Leader>re", refactor.extract_func, "Extract function")
	map({ "n", "x" }, "<Leader>rv", refactor.extract_var, "Extract variable")
	map({ "n", "x" }, "<Leader>ri", refactor.inline_var, "Inline variable")
	map({ "n", "x" }, "<Leader>rI", refactor.inline_func, "Inline function")
	map({ "n", "x" }, "<Leader>rs", refactor.select_refactor, "Select refactor")

	map("n", "<Leader>rp", function()
		return refactor_debug.print_var({ output_location = "below" }) .. "iw"
	end, "Debug print var below", { expr = true })
	map("x", "<Leader>rp", function()
		return refactor_debug.print_var({ output_location = "below" })
	end, "Debug print var below", { expr = true })
	map("n", "<Leader>rP", function()
		return refactor_debug.print_var({ output_location = "above" }) .. "iw"
	end, "Debug print var above", { expr = true })
	map("x", "<Leader>rP", function()
		return refactor_debug.print_var({ output_location = "above" })
	end, "Debug print var above", { expr = true })
	map({ "n", "x" }, "<Leader>rc", function()
		refactor_debug.cleanup({ restore_view = true })
	end, "Clean debug prints")
end

return M
