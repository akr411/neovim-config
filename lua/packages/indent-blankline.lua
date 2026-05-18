local M = {}

M.plugins = {
	"https://github.com/lukas-reineke/indent-blankline.nvim",
}

function M.setup()
	require("ibl").setup({
		indent = { char = "│" },
		scope = {
			enabled = true,
			char = "│",
			show_start = true,
			show_end = false,
			highlight = "IblScope",
		},
	})
end

return M
