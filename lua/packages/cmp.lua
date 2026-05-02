vim.pack.add({
	"https://github.com/hrsh7th/cmp-buffer",
	"https://github.com/hrsh7th/cmp-path",
	"https://github.com/hrsh7th/cmp-cmdline",
	"https://github.com/f3fora/cmp-spell",
	"https://github.com/onsails/lspkind.nvim",
})

local cmp = require("cmp")
local lspkind = require("lspkind")

local lsp_kinds = {
	Class = " ",
	Color = " ",
	Constant = " ",
	Constructor = " ",
	Enum = " ",
	EnumMember = " ",
	Event = " ",
	Field = " ",
	File = " ",
	Folder = " ",
	Function = " ",
	Interface = " ",
	Keyword = " ",
	Method = " ",
	Module = " ",
	Operator = " ",
	Property = " ",
	Reference = " ",
	Snippet = " ",
	Struct = " ",
	Text = " ",
	TypeParameter = " ",
	Unit = " ",
	Value = " ",
	Variable = " ",
}

local select_next_item = function(fallback)
	if cmp.visible() then
		cmp.select_next_item()
	else
		fallback()
	end
end

local select_prev_item = function(fallback)
	if cmp.visible() then
		cmp.select_prev_item()
	else
		fallback()
	end
end

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
		{ name = "cmdline" },
		{
			name = "buffer",
			option = {
				max_item_count = 30,
				keyword_length = 3,
			},
		},
	}),
})

cmp.setup({
	preselect = cmp.PreselectMode.None,
	experimental = {
		ghost_text = false,
	},
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
	window = {
		documentation = {
			scrollbar = false,
			border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
		},
		completion = {
			scrollbar = false,
			border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
		},
	},
	-- config nvim cmp to work with snippet engine
	snippet = {},
	-- autocompletion sources
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "buffer" }, -- text within current buffer
		{ name = "path" }, -- file system paths
		{ name = "snippet" },
		{
			name = "spell", -- for markdown spellchecks completions
			option = {
				enable_in_context = function()
					local ft = vim.bo.filetype
					return ft == "markdown" or ft == "text"
				end,
			},
		},
	}),

	mapping = cmp.mapping.preset.insert({
		["<Esc>"] = cmp.mapping.abort(),
		["<C-d>"] = cmp.mapping(function()
			cmp.close_docs()
		end, { "i", "s" }),

		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-j>"] = cmp.mapping(select_next_item),
		["<C-k>"] = cmp.mapping(select_prev_item),
		["<Down>"] = cmp.mapping(select_next_item),
		["<Up>"] = cmp.mapping(select_prev_item),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = false,
		}),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if vim.snippet.active({ direction = -1 }) then
				vim.snippet.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),

		["<Tab>"] = cmp.mapping(function(fallback)
			if vim.snippet.active({ direction = 1 }) then
				vim.snippet.jump(1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),

	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = string.format("%s %s", lsp_kinds[vim_item.kind] or "", vim_item.kind)

			vim_item = lspkind.cmp_format({
				maxwidth = 25,
				ellipsis_char = "...",
			})(entry, vim_item)

			return vim_item
		end,
	},
})
