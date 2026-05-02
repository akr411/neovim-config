vim.pack.add({
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
})

require("mason").setup({
	ui = {
		border = "single",
	},
})

require("mason-lspconfig").setup({
	automatic_enable = false,
	ensure_installed = {
		"cssls",
		"emmet_language_server",
		"gopls",
		"html",
		"lua_ls",
		"marksman",
		"ts_ls",
	},
})

require("mason-tool-installer").setup({
	ensure_installed = {
		"biome",
		"gofumpt",
		"prettier",
		"shfmt",
		"stylua",
	},
})
