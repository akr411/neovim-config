local M = {
  'rose-pine/neovim',
  name = 'rose-pine',
  priority = 1000,
}

M.opts = {}

M.config = function()
  require('rose-pine').setup {
    styles = {
      italic = false,
      transparency = true,
    },
    highlight_groups = {
      Comment = { italic = true },
    },
  }
  vim.cmd 'colorscheme rose-pine'
end

return M
