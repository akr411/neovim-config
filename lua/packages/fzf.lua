local fzf = require("fzf-lua")

fzf.setup({
	{ "border-fused", "hide", "fzf-native" },
	oldfiles = {
		cwd_only = true,
		stat_file = true,
		include_current_session = true,
	},
	grep = {
		rg_glob = true,
		glob_flag = "--iglob",
		glob_separator = "%s%-%-",
	},
	winopts = {
		border = "single",
	},
	preview = {
		border = "single",
		scrollbar = false,
	},
})

vim.keymap.set("n", "<Leader><Leader>", fzf.buffers)
vim.keymap.set("n", "<Leader>ff", fzf.files)
vim.keymap.set("n", "<Leader>fg", fzf.live_grep)
vim.keymap.set("n", "<Leader>fh", fzf.help_tags)

vim.keymap.set("n", "<Leader>fx", function()
	require("fzf-lua").diagnostics_document()
end, { desc = "FZF Diagnostics Document" })

vim.keymap.set("n", "<Leader>fX", function()
	require("fzf-lua").diagnostics_workspace()
end, { desc = "FZF Diagnostics Workspace" })
