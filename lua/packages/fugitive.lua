local M = {}

M.plugins = {
	"https://github.com/tpope/vim-fugitive",
}

function M.setup()
	vim.keymap.set("n", "<Leader>gg", "<Cmd>Git<CR>", { desc = "Git status" })
	vim.keymap.set("n", "<Leader>gc", "<Cmd>Git commit<CR>", { desc = "Git commit" })
	vim.keymap.set("n", "<Leader>gP", "<Cmd>Git push<CR>", { desc = "Git push" })
	vim.keymap.set("n", "<Leader>gl", "<Cmd>Git log --oneline<CR>", { desc = "Git log" })
	vim.keymap.set("n", "<Leader>gf", "<Cmd>Git fetch<CR>", { desc = "Git fetch" })
end

return M
