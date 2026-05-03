vim.pack.add({
	"https://github.com/rcarriga/nvim-dap-ui",
	"https://github.com/nvim-neotest/nvim-nio",
})

local opts = { noremap = true, silent = true }
local dap, dapui = require("dap"), require("dapui")

vim.fn.sign_define("DapBreakpoint", { text = "󰝤", texthl = "", linehl = "", numhl = "" })

vim.keymap.set("n", "<Leader>dc", dap.continue, opts)
vim.keymap.set("n", "<Leader>do", dap.step_over, opts)
vim.keymap.set("n", "<Leader>di", dap.step_into, opts)
vim.keymap.set("n", "<Leader>du", dap.step_out, opts)
vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, opts)
vim.keymap.set("n", "<Leader>dr", dap.repl.open, opts)

dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.open()
end

dapui.setup()
