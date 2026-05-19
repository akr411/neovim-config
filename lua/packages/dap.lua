local M = {}

M.plugins = {
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/rcarriga/nvim-dap-ui",
	"https://github.com/leoluz/nvim-dap-go",
}

function M.setup()
	local icons = require("core.icons")
	local dap, dapui = require("dap"), require("dapui")
	local map = require("core.utils").mapper()

	for _, s in ipairs({
		{ "DapBreakpoint", icons.ui.breakpoint, "DiagnosticError", "" },
		{ "DapBreakpointCondition", icons.ui.breakpoint_condition, "DiagnosticWarn", "" },
		{ "DapBreakpointRejected", icons.ui.breakpoint_rejected, "DiagnosticError", "" },
		{ "DapStopped", icons.ui.stopped, "DiagnosticOk", "DiffAdd" },
	}) do
		vim.fn.sign_define(s[1], { text = s[2], texthl = s[3], linehl = s[4], numhl = "" })
	end

	map("n", "<Leader>dc", dap.continue, "Debug continue")
	map("n", "<Leader>do", dap.step_over, "Debug step over")
	map("n", "<Leader>di", dap.step_into, "Debug step into")
	map("n", "<Leader>du", dap.step_out, "Debug step out")
	map("n", "<Leader>db", dap.toggle_breakpoint, "Debug toggle breakpoint")
	map("n", "<Leader>dB", function()
		dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
	end, "Debug conditional breakpoint")
	map("n", "<Leader>dr", dap.repl.open, "Debug REPL")
	map("n", "<Leader>dl", dap.run_last, "Debug run last")
	map("n", "<Leader>dq", dap.terminate, "Debug terminate")
	map("n", "<Leader>dU", dapui.toggle, "Debug UI toggle")

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

	local ok_mason, mason_registry = pcall(require, "mason-registry")
	if ok_mason and mason_registry.is_installed("codelldb") then
		local ok_loc, InstallLocation = pcall(require, "mason-core.installer.InstallLocation")
		if ok_loc then
			local install_path = InstallLocation.global():package("codelldb")
			local codelldb_path = install_path .. "/codelldb"
			local liblldb_dylib = install_path .. "/lldb/lib/liblldb.dylib"
			local liblldb_path = vim.fn.filereadable(liblldb_dylib) == 1 and liblldb_dylib
				or install_path .. "/lldb/lib/liblldb.so"

			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = codelldb_path,
					args = { "--liblldb", liblldb_path, "--port", "${port}" },
				},
			}

			local function pick_binary()
				return vim.fn.input("Binary path: ", vim.fn.getcwd() .. "/target/debug/", "file")
			end

			dap.configurations.rust = {
				{
					name = "Launch binary",
					type = "codelldb",
					request = "launch",
					program = pick_binary,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
				},
				{
					name = "Launch binary (with args)",
					type = "codelldb",
					request = "launch",
					program = pick_binary,
					args = function()
						local input = vim.fn.input("Program args: ")
						return vim.split(input, " ", { trimempty = true })
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
				},
			}
		end
	end
end

return M
