local M = {}

M.lsp_servers = {
	"bashls",
	"cssls",
	"emmet_language_server",
	"gopls",
	"lua_ls",
	"marksman",
	"rust_analyzer",
	"ts_ls",
}

M.mason_tools = {
	"biome",
	"codelldb",
	"delve",
	"gofumpt",
	"goimports",
	"google-java-format",
	"jdtls",
	"java-debug-adapter",
	"java-test",
	"markdown-toc",
	"markdownlint-cli2",
	"mdformat",
	"prettier",
	"shellcheck",
	"shfmt",
	"stylua",
}

M.treesitter_parsers = {
	"bash",
	"lua",
	"vim",
	"vimdoc",
	"regex",
	"comment",
	"go",
	"gomod",
	"gosum",
	"gowork",
	"java",
	"rust",
	"xml",
	"css",
	"html",
	"javascript",
	"typescript",
	"json",
	"yaml",
	"toml",
	"markdown",
	"markdown_inline",
}

return M
