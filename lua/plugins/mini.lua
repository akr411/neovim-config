local M = {
  'echasnovski/mini.nvim',
}

M.config = function()
  require('mini.ai').setup { n_lines = 500 }
  require('mini.surround').setup()
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
end

return M
