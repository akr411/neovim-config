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

	local map = require("core.utils").mapper()
	map("n", "<Leader>xx", "<Cmd>Trouble diagnostics toggle<CR>", "Workspace diagnostics")
	map("n", "<Leader>xb", "<Cmd>Trouble diagnostics toggle filter.buf=0<CR>", "Buffer diagnostics")
	map("n", "<Leader>xl", "<Cmd>Trouble lsp toggle focus=false win.position=right<CR>", "LSP references/definitions")
	map("n", "<Leader>xq", "<Cmd>Trouble qflist toggle<CR>", "Quickfix list")
	map("n", "<Leader>xs", "<Cmd>Trouble symbols toggle<CR>", "Symbols")
end

return M
