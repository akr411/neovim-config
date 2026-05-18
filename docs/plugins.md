# Plugins

## Editor

| Plugin | Purpose |
|---|---|
| [blink.cmp](https://github.com/saghen/blink.cmp) | Rust-based completion with LSP kind icons |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax, folds, injections |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Format on save |
| [vim-illuminate](https://github.com/RRethy/vim-illuminate) | LSP-powered word highlight |
| [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim) | Scope-aware indent guides |
| [nvim-highlight-colors](https://github.com/brenoprata10/nvim-highlight-colors) | Inline color preview for hex, rgb, hsl, named colors |

## Navigation

| Plugin | Purpose |
|---|---|
| [fzf-lua](https://github.com/ibhagwan/fzf-lua) | Files, grep, LSP symbols, diagnostics |
| [oil.nvim](https://github.com/stevearc/oil.nvim) | Edit filesystem as a buffer |
| [oil-git-status.nvim](https://github.com/refractalize/oil-git-status.nvim) | Git status indicators in oil |
| [aerial.nvim](https://github.com/stevearc/aerial.nvim) | Symbol outline sidebar |
| [auto-session](https://github.com/rmagatti/auto-session) | Per-directory + per-branch sessions |

## LSP & Code Intelligence

| Plugin | Purpose |
|---|---|
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP server configs (`vim.lsp.config` API) |
| [mason.nvim](https://github.com/mason-org/mason.nvim) | Install/manage LSP servers and tools |
| [mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim) | Bridge mason and lspconfig |
| [mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) | Keep configured Mason tools installed |
| [nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls) | Full Java language server |
| [lazydev.nvim](https://github.com/folke/lazydev.nvim) | Neovim Lua API completion |
| [fidget.nvim](https://github.com/j-hui/fidget.nvim) | LSP progress indicator |
| [trouble.nvim](https://github.com/folke/trouble.nvim) | Diagnostics and LSP reference panels |

## Debugging

| Plugin | Purpose |
|---|---|
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) | Debug adapter protocol client |
| [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) | DAP UI (auto-opens on session start) |
| [nvim-dap-go](https://github.com/leoluz/nvim-dap-go) | Delve adapter for Go |

## Testing

| Plugin | Purpose |
|---|---|
| [neotest](https://github.com/nvim-neotest/neotest) | Test runner framework |
| [neotest-golang](https://github.com/fredrikaverpil/neotest-golang) | Go test adapter |

## Git

| Plugin | Purpose |
|---|---|
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Hunk signs, stage, blame |
| [vim-fugitive](https://github.com/tpope/vim-fugitive) | Git commands (status, commit, push, log) |
| [diffview.nvim](https://github.com/sindrets/diffview.nvim) | Side-by-side diff and file history |

## UI

| Plugin | Purpose |
|---|---|
| [mini.nvim](https://github.com/echasnovski/mini.nvim) | ai, align, bracketed, bufremove, jump2d, move, notify, operators, pairs, splitjoin, surround, trailspace, statusline, starter |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | Buffer tab line |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | File type icons |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keymap hints |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | Highlight and search TODO/FIXME |

## Markdown

| Plugin | Purpose |
|---|---|
| [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) | Live browser preview with dark theme and mermaid support |

## Refactoring & Productivity

| Plugin | Purpose |
|---|---|
| [refactoring.nvim](https://github.com/ThePrimeagen/refactoring.nvim) | Extract function/variable, inline, debug prints |
| [async.nvim](https://github.com/lewis6991/async.nvim) | Async library (required by refactoring.nvim) |
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | Persistent floating terminal |

## Dependencies

| Plugin | Purpose |
|---|---|
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | Lua utility library |
| [nvim-nio](https://github.com/nvim-neotest/nvim-nio) | Async I/O library (required by nvim-dap-ui, neotest) |
