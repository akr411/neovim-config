local M = {}

M.plugins = {
	"https://github.com/stevearc/aerial.nvim",
}

function M.setup()
	local icons = require("core.icons")

	require("aerial").setup({
		backends = { "lsp", "treesitter" },
		layout = {
			max_width = { 40, 0.2 },
			min_width = 20,
			placement = "edge",
		},
		attach_mode = "window",
		keymaps = {
			["?"] = "actions.show_help",
			["<CR>"] = "actions.jump",
			["<C-v>"] = "actions.jump_vsplit",
			["p"] = "actions.scroll",
			["<C-j>"] = "actions.down_and_scroll",
			["<C-k>"] = "actions.up_and_scroll",
			["{"] = "actions.prev",
			["}"] = "actions.next",
			["q"] = "actions.close",
		},
		filter_kind = {
			"Class",
			"Constructor",
			"Enum",
			"Function",
			"Interface",
			"Method",
			"Module",
			"Struct",
		},
		icons = icons.lsp_kinds,
		highlight_on_hover = true,
		show_guides = true,
		guides = {
			mid_item = icons.aerial.mid,
			last_item = icons.aerial.last,
			nested_top = icons.aerial.nested,
			whitespace = icons.aerial.space,
		},
	})

	vim.keymap.set("n", "<Leader>a", "<Cmd>AerialToggle<CR>", { desc = "Aerial toggle" })
end

return M
