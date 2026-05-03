vim.pack.add({
	"https://github.com/hrsh7th/cmp-nvim-lsp",
	{ src = "https://github.com/antosha417/nvim-lsp-file-operations", config = true },
	"https://github.com/nvim-lua/plenary.nvim",
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local fzf = require("fzf-lua")
		local opts = { buffer = ev.buf, silent = true }

		-- Goto's
		vim.keymap.set("n", "gR", fzf.lsp_references, opts)
		vim.keymap.set("n", "gD", fzf.lsp_declarations, opts)
		vim.keymap.set("n", "gd", fzf.lsp_definitions, opts)
		vim.keymap.set("n", "gi", fzf.lsp_implementations, opts)
		vim.keymap.set("n", "gt", fzf.lsp_typedefs, opts)

		-- Code actions
		vim.keymap.set({ "n", "v" }, "<Leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<Leader>cr", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<Leader>cd", vim.diagnostic.open_float, opts)

		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

		-- Lsp
		vim.keymap.set("n", "<Leader>lr", "<Cmd>lsp restart<CR>", opts)
		vim.keymap.set("n", "<Leader>lh", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<leader>lx", function()
			local current = vim.diagnostic.config().virtual_text
			vim.diagnostic.config({ virtual_text = not current })
		end)
	end,
})

local signs = {
	[vim.diagnostic.severity.ERROR] = " ",
	[vim.diagnostic.severity.WARN] = " ",
	[vim.diagnostic.severity.HINT] = " ",
	[vim.diagnostic.severity.INFO] = " ",
}
vim.diagnostic.config({
	signs = { text = signs },
	virtual_text = true,
	underline = true,
	update_in_insert = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "single",
		source = true,
	},
})

local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities()

vim.lsp.config("*", {
	capabilities = capabilities,
})

-- LSP configurations
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			completion = {
				callSnippets = "Replace",
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

vim.lsp.config("emmet_language_server", {
	filetypes = {
		"css",
		"html",
		"javascript",
		"javascriptreact",
		"less",
		"typescriptreact",
	},
	init_options = {
		includeLanguages = {},
		excludeLanguages = {},
		extensionsPath = {},
		preferences = {},
		showAbbreviationSuggestions = true,
		showExpandedAbbreviation = "always",
		showSuggestionsAsSnippets = false,
		syntaxProfiles = {},
		variables = {},
	},
})

vim.lsp.config("ts_ls", {
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},
	single_file_support = true,
	init_options = {
		preferences = {
			includeCompletionsForModuleExports = true,
			includeCompletionsForImportStatements = true,
		},
	},
	settings = {
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayVariableTypeHints = true,
				includeInlayFunctionParameterTypeHints = true,
			},
		},
		javascript = {
			validate = {
				enable = true,
			},
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayVariableTypeHints = true,
			},
		},
	},
})

vim.lsp.config("gopls", {
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
			gofumpt = true,
		},
	},
})

vim.lsp.config("jdtls", {
	settings = {
		java = {
			signatureHelp = { enabled = true },
		},
	},
})

vim.lsp.config("cssls", {
	filetypes = { "css", "scss", "less" },
	init_options = { provideFormatter = true },
	single_file_support = true,
	settings = {
		css = {
			lint = {
				unknownAtRules = "ignore",
			},
			validate = true,
		},
		scss = {
			lint = {
				unknownAtRules = "ignore",
			},
			validate = true,
		},
		less = {
			lint = {
				unknownAtRules = "ignore",
			},
			validate = true,
		},
	},
})

vim.lsp.enable({
	"cssls",
	"emmet_language_server",
	"gopls",
	"lua_ls",
	"marksman",
	"ts_ls",
	"jdtls",
})
