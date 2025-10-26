local M = {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}

M.opts = {
  { 'border-fused', 'hide', 'fzf-native' },
  winopts = {
    border = 'single',
  },
  preview = {
    border = 'single',
    scrollbar = false,
  },
}

M.keys = function()
  local fzf = require 'fzf-lua'
  return {
    { '<Leader><Leader>', fzf.buffers, desc = '[ ] Find existing buffers' },
    {
      '<Leader>sc',
      function()
        fzf.files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = '[S]earch neovim [C]onfig',
    },
    { '<Leader>sf', fzf.files, desc = '[S]earch [F]iles' },
    { '<Leader>sg', fzf.live_grep, desc = '[S]earch by [G]rep' },
    { '<Leader>sh', fzf.helptags, desc = '[S]earch [H]elp' },
    { '<Leader>sl', fzf.loclist, desc = '[S]earch [L]oclist' },
    { '<Leader>so', fzf.oldfiles, desc = '[S]earch [O]ld files' },
    { '<Leader>sq', fzf.quickfix, desc = '[S]earch [Q]uickfix' },
    { '<Leader>sr', fzf.resume, desc = '[S]earch [R]esume' },
    { '<Leader>st', fzf.tabs, desc = '[S]earch [T]abs' },
    { '<Leader>sw', fzf.grep_cword, desc = '[S]earch current [W]ord' },
  }
end

return M
