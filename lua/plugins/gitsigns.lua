local M = {
  'lewis6991/gitsigns.nvim',
}

M.opts = {
  on_attach = function(bufnr)
    local gitsigns = require 'gitsigns'
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
    end

    map('[c', function()
      if vim.wo.diff then
        vim.cmd.normal { '[c', bang = true }
      else
        gitsigns.nav_hunk 'prev'
      end
    end, 'Jump to previous git [C]hange')
    map(']c', function()
      if vim.wo.diff then
        vim.cmd.normal { ']c', bang = true }
      else
        gitsigns.nav_hunk 'next'
      end
    end, 'Jump to next git [C]hange')

    map('<Leader>gs', function()
      gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
    end, '[G]it [S]tage hunk', 'v')
    map('<Leader>gr', function()
      gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
    end, '[G]it [R]eset hunk', 'v')

    map('<Leader>gb', gitsigns.blame_line, '[G]it [B]lame line')
    map('<Leader>gd', gitsigns.diffthis, '[G]it [D]iff against index')
    map('<Leader>gp', gitsigns.preview_hunk, '[G]it [P]review hunk')
    map('<Leader>gr', gitsigns.reset_hunk, '[G]it [R]eset hunk')
    map('<Leader>gR', gitsigns.reset_buffer, '[G]it [R]eset buffer')
    map('<Leader>gs', gitsigns.stage_hunk, '[G]it [S]tage hunk')
    map('<Leader>gS', gitsigns.stage_buffer, '[G]it [S]tage buffer')
    map('<Leader>gD', function()
      gitsigns.diffthis '@'
    end, '[G]it [D]iff against last commit')

    map(
      '<Leader>tb',
      gitsigns.toggle_current_line_blame,
      '[T]oggle git show [B]lame line'
    )
    map(
      '<Leader>tD',
      gitsigns.preview_hunk_inline,
      '[T]oggle git show [D]eleted'
    )
  end,
}

return M
