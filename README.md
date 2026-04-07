# neovim-config

A minimal Neovim configuration using the built-in `vim.pack` package manager.<br>
No heavy frameworks - just the essentials.

## Prerequisites

- [Neovim](https://neovim.io/) >= 0.12 (requires `vim.pack` support)
- [fzf](https://github.com/junegunn/fzf)
- [tree-sitter-cli](https://github.com/tree-sitter/tree-sitter) — install via Cargo:
  ```bash
  cargo install tree-sitter-cli
  ```

## Plugins

| Plugin | Purpose |
|---|---|
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting & folding |
| [fzf-lua](https://github.com/ibhagwan/fzf-lua) | Fuzzy finder |
| [mini.nvim](https://github.com/echasnovski/mini.nvim) | Collection of minimal utilities |
