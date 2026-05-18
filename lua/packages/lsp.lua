local M = {}

M.plugins = {
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/j-hui/fidget.nvim",
	"https://github.com/folke/lazydev.nvim",
}

function M.setup()
	local icons = require("core.icons")
	local requirements = require("core.requirements")

	require("fidget").setup({
		progress = {
			display = {
				progress_icon = { pattern = "meter", period = 1 },
				done_icon = icons.ui.ok,
				progress_style = "Comment",
				group_style = "Title",
				icon_style = "Question",
			},
		},
		notification = {
			window = { winblend = 0 },
		},
	})

	require("lazydev").setup({
		library = {
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		},
	})

	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
		callback = function(ev)
			local fzf = require("fzf-lua")
			local map = require("core.utils").buf_mapper(ev.buf)

			map("n", "gR", fzf.lsp_references, "LSP references")
			map("n", "gD", fzf.lsp_declarations, "LSP declarations")
			map("n", "gd", fzf.lsp_definitions, "LSP definitions")
			map("n", "gi", fzf.lsp_implementations, "LSP implementations")
			map("n", "gt", fzf.lsp_typedefs, "LSP type definitions")
			map({ "n", "v" }, "<Leader>ca", vim.lsp.buf.code_action, "Code action")
			map("n", "<Leader>cr", vim.lsp.buf.rename, "Rename symbol")
			map("n", "<Leader>cd", vim.diagnostic.open_float, "Line diagnostics")
			map("n", "K", vim.lsp.buf.hover, "Hover")
			map("n", "<Leader>lr", "<Cmd>LspRestart<CR>", "LSP restart")
			map("n", "<Leader>lh", vim.lsp.buf.signature_help, "Signature help")
			map("n", "<Leader>lx", function()
				local current = vim.diagnostic.config().virtual_text
				vim.diagnostic.config({ virtual_text = not current })
			end, "Toggle virtual text")

			for _, v in ipairs({
				{ key = "]d", count = 1, sev = nil, desc = "Next diagnostic" },
				{ key = "[d", count = -1, sev = nil, desc = "Prev diagnostic" },
				{ key = "]e", count = 1, sev = "ERROR", desc = "Next error" },
				{ key = "[e", count = -1, sev = "ERROR", desc = "Prev error" },
				{ key = "]w", count = 1, sev = "WARN", desc = "Next warning" },
				{ key = "[w", count = -1, sev = "WARN", desc = "Prev warning" },
			}) do
				map("n", v.key, function()
					vim.diagnostic.jump({ count = v.count, severity = v.sev and vim.diagnostic.severity[v.sev] })
				end, v.desc)
			end
		end,
	})

	local signs = {
		[vim.diagnostic.severity.ERROR] = icons.ui.diagnostic_error,
		[vim.diagnostic.severity.WARN] = icons.ui.diagnostic_warn,
		[vim.diagnostic.severity.HINT] = icons.ui.diagnostic_hint,
		[vim.diagnostic.severity.INFO] = icons.ui.diagnostic_info,
	}
	vim.diagnostic.config({
		signs = { text = signs },
		virtual_text = true,
		underline = true,
		update_in_insert = false,
		float = {
			focusable = false,
			style = "minimal",
			border = "single",
			source = true,
		},
	})

	local capabilities = require("blink.cmp").get_lsp_capabilities()
	vim.lsp.config("*", { capabilities = capabilities })

	vim.lsp.config("lua_ls", {
		settings = {
			Lua = {
				completion = { callSnippets = "Replace" },
			},
		},
	})

	vim.lsp.config("emmet_language_server", {
		filetypes = { "css", "html", "javascript", "javascriptreact", "less", "typescriptreact" },
	})

	vim.lsp.config("ts_ls", {
		filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
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
				validate = { enable = true },
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
				analyses = { unusedparams = true, shadow = true, unusedwrite = true },
				staticcheck = true,
				gofumpt = true,
				hints = {
					assignVariableTypes = true,
					compositeLiteralFields = true,
					compositeLiteralTypes = true,
					constantValues = true,
					functionTypeParameters = true,
					parameterNames = true,
					rangeVariableTypes = true,
				},
			},
		},
	})

	vim.lsp.config("cssls", {
		filetypes = { "css", "scss", "less" },
		init_options = { provideFormatter = true },
		single_file_support = true,
		settings = {
			css = { lint = { unknownAtRules = "ignore" }, validate = true },
			scss = { lint = { unknownAtRules = "ignore" }, validate = true },
			less = { lint = { unknownAtRules = "ignore" }, validate = true },
		},
	})

	vim.lsp.config("bashls", {
		settings = {
			bashIde = {
				shellcheckArguments = "--shell=bash",
				globPattern = "*@(.sh|.inc|.bash|.command)",
			},
		},
	})

	local enabled_servers = vim.deepcopy(requirements.lsp_servers)
	if vim.fn.executable("emmet-language-server") ~= 1 then
		enabled_servers = vim.tbl_filter(function(s)
			return s ~= "emmet_language_server"
		end, enabled_servers)
	end
	vim.lsp.enable(enabled_servers)
end

return M
