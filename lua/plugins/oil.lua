local M = {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}

M.init = function()
  -- If neovim is opened in a directory launch oil in that directory
  -- (netrw) behavior
  vim.api.nvim_create_autocmd('BufEnter', {
    desc = 'Open oil on directory',
    group = vim.api.nvim_create_augroup('oil-start', { clear = true }),
    callback = function()
      local bufname = vim.api.nvim_buf_get_name(0)
      if vim.fn.isdirectory(bufname) == 1 then
        vim.defer_fn(function()
          require('oil').open(bufname)
        end, 0)
      end
    end,
  })
end

M.keys = {
  {
    '<Leader>e',
    function()
      require('oil').toggle_float()
    end,
    desc = 'Open [E]xplorer',
  },
}

M.opts = {
  default_file_explorer = true,
  keymaps = {
    ['<Esc>'] = {
      function()
        require('oil').close()
      end,
      desc = 'Close oil window',
      mode = 'n',
    },
  },
  columns = {
    'icon',
    'size',
    'mtime',
  },
  win_options = {
    signcolumn = 'yes',
    spell = false,
    list = true,
  },
  float = {
    padding = 4,
    border = 'single',
  },
  confirmation = {
    border = 'single',
  },
  progress = {
    border = 'single',
  },
  keymaps_help = {
    border = 'single',
  },
}

return M
