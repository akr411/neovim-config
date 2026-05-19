local M = {}

M.plugins = {
	"https://github.com/rmagatti/auto-session",
}

function M.setup()
	vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

	require("auto-session").setup({
		suppressed_dirs = { "~/", "~/Downloads", "/" },
		git_use_branch_name = true,
		bypass_save_filetypes = { "ministarter" },
		no_restore_cmds = {
			function()
				if vim.fn.argc() == 0 then
					require("mini.starter").open(vim.api.nvim_get_current_buf())
				end
			end,
		},
	})

	local map = require("core.utils").mapper()

	map("n", "<Leader>Sf", "<Cmd>AutoSession search<CR>", "Session search")
	map("n", "<Leader>Ss", "<Cmd>AutoSession save<CR>", "Session save")
	map("n", "<Leader>Sd", "<Cmd>AutoSession delete<CR>", "Session delete")
end

return M
