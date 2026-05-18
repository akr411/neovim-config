local M = {}

M.plugins = {
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main",
	},
}

function M.setup()
	local requirements = require("core.requirements")
	local treesitter = require("nvim-treesitter")

	treesitter.setup()
	treesitter.install(requirements.treesitter_parsers)

	local group = vim.api.nvim_create_augroup("TreeSitterConfig", { clear = true })
	vim.api.nvim_create_autocmd("FileType", {
		group = group,
		callback = function(args)
			pcall(vim.treesitter.start, args.buf)
		end,
	})
end

return M
