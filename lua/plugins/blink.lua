local M = {
  'saghen/blink.cmp',
  event = 'VimEnter',
  version = '1.*',
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      version = '2.*',
      build = 'make install_jsregexp',
      opts = {},
    },
    'folke/lazydev.nvim',
  },
}

M.opts = {
  keymap = { preset = 'default' },
  appearance = { nerd_font_variant = 'mono' },
  completion = {
    menu = {
      border = 'single',
      scrollbar = false,
    },
    documentation = {
      auto_show = false,
      auto_show_delay_ms = 500,
      window = { border = 'single' },
    },
  },
  signature = {
    enabled = true,
    window = { border = 'single' },
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'lazydev' },
    providers = {
      lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
    },
  },
  snippets = { preset = 'luasnip' },
  fuzzy = { implementation = 'prefer_rust_with_warning' },
}

return M
