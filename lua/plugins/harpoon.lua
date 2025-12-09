local M = {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
}

M.keys = function()
  local harpoon = require 'harpoon'
  return {
    {
      '<Leader>aa',
      function()
        harpoon:list():add()
      end,
    },
    {
      '<Leader>ae',
      function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
    },
    {
      '<leader>ah',
      function()
        harpoon:list():prev()
      end,
    },
    {
      '<leader>al',
      function()
        harpoon:list():next()
      end,
    },
    {
      '<leader>a1',
      function()
        harpoon:list():select(1)
      end,
    },
    {
      '<leader>a2',
      function()
        harpoon:list():select(2)
      end,
    },
    {
      '<leader>a3',
      function()
        harpoon:list():select(3)
      end,
    },
    {
      '<leader>a4',
      function()
        harpoon:list():select(4)
      end,
    },
  }
end

return M
