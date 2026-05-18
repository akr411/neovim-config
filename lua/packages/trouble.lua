local M = {}

M.plugins = {
	"https://github.com/folke/trouble.nvim",
}

function M.setup()
	local icons = require("core.icons")

	require("trouble").setup({
		modes = {
			symbols = {
				win = { position = "right", size = 0.3 },
			},
		},
		icons = {
			indent = {
				fold_open = icons.ui.fold_open,
				fold_closed = icons.ui.fold_closed,
			},
			folder_closed = icons.ui.folder_closed,
			folder_open = icons.ui.folder_open,
			kinds = icons.lsp_kinds,
		},
	})

	vim.keymap.set("n", "<Leader>xx", "<Cmd>Trouble diagnostics toggle<CR>", { desc = "Workspace diagnostics" })
	vim.keymap.set(
		"n",
		"<Leader>xb",
		"<Cmd>Trouble diagnostics toggle filter.buf=0<CR>",
		{ desc = "Buffer diagnostics" }
	)
	vim.keymap.set(
		"n",
		"<Leader>xl",
		"<Cmd>Trouble lsp toggle focus=false win.position=right<CR>",
		{ desc = "LSP references/definitions" }
	)
	vim.keymap.set("n", "<Leader>xq", "<Cmd>Trouble qflist toggle<CR>", { desc = "Quickfix list" })
	vim.keymap.set("n", "<Leader>xs", "<Cmd>Trouble symbols toggle<CR>", { desc = "Symbols" })
end

return M
