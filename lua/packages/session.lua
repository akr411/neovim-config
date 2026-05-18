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
					require("mini.starter").open()
				end
			end,
		},
	})

	vim.keymap.set("n", "<Leader>Sf", "<Cmd>AutoSession search<CR>", { desc = "Session search" })
	vim.keymap.set("n", "<Leader>Ss", "<Cmd>AutoSession save<CR>", { desc = "Session save" })
	vim.keymap.set("n", "<Leader>Sd", "<Cmd>AutoSession delete<CR>", { desc = "Session delete" })
end

return M
