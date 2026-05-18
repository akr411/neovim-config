local M = {}

M.plugins = {
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
}

function M.setup()
	local icons = require("core.icons")
	local requirements = require("core.requirements")

	require("mason").setup({
		ui = {
			border = "single",
			icons = {
				package_installed = icons.ui.ok,
				package_pending = icons.ui.pending,
				package_uninstalled = icons.ui.off,
			},
		},
	})

	require("mason-lspconfig").setup({
		ensure_installed = requirements.lsp_servers,
		automatic_enable = false,
	})

	require("mason-tool-installer").setup({
		ensure_installed = requirements.mason_tools,
		auto_update = true,
		run_on_start = true,
	})
end

return M
