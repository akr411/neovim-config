# nvim-config

![Neovim](https://img.shields.io/badge/Neovim-0.12-57A143?style=for-the-badge&logo=neovim&logoColor=white)
![vim.pack](https://img.shields.io/badge/vim.pack-builtin-blue?style=for-the-badge)
![Languages](https://img.shields.io/badge/Go%20%7C%20Java%20%7C%20Rust-primary-00ADD8?style=for-the-badge)
![Nerd Fonts](https://img.shields.io/badge/Nerd_Fonts-optional-orange?style=for-the-badge)

Go, Java and Rust dev config for Neovim 0.12, using the built-in `vim.pack` package manager.

---

## Structure

```
lua/
  core/         globals, options, keymaps, autocmds, commands, icons, utils
  packages/
    init.lua    loader: collects all plugin specs → vim.pack.add → setup()
    deps.lua    shared infra (plenary, nvim-nio)
    *.lua       one file per feature; each returns { plugins = {...}, setup = fn }
snippets/       snippet files (go, java, rust, sh, markdown) — VSCode format
syntax/         custom syntax definitions (gotmpl, gowork, mdx)
docs/           plugins, keymaps, language support
```

Each `packages/foo.lua` has its plugin declarations and config in one place — open any file to see what it installs and how it's configured.

---

## Requirements

| Dependency | Version | Purpose |
|---|---|---|
| [Neovim](https://neovim.io) | `>= 0.12` | Required |
| [Nerd Font](https://www.nerdfonts.com) | v3 | Optional, icons |
| [ripgrep](https://github.com/BurntSushi/ripgrep) | any | fzf-lua grep |
| [fd](https://github.com/sharkdp/fd) | any | fzf-lua file find |
| [fzf](https://github.com/junegunn/fzf) | any | fzf-lua backend |
| [Go toolchain](https://go.dev/dl/) | `>= 1.21` | gopls, goimports, delve |
| [JDK](https://adoptium.net) | `>= 17` | jdtls, google-java-format |
| [Rust toolchain](https://rustup.rs) | stable | rust-analyzer, rustfmt, codellb |

---

## Installation

```bash
# Back up existing config
mv ~/.config/nvim ~/.config/nvim.bak

# Clone
git clone https://github.com/anwaya-rai/nvim.git ~/.config/nvim

# Start Neovim — vim.pack installs all plugins on first launch
nvim
```

---

## Docs

- [Language Support](docs/languages.md) — Go, Java, Rust, Bash: LSP, formatters, debuggers, snippets
- [Plugins](docs/plugins.md) — full plugin list by category
- [Keymaps](docs/keymaps.md) — all keybindings by category
