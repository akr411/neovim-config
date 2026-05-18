local M = {}

M.plugins = {
	"https://github.com/akinsho/bufferline.nvim",
}

function M.setup()
	local icons = require("core.icons")

	local function diagnostics_indicator(_, _, diagnostics_dict)
		local parts = {}
		local severity_icons = {
			{ "error", icons.ui.diagnostic_error },
			{ "warning", icons.ui.diagnostic_warn },
			{ "info", icons.ui.diagnostic_info },
			{ "hint", icons.ui.diagnostic_hint },
		}
		for _, entry in ipairs(severity_icons) do
			local count = diagnostics_dict[entry[1]]
			if count and count > 0 then
				table.insert(parts, string.format("%s%d", entry[2], count))
			end
		end
		return #parts > 0 and " " .. table.concat(parts, " ") or ""
	end

	require("bufferline").setup({
		options = {
			always_show_bufferline = true,
			diagnostics = "nvim_lsp",
			diagnostics_indicator = diagnostics_indicator,
			show_buffer_icons = icons.have_nerd_font,
			show_buffer_close_icons = false,
			show_close_icon = false,
			close_command = function(bufnr)
				require("mini.bufremove").delete(bufnr, false)
			end,
			right_mouse_command = function(bufnr)
				require("mini.bufremove").delete(bufnr, false)
			end,
			separator_style = "thin",
			offsets = {
				{
					filetype = "oil",
					text = icons.group_label("explorer", "Explorer"),
					highlight = "Directory",
					text_align = "left",
				},
			},
		},
	})

	vim.o.showtabline = 2
end

return M
