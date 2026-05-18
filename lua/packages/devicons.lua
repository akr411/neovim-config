local M = {}

M.plugins = {
	"https://github.com/nvim-tree/nvim-web-devicons",
}

function M.setup()
	require("nvim-web-devicons").setup({
		default = vim.g.have_nerd_font,
		color_icons = vim.g.have_nerd_font,
		strict = true,
	})
end

return M
