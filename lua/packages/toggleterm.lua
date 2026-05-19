local M = {}

M.plugins = {
	"https://github.com/akinsho/toggleterm.nvim",
}

function M.setup()
	local function set_toggleterm_keymaps(term)
		local map = require("core.utils").mapper(term.bufnr)
		map("t", "<Esc><Esc>", "<C-\\><C-n>", "Exit terminal mode")
		map("t", "<C-h>", "<Cmd>wincmd h<CR>", "Focus left window")
		map("t", "<C-j>", "<Cmd>wincmd j<CR>", "Focus lower window")
		map("t", "<C-k>", "<Cmd>wincmd k<CR>", "Focus upper window")
		map("t", "<C-l>", "<Cmd>wincmd l<CR>", "Focus right window")
	end

	require("toggleterm").setup({
		size = function(term)
			if term.direction == "horizontal" then
				return 15
			elseif term.direction == "vertical" then
				return math.floor(vim.o.columns * 0.4)
			end
		end,
		open_mapping = [[<C-\>]],
		shade_terminals = false,
		persist_size = true,
		persist_mode = true,
		direction = "float",
		close_on_exit = true,
		on_open = set_toggleterm_keymaps,
		float_opts = { border = "single" },
	})
end

return M
