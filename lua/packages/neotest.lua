local M = {}

M.plugins = {
	"https://github.com/nvim-neotest/neotest",
	"https://github.com/fredrikaverpil/neotest-golang",
	"https://github.com/rouge8/neotest-rust",
}

function M.setup()
	local icons = require("core.icons")

	require("neotest").setup({
		adapters = {
			require("neotest-golang")({
				go_test_args = { "-v", "-race", "-count=1" },
			}),
			require("neotest-rust")({}),
		},
		output = { open_on_run = false },
		icons = {
			running = icons.ui.running,
			passed = icons.ui.passed,
			failed = icons.ui.failed,
			skipped = icons.ui.skipped,
			unknown = icons.ui.unknown,
		},
	})

	local nt = require("neotest")
	local map = require("core.utils").mapper()

	map("n", "<Leader>nt", nt.run.run, "Run nearest test")
	map("n", "<Leader>nf", function()
		nt.run.run(vim.fn.expand("%"))
	end, "Run file tests")
	map("n", "<Leader>na", function()
		nt.run.run(vim.fn.getcwd())
	end, "Run all tests")
	map("n", "<Leader>nd", function()
		nt.run.run({ strategy = "dap" })
	end, "Debug nearest test")
	map("n", "<Leader>ns", nt.summary.toggle, "Test summary")
	map("n", "<Leader>no", nt.output_panel.toggle, "Test output")
	map("n", "<Leader>nq", nt.run.stop, "Stop tests")
end

return M
