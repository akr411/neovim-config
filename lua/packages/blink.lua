local M = {}

M.plugins = {
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("1.*"),
	},
}

local hc = nil
local function highlight_colors()
	if not hc then
		hc = require("nvim-highlight-colors")
	end
	return hc
end

function M.setup()
	local icons = require("core.icons")

	require("blink.cmp").setup({
		enabled = function()
			local ok, captures = pcall(
				vim.treesitter.get_captures_at_pos,
				0,
				vim.api.nvim_win_get_cursor(0)[1] - 1,
				vim.api.nvim_win_get_cursor(0)[2]
			)
			if not ok then
				return true
			end
			for _, cap in ipairs(captures) do
				if cap.capture == "string" or cap.capture == "string.special" then
					return false
				end
			end
			return true
		end,
		keymap = {
			preset = "default",
			["<CR>"] = { "accept", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
			["<C-k>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<Up>"] = { "select_prev", "fallback" },
			["<C-d>"] = { "scroll_documentation_down", "fallback" },
			["<C-b>"] = { "scroll_documentation_up", "fallback" },
		},
		sources = {
			default = { "lsp", "path", "snippets" },
			providers = {
				snippets = {
					opts = {
						search_paths = { vim.fn.stdpath("config") .. "/snippets" },
					},
				},
			},
		},
		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
				window = { border = "single" },
			},
			ghost_text = { enabled = false },
			menu = {
				border = "single",
				draw = {
					treesitter = { "lsp" },
					columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "source_name" } },
					components = {
						kind_icon = {
							text = function(ctx)
								local icon = ctx.kind_icon
								if ctx.item.source_name == "LSP" then
									local ci = highlight_colors().format(ctx.item.documentation, { kind = ctx.kind })
									if ci and ci.abbr ~= "" then
										icon = ci.abbr
									end
								end
								return icon .. ctx.icon_gap
							end,
							highlight = function(ctx)
								local hl = "BlinkCmpKind" .. ctx.kind
								if ctx.item.source_name == "LSP" then
									local ci = highlight_colors().format(ctx.item.documentation, { kind = ctx.kind })
									if ci and ci.abbr_hl_group then
										hl = ci.abbr_hl_group
									end
								end
								return hl
							end,
						},
					},
				},
			},
			list = {
				selection = { preselect = true, auto_insert = false },
			},
		},
		signature = {
			enabled = true,
			window = { border = "single" },
		},
		fuzzy = {
			implementation = "prefer_rust",
		},
		appearance = { kind_icons = icons.lsp_kinds },
	})
end

return M
