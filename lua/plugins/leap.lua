local M = {
  'ggandor/leap.nvim',
}

M.config = function()
  local leap = require 'leap'
  local leap_user = require 'leap.user'
  leap_user.set_repeat_keys('<C-j>', '<C-k>')

  -- Enhanced f/t motions
  do
    local function as_ft(key_args)
      local common_args = {
        inputlen = 1,
        inclusive = true,
        opts = {
          labels = '',
          safe_labels = vim.fn.mode(1):match '[no]' and '' or nil,
        },
      }
      return vim.tbl_deep_extend('keep', common_args, key_args)
    end

    local clever = leap_user.with_traversal_keys
    local clever_f = clever('f', 'F')
    local clever_t = clever('t', 'T')

    for k, key_args in pairs {
      f = { opts = clever_f },
      F = { backward = true, opts = clever_f },
      t = { offset = -1, opts = clever_t },
      T = { backward = true, offset = -1, opts = clever_t },
    } do
      vim.keymap.set({ 'n', 'x', 'o' }, k, function()
        leap.leap(as_ft(key_args))
      end)
    end
  end

  -- Search integration
  vim.api.nvim_create_autocmd('CmdlineLeave', {
    group = vim.api.nvim_create_augroup('LeapOnSearch', {}),
    callback = function()
      local ev = vim.v.event
      local is_search_cmd = (ev.cmdtype == '/') or (ev.cmdtype == '?')
      local cnt = vim.fn.searchcount().total
      if is_search_cmd and not ev.abort and (cnt > 1) then
        vim.schedule(function()
          local labels = require('leap').opts.safe_labels:gsub('[nN]', '')
          local vim_opts = { ['wo.conceallevel'] = vim.wo.conceallevel }
          require('leap').leap {
            pattern = vim.fn.getreg '/',
            windows = { vim.fn.win_getid() },
            opts = { safe_labels = '', labels = labels, vim_opts = vim_opts },
          }
        end)
      end
    end,
  })
end

return M
