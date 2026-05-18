local M = {}

M.plugins = {
	"https://github.com/brenoprata10/nvim-highlight-colors",
}

function M.setup()
	require("nvim-highlight-colors").setup({
		render = "virtual",
		virtual_symbol = require("core.icons").ui.color_swatch,
		virtual_symbol_position = "inline",
		enable_tailwind = false,
		exclude_filetypes = { "mason" },
	})
end

return M
