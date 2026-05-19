vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = vim.g.have_nerd_font ~= false

if not vim.env.XDG_RUNTIME_DIR or vim.env.XDG_RUNTIME_DIR == "" then
	vim.env.XDG_RUNTIME_DIR = vim.fn.stdpath("run")
end

vim.filetype.add({
	extension = {
		gotmpl = "gotmpl",
		mdx = "markdown.mdx",
	},
})

-- suppress client.request dot-syntax deprecation until upstream plugins migrate to colon syntax
local _orig_deprecate = vim.deprecate
vim.deprecate = function(name, ...)
	if name == "client.request" then
		return
	end
	return _orig_deprecate(name, ...)
end

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_php_provider = 0
