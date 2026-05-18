local M = {}

M.plugins = {
	"https://github.com/ibhagwan/fzf-lua",
}

function M.setup()
	local icons = require("core.icons")
	local fzf = require("fzf-lua")

	fzf.setup({
		{ "border-fused", "hide", "fzf-native" },
		defaults = {
			file_icons = icons.have_nerd_font and "devicons" or false,
		},
		fzf_opts = {
			["--prompt"] = "  ",
			["--pointer"] = icons.ui.fzf_pointer,
			["--marker"] = icons.ui.fzf_marker,
		},
		oldfiles = {
			cwd_only = true,
			stat_file = true,
			include_current_session = true,
		},
		files = { prompt = "  " },
		buffers = { prompt = icons.ui.fzf_buffer .. "  " },
		grep = {
			prompt = icons.ui.fzf_grep .. "  ",
			rg_glob = true,
			glob_flag = "--iglob",
			glob_separator = "%s%-%-",
		},
		winopts = {
			border = "single",
			title_pos = "center",
		},
		preview = {
			border = "single",
			scrollbar = false,
		},
		lsp = {
			prompt_postfix = "  ",
			symbols = { symbol_icons = icons.lsp_kinds },
		},
	})

	vim.keymap.set("n", "<Leader>ff", function()
		if vim.fn.finddir(".git", vim.fn.getcwd() .. ";") ~= "" then
			fzf.files({ cmd = "git ls-files --cached --others --exclude-standard" })
		else
			fzf.files()
		end
	end, { desc = "Find files" })
	vim.keymap.set("n", "<Leader>fF", fzf.files, { desc = "Find all files" })
	vim.keymap.set("n", "<Leader>fg", fzf.live_grep, { desc = "Find grep" })
	vim.keymap.set("n", "<Leader>fw", fzf.grep_cword, { desc = "Find word" })
	vim.keymap.set("v", "<Leader>fw", fzf.grep_visual, { desc = "Find selection" })
	vim.keymap.set("n", "<Leader>fr", fzf.resume, { desc = "Find resume" })
	vim.keymap.set("n", "<Leader>fh", fzf.help_tags, { desc = "Find help" })
	vim.keymap.set("n", "<Leader>fo", fzf.oldfiles, { desc = "Find old files" })
	vim.keymap.set("n", "<Leader>fs", fzf.lsp_document_symbols, { desc = "Find document symbols" })
	vim.keymap.set("n", "<Leader>fS", fzf.lsp_workspace_symbols, { desc = "Find workspace symbols" })
	vim.keymap.set("n", "<Leader>fx", fzf.diagnostics_document, { desc = "Find buffer diagnostics" })
	vim.keymap.set("n", "<Leader>fX", fzf.diagnostics_workspace, { desc = "Find workspace diagnostics" })
	vim.keymap.set("n", "<Leader><Leader>", fzf.buffers, { desc = "Find buffers" })
end

return M
