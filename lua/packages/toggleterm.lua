local M = {}

M.plugins = {
	"https://github.com/akinsho/toggleterm.nvim",
}

function M.setup()
	local function set_toggleterm_keymaps(term)
		local opts = { buffer = term.bufnr, silent = true }
		vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", vim.tbl_extend("force", opts, { desc = "Exit terminal mode" }))
		vim.keymap.set("t", "<C-h>", "<Cmd>wincmd h<CR>", vim.tbl_extend("force", opts, { desc = "Focus left window" }))
		vim.keymap.set(
			"t",
			"<C-j>",
			"<Cmd>wincmd j<CR>",
			vim.tbl_extend("force", opts, { desc = "Focus lower window" })
		)
		vim.keymap.set(
			"t",
			"<C-k>",
			"<Cmd>wincmd k<CR>",
			vim.tbl_extend("force", opts, { desc = "Focus upper window" })
		)
		vim.keymap.set(
			"t",
			"<C-l>",
			"<Cmd>wincmd l<CR>",
			vim.tbl_extend("force", opts, { desc = "Focus right window" })
		)
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
