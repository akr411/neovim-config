vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
	},
	"https://www.github.com/ibhagwan/fzf-lua",
	"https://www.github.com/echasnovski/mini.nvim",
})

-- Treesitter
local setup_treesitter = function()
  local treesitter = require("nvim-treesitter")
  treesitter.setup()
  local ensure_installed = {
  	"bash",
  	"json",
    "lua",
  	"markdown",
  	"vim",
  	"vimdoc",
  }

  local config = require("nvim-treesitter.config")

  local already_installed = config.get_installed()
  local parsers_to_install = {}

  for _, parser in ipairs(ensure_installed) do
  	if not vim.tbl_contains(already_installed, parser) then
  		table.insert(parsers_to_install, parser)
  	end
  end

  if #parsers_to_install > 0 then
  	treesitter.install(parsers_to_install)
  end

  local group = vim.api.nvim_create_augroup("TreeSitterConfig", { clear = true })
  vim.api.nvim_create_autocmd("FileType", {
  	group = group,
  	callback = function(args)
  		if vim.list_contains(treesitter.get_installed(), vim.treesitter.language.get_lang(args.match)) then
  			vim.treesitter.start(args.buf)
  		end
  	end,
  })
end

setup_treesitter()

-- FZF
require("fzf-lua").setup()

vim.keymap.set("n", "<Leader>ff", function()
	require("fzf-lua").files()
end, { desc = "FZF Files" })
vim.keymap.set("n", "<Leader>fg", function()
	require("fzf-lua").live_grep()
end, { desc = "FZF Live Grep" })
vim.keymap.set("n", "<Leader>fb", function()
	require("fzf-lua").buffers()
end, { desc = "FZF Buffers" })
vim.keymap.set("n", "<Leader>fh", function()
	require("fzf-lua").help_tags()
end, { desc = "FZF Help Tags" })
vim.keymap.set("n", "<Leader>fx", function()
	require("fzf-lua").diagnostics_document()
end, { desc = "FZF Diagnostics Document" })
vim.keymap.set("n", "<Leader>fX", function()
	require("fzf-lua").diagnostics_workspace()
end, { desc = "FZF Diagnostics Workspace" })

-- Mini.nvim
require("mini.ai").setup()
require("mini.move").setup()
require("mini.surround").setup()
require("mini.cursorword").setup()
require("mini.indentscope").setup()
require("mini.pairs").setup()
require("mini.trailspace").setup()
require("mini.bufremove").setup()
require("mini.statusline").setup()
local statusline = require 'mini.statusline'
statusline.section_mode = function()
  return ''
end
statusline.section_fileinfo = function()
  return vim.bo.filetype
end
statusline.setup {
  set_vim_settings = false,
}
