require("mini.ai").setup()
require("mini.bufremove").setup()
require("mini.cursorword").setup()
require("mini.icons").setup()
require("mini.move").setup()
require("mini.pairs").setup()
require("mini.statusline").setup()
require("mini.surround").setup()
require("mini.trailspace").setup()
require("mini.hipatterns").setup()

local statusline = require("mini.statusline")
statusline.section_mode = function()
	return ""
end
statusline.section_fileinfo = function()
	return vim.bo.filetype
end
statusline.setup({
	set_vim_settings = false,
})

vim.o.winbar = "%{%v:lua.MiniStatusline.active()%}"
vim.o.laststatus = 0
