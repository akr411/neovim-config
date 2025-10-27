local M = {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}

M.opts = {
  { 'border-fused', 'hide', 'fzf-native' },
  oldfiles = {
    cwd_only = true,
    stat_file = true,
    include_current_session = true,
  },
  grep = {
    rg_glob = true,
    glob_flag = '--iglob',
    glob_separator = '%s%-%-',
  },
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
    { '<Leader>sv', fzf.grep_visual, desc = '[S]earch [V]isual selection' },
    { '<Leader>sw', fzf.grep_cword, desc = '[S]earch current [W]ord' },
    {
      '<Leader>s.',
      function()
        local opts = {
          prompt = 'Parent Directories> ',
          actions = {
            ['default'] = function(selected)
              fzf.files { cwd = selected[1] }
            end,
          },
        }

        local path = vim.fn.expand '%:p:h'
        if path:sub(1, 1) ~= '/' then
          return
        end

        local dirs = {}
        while path ~= '/' do
          path = vim.fn.fnamemodify(path, ':h')
          table.insert(dirs, path)
        end
        fzf.fzf_exec(dirs, opts)
      end,
      desc = '[S]earch parent directories [..]',
    },

    {
      '<Leader>po',
      fzf.complete_path,
      desc = '[P]ath c[O]mplete under cursor',
    },
  }
end

return M
