local M = {
  'folke/zen-mode.nvim',
}

M.opts = {
  plugins = {
    gitsigns = { enabled = true },
  },
}

M.keys = {
  {
    '<Leader>tz',
    function()
      require('zen-mode').toggle()
    end,
    desc = '[T]oggle [Z]en-mode',
  },
}

return M
