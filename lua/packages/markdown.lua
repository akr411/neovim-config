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

	vim.keymap.set("n", "<Leader>mp", "<Plug>MarkdownPreviewToggle", { desc = "Preview toggle" })
	vim.keymap.set("n", "<Leader>mo", "<Plug>MarkdownPreview", { desc = "Preview open" })
	vim.keymap.set("n", "<Leader>mx", "<Plug>MarkdownPreviewStop", { desc = "Preview stop" })
end

return M
