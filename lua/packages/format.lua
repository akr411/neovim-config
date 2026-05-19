local M = {}

M.plugins = {
	"https://github.com/stevearc/conform.nvim",
}

function M.setup()
	local conform = require("conform")
	local fmt_opts = { lsp_format = "fallback", async = false, timeout_ms = 1000 }
	local markdown_formatters = {}

	if vim.fn.executable("mdformat") == 1 then
		table.insert(markdown_formatters, "mdformat")
	end
	if vim.fn.executable("markdown-toc") == 1 then
		table.insert(markdown_formatters, "markdown-toc")
	end
	table.insert(markdown_formatters, "prettier")

	conform.setup({
		formatters = {
			["markdown-toc"] = {
				condition = function(_, ctx)
					for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
						if line:find("<!%-%- toc %-%->") then
							return true
						end
					end
				end,
			},
			["markdownlint-cli2"] = {
				condition = function(_, ctx)
					local diag = vim.tbl_filter(function(d)
						return d.source == "markdownlint"
					end, vim.diagnostic.get(ctx.buf))
					return #diag > 0
				end,
			},
			["prettier"] = {
				args = { "--stdin-filepath", "$FILENAME", "--tab-width", "4", "--no-use-tabs" },
			},
			["shfmt"] = {
				prepend_args = { "-i", "4", "-bn", "-ci", "-sr" },
			},
		},
		formatters_by_ft = {
			go = { "goimports", "gofumpt" },
			java = { "google-java-format" },
			lua = { "stylua" },
			markdown = markdown_formatters,
			rust = { "rustfmt" },
			sh = { "shfmt" },
			bash = { "shfmt" },
		},
		format_on_save = fmt_opts,
	})

	local map = require("core.utils").mapper()
	map({ "n", "v" }, "<Leader>cf", function()
		conform.format(fmt_opts)
	end, "Format buffer")
end

return M
