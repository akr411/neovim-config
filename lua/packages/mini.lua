local M = {}

M.plugins = {
	"https://github.com/echasnovski/mini.nvim",
}

function M.setup()
	local icons = require("core.icons")

	require("mini.ai").setup()
	require("mini.align").setup()
	require("mini.bracketed").setup()

	require("mini.jump2d").setup()
	require("mini.move").setup()
	require("mini.notify").setup()
	require("mini.operators").setup({ exchange = { prefix = "cx" } })
	require("mini.pairs").setup()
	require("mini.splitjoin").setup()
	require("mini.surround").setup()
	require("mini.trailspace").setup()

	local statusline = require("mini.statusline")
	statusline.section_mode = function()
		return ""
	end
	statusline.section_fileinfo = function()
		local ft = vim.bo.filetype
		if ft == "ministarter" then
			return ""
		end
		return ft
	end
	statusline.setup({
		use_icons = icons.have_nerd_font,
		set_vim_settings = false,
	})

	vim.notify = require("mini.notify").make_notify()
end

return M
