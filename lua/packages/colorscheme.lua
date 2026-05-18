local M = {}

M.plugins = {
	"https://github.com/mofiqul/vscode.nvim",
}

function M.setup()
	require("vscode").setup({
		transparent = true,
		italic_comments = true,
		underline_links = true,
	})

	vim.cmd.colorscheme("vscode")
end

return M
