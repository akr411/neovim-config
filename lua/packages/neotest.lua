local M = {}

M.plugins = {
	"https://github.com/nvim-neotest/neotest",
	"https://github.com/fredrikaverpil/neotest-golang",
}

function M.setup()
	local icons = require("core.icons")

	require("neotest").setup({
		adapters = {
			require("neotest-golang")({
				go_test_args = { "-v", "-race", "-count=1" },
			}),
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
	local function map(lhs, rhs, desc)
		vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc })
	end

	map("<Leader>nt", nt.run.run, "Run nearest test")
	map("<Leader>nf", function()
		nt.run.run(vim.fn.expand("%"))
	end, "Run file tests")
	map("<Leader>na", function()
		nt.run.run(vim.fn.getcwd())
	end, "Run all tests")
	map("<Leader>nd", function()
		nt.run.run({ strategy = "dap" })
	end, "Debug nearest test")
	map("<Leader>ns", nt.summary.toggle, "Test summary")
	map("<Leader>no", nt.output_panel.toggle, "Test output")
	map("<Leader>nq", nt.run.stop, "Stop tests")
end

return M
