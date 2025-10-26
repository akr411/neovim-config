# Neovim Configuration

Minimal Neovim setup with LSP, formatting and linting for
Rust, Golang, TypeScript, Lua and more.

## Requirements

- Neovim >= 0.11.0
- Git
- A [Nerd Font](https://www.nerdfonts.com/)
- Language toolchains: Rust, Go, Node.js (for respective language support)

## Installation

```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.backup

# Clone this repo
git clone https://github.com/akr411/neovim-config.git ~/.config/nvim

# Start Neovim
nvim
```

## Features

- LSP: Mason + nvim-lspconfig
- Completion: blink.cmp with snippet support
- Formatting: conform.nvim (format on save)
- Linting: nvim-lint with auto-linting
- Syntax: Treesitter
- Fuzzy find: fzf-lua for files, grep, LSP symbols
- UI: rose-pine colorscheme, mini.statusline, fidget.nvim for LSP progress

## Languages Supported

- Rust (rust-analyzer, rustfmt)
- Go (gopls, goimports, golangci-lint)
- TypeScript/JavaScript (ts_ls, eslint_d, prettierd)
- HTML/CSS (html, cssls, prettierd)
- Lua (lua_ls, stylua)
- Bash (bashls, shellcheck, shfmt)
- Markdown (marksman, markdownlint-cli2, prettierd)
- TOML (taplo)

## License

MIT
