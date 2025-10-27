local M = {
  'folke/which-key.nvim',
  event = 'VimEnter',
}

M.opts = {
  preset = 'helix',
  delay = 500,
  win = {
    border = 'single',
  },
  spec = {
    { '<Leader>b', group = '[B]uffer' },
    { '<Leader>c', group = '[C]ode' },
    { '<Leader>g', group = '[G]it' },
    { '<Leader>p', group = '[P]ath' },
    { '<Leader>s', group = '[S]earch' },
    { '<Leader>t', group = '[T]oggle' },
    { '<Leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
  },
}

return M
