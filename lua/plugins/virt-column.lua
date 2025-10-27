local M = {
  'lukas-reineke/virt-column.nvim',
}

M.opts = {
  char = '│',
  virtcolumn = '80',
  exclude = {
    filetypes = {
      'help',
      'lazy',
      'netrw',
      'oil',
    },
  },
}

return M
