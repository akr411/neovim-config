local M = {}

M.plugins = {
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/refractalize/oil-git-status.nvim",
}

function M.setup()
	local icons = require("core.icons")

	require("oil").setup({
		default_file_explorer = true,
		columns = { "icon", "size", "mtime" },
		buf_options = {
			buflisted = false,
			bufhidden = "hide",
		},
		win_options = {
			wrap = false,
			signcolumn = "yes:2",
			conceallevel = 3,
			concealcursor = "nvic",
		},
		skip_confirm_for_simple_edits = true,
		constrain_cursor = "editable",
		watch_for_changes = true,
		keymaps = {
			["g?"] = { "actions.show_help", mode = "n" },
			["<CR>"] = "actions.select",
			["<C-s>"] = { "actions.select", opts = { vertical = true } },
			["<C-x>"] = { "actions.select", opts = { horizontal = true } },
			["<C-t>"] = { "actions.select", opts = { tab = true } },
			["<C-p>"] = "actions.preview",
			["<C-c>"] = { "actions.close", mode = "n" },
			["<C-r>"] = "actions.refresh",
			["-"] = { "actions.parent", mode = "n" },
			["_"] = { "actions.open_cwd", mode = "n" },
			["`"] = { "actions.cd", mode = "n" },
			["g~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
			["gs"] = { "actions.change_sort", mode = "n" },
			["gx"] = "actions.open_external",
			["g."] = { "actions.toggle_hidden", mode = "n" },
			["g\\"] = { "actions.toggle_trash", mode = "n" },
		},
		view_options = {
			show_hidden = false,
			sort = {
				{ "type", "asc" },
				{ "name", "asc" },
			},
		},
		git = {
			add = function(_)
				return true
			end,
			mv = function(_, _)
				return true
			end,
			rm = function(_)
				return true
			end,
		},
		float = { border = "single" },
		confirmation = { border = "single" },
		progress = { border = "single" },
		ssh = { border = "single" },
		keymaps_help = { border = "single" },
	})

	local git_symbols = {
		["!"] = icons.ui.git_ignored,
		["?"] = icons.ui.git_untracked,
		["A"] = icons.ui.git_added,
		["C"] = icons.ui.git_copied,
		["D"] = icons.ui.git_deleted,
		["M"] = icons.ui.git_modified,
		["R"] = icons.ui.git_renamed,
		["T"] = icons.ui.type_changed,
		["U"] = icons.ui.git_conflict,
		[" "] = " ",
	}

	require("oil-git-status").setup({
		show_ignored = true,
		symbols = { index = git_symbols, working_tree = git_symbols },
	})
end

return M
