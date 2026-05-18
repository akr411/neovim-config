local M = {}

M.plugins = {
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/rcarriga/nvim-dap-ui",
	"https://github.com/leoluz/nvim-dap-go",
}

function M.setup()
	local icons = require("core.icons")
	local dap, dapui = require("dap"), require("dapui")

	for _, s in ipairs({
		{ "DapBreakpoint", icons.ui.breakpoint, "DiagnosticError", "" },
		{ "DapBreakpointCondition", icons.ui.breakpoint_condition, "DiagnosticWarn", "" },
		{ "DapBreakpointRejected", icons.ui.breakpoint_rejected, "DiagnosticError", "" },
		{ "DapStopped", icons.ui.stopped, "DiagnosticOk", "DiffAdd" },
	}) do
		vim.fn.sign_define(s[1], { text = s[2], texthl = s[3], linehl = s[4], numhl = "" })
	end

	local function map(lhs, rhs, desc)
		vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc })
	end

	map("<Leader>dc", dap.continue, "Debug continue")
	map("<Leader>do", dap.step_over, "Debug step over")
	map("<Leader>di", dap.step_into, "Debug step into")
	map("<Leader>du", dap.step_out, "Debug step out")
	map("<Leader>db", dap.toggle_breakpoint, "Debug toggle breakpoint")
	map("<Leader>dB", function()
		dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
	end, "Debug conditional breakpoint")
	map("<Leader>dr", dap.repl.open, "Debug REPL")
	map("<Leader>dl", dap.run_last, "Debug run last")
	map("<Leader>dq", dap.terminate, "Debug terminate")
	map("<Leader>dU", dapui.toggle, "Debug UI toggle")

	dap.listeners.before.attach.dapui_config = function()
		dapui.open()
	end
	dap.listeners.before.launch.dapui_config = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated.dapui_config = function()
		dapui.close()
	end
	dap.listeners.before.event_exited.dapui_config = function()
		dapui.close()
	end

	dapui.setup()

	require("dap-go").setup({
		dap_configurations = {
			{
				type = "go",
				name = "Attach remote",
				mode = "remote",
				request = "attach",
			},
		},
	})
end

return M
