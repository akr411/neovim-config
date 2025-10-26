local M = {}

table.insert(M, {
  'folke/lazydev.nvim',
  ft = 'lua',
  opts = {
    library = {
      { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
    },
  },
})

local lspconfig = {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    'mason-org/mason-lspconfig.nvim',
    'whoissethdaniel/mason-tool-installer.nvim',
    {
      'j-hui/fidget.nvim',
      opts = {
        notification = {
          window = {
            winblend = 0,
            border = 'single',
          },
        },
      },
    },
    'saghen/blink.cmp',
  },
}

lspconfig.config = function()
  local capabilities = require('blink.cmp').get_lsp_capabilities()
  local servers = {
    bashls = {},
    cssls = {},
    gopls = {
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
            shadow = true,
          },
          staticcheck = true,
          gofumpt = true,
        },
      },
    },
    html = {},
    marksman = {},
    rust_analyzer = {
      settings = {
        checkOnSave = {
          allFeatures = true,
          command = 'clippy',
          extraArgs = { '--no-deps' },
        },
      },
    },
    taplo = {
      settings = {
        EvenBetterToml = {
          schema = {
            enabled = true,
          },
        },
      },
    },
    ts_ls = {},
    lua_ls = {
      settings = {
        Lua = {
          completion = { callSnippet = 'Replace' },
        },
      },
    },
  }
  local ensure_installed = vim.tbl_keys(servers or {})
  vim.list_extend(ensure_installed, {
    -- Formatters
    'gofumpt',
    'goimports',
    'prettierd',
    'shfmt',
    'stylua',
    'taplo',

    -- Linters
    'eslint_d',
    'golangci-lint',
    'markdownlint-cli2',
    'shellcheck',
  })
  require('mason-tool-installer').setup {
    ensure_installed = ensure_installed,
    auto_update = true,
    run_on_start = true,
  }
  require('mason-lspconfig').setup {
    ensure_installed = {},
    automatic_installation = false,
    handlers = {
      function(server_name)
        local server = servers[server_name] or {}
        server.capabilities = vim.tbl_deep_extend(
          'force',
          {},
          capabilities,
          server.capabilities or {}
        )
        require('lspconfig')[server_name].setup(server)
      end,
    },
  }

  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
    callback = function(event)
      local fzf = require 'fzf-lua'
      local map = function(keys, func, desc, mode)
        mode = mode or 'n'
        vim.keymap.set(
          mode,
          keys,
          func,
          { buffer = event.buf, desc = 'LSP: ' .. desc }
        )
      end
      map('gd', fzf.lsp_definitions, '[G]oto [D]efinition')
      map('gD', fzf.lsp_declarations, '[G]oto [D]eclaration')
      map('gi', fzf.lsp_implementations, '[G]oto [I]mplementation')
      map('gr', fzf.lsp_references, '[G]oto [R]eferences')
      map('gs', fzf.lsp_document_symbols, '[G]oto Document [S]ymbols')
      map('gw', fzf.lsp_live_workspace_symbols, '[G]oto workspace [S]ymbols')
      map('gt', fzf.lsp_typedefs, '[G]oto [T]ype definition')

      map('<Leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
      map('<Leader>cn', vim.lsp.buf.rename, '[C]ode re[N]ame')
      map('<Leader>th', function()
        vim.lsp.inlay_hint.enable(
          not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf }
        )
      end, '[T]oggle inlay [H]ints')
    end,
  })
end

table.insert(M, lspconfig)

return M
