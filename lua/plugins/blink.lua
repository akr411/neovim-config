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
  keymap = {
    preset = 'enter',
    ['<C-k>'] = { 'select_prev', 'fallback_to_mappings' },
    ['<C-j>'] = { 'select_next', 'fallback_to_mappings' },
    ['<C-p>'] = { 'scroll_documentation_up', 'fallback' },
    ['<C-n>'] = { 'scroll_documentation_down', 'fallback' },
  },
  appearance = { nerd_font_variant = 'mono' },
  completion = {
    menu = {
      border = 'single',
      scrollbar = false,
      draw = {
        treesitter = { 'lsp' },
      },
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
