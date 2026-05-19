local M = {}

M.plugins = {
	"https://github.com/tpope/vim-fugitive",
}

function M.setup()
	local map = require("core.utils").mapper()

	map("n", "<Leader>gg", "<Cmd>Git<CR>", "Git status")
	map("n", "<Leader>gc", "<Cmd>Git commit<CR>", "Git commit")
	map("n", "<Leader>gP", "<Cmd>Git push<CR>", "Git push")
	map("n", "<Leader>gl", "<Cmd>Git log --oneline<CR>", "Git log")
	map("n", "<Leader>gf", "<Cmd>Git fetch<CR>", "Git fetch")
end

return M
