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
  -- Move statusline to the top
  vim.o.winbar = '%{%v:lua.MiniStatusline.active()%}'
  vim.o.laststatus = 0

  local hipatterns = require 'mini.hipatterns'
  hipatterns.setup {
    highlighters = {
      fixme = {
        pattern = '%f[%w]()FIXME()%f[%W]',
        group = 'MiniHipatternsFixme',
      },
      hack = {
        pattern = '%f[%w]()HACK()%f[%W]',
        group = 'MiniHipatternsHack',
      },
      todo = {
        pattern = '%f[%w]()TODO()%f[%W]',
        group = 'MiniHipatternsTodo',
      },
      note = {
        pattern = '%f[%w]()NOTE()%f[%W]',
        group = 'MiniHipatternsNote',
      },

      hex_color = hipatterns.gen_highlighter.hex_color(),
    },
  }
end

return M
