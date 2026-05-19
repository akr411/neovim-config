local M = {}

M.plugins = {
	"https://github.com/stevearc/conform.nvim",
}

function M.setup()
	local conform = require("conform")
	local fmt_opts = { lsp_format = "fallback", async = false, timeout_ms = 1000 }

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
			["shfmt"] = {
				prepend_args = { "-i", "4", "-bn", "-ci", "-sr" },
			},
		},
		formatters_by_ft = {
			bash = { "shfmt" },
			css = { "prettierd" },
			go = { "goimports", "gofumpt" },
			html = { "prettierd" },
			java = { "google-java-format" },
			javascript = { "prettierd" },
			javascriptreact = { "prettierd" },
			json = { "prettierd" },
			less = { "prettierd" },
			lua = { "stylua" },
			markdown = { "mdformat", "markdownlint-cli2", "markdown-toc", "prettierd" },
			rust = { "rustfmt" },
			scss = { "prettierd" },
			sh = { "shfmt" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
		},
		format_on_save = fmt_opts,
	})

	local map = require("core.utils").mapper()
	map({ "n", "v" }, "<Leader>cf", function()
		conform.format(fmt_opts)
	end, "Format buffer")
end

return M
