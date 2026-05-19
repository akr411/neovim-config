local M = {}

M.plugins = {
	"https://github.com/iamcco/markdown-preview.nvim",
}

function M.setup()
	vim.g.mkdp_theme = "dark"
	vim.g.mkdp_auto_close = 1
	vim.g.mkdp_refresh_slow = 0
	vim.g.mkdp_echo_preview_url = 1
	vim.g.mkdp_filetypes = { "markdown" }
	pcall(vim.cmd.packadd, "markdown-preview.nvim")

	local map = require("core.utils").mapper()
	map("n", "<Leader>mp", "<Plug>MarkdownPreviewToggle", "Preview toggle")
	map("n", "<Leader>mo", "<Plug>MarkdownPreview", "Preview open")
	map("n", "<Leader>mx", "<Plug>MarkdownPreviewStop", "Preview stop")
end

return M
