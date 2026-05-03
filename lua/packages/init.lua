vim.pack.add({
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/lukas-reineke/indent-blankline.nvim",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mofiqul/vscode.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/stevearc/oil.nvim",
	"https://www.github.com/echasnovski/mini.nvim",
	"https://www.github.com/ibhagwan/fzf-lua",
	"https://github.com/mfussenegger/nvim-dap",
	{
		src = "https://github.com/hrsh7th/nvim-cmp",
		branch = "main",
	},
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
	},
})

require("packages.cmp")
require("packages.colorscheme")
require("packages.dap")
require("packages.format")
require("packages.fzf")
require("packages.gitsigns")
require("packages.indent-blankline")
require("packages.lsp")
require("packages.mason")
require("packages.mini")
require("packages.oil")
require("packages.treesitter")
