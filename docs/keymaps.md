# Keymaps

`<Space>` is the leader key. Press it in normal mode to open which-key and browse all bindings.

---

[File & Navigation](#file--navigation) · [LSP & Diagnostics](#lsp--diagnostics) · [Debugging](#debugging-dap) · [Testing](#testing-neotest) · [Git](#git) · [Java](#java) · [Refactoring](#refactoring) · [Buffers & Windows](#buffers--windows) · [Editing](#editing) · [Markdown](#markdown) · [Terminal & Session](#terminal--session) · [Package Management](#package-management)

---

## File & Navigation

| Key | Description |
|---|---|
| `<Leader>e` | oil (inline) |
| `<Leader>E` | oil (float) |
| `<Leader>ff` | Find files |
| `<Leader>fF` | Find all files |
| `<Leader>fg` | Live grep |
| `<Leader>fw` | Grep word under cursor / selection |
| `<Leader><Leader>` | Buffers |
| `<Leader>fo` | Recent files |
| `<Leader>fr` | Resume last picker |
| `<Leader>fh` | Help tags |
| `<Leader>fs` | LSP document symbols |
| `<Leader>fS` | LSP workspace symbols |
| `<Leader>fx` | Buffer diagnostics (fzf) |
| `<Leader>fX` | Workspace diagnostics (fzf) |
| `<Leader>ft` | Find TODOs |
| `<Leader>a` | Toggle aerial outline |

## LSP & Diagnostics

| Key | Description |
|---|---|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gR` | References |
| `gi` | Implementations |
| `gt` | Type definitions |
| `K` | Hover docs |
| `<Leader>ca` | Code action |
| `<Leader>cr` | Rename symbol |
| `<Leader>cd` | Diagnostic float |
| `<Leader>cf` | Format buffer / selection |
| `<Leader>lh` | Signature help |
| `<Leader>lr` | Restart LSP |
| `<Leader>lx` | Toggle virtual text |
| `]d` / `[d` | Next / prev diagnostic |
| `]e` / `[e` | Next / prev error |
| `]w` / `[w` | Next / prev warning |
| `<Leader>xx` | Workspace diagnostics (trouble) |
| `<Leader>xb` | Buffer diagnostics (trouble) |
| `<Leader>xl` | LSP references/definitions panel |
| `<Leader>xq` | Quickfix list (trouble) |
| `<Leader>xs` | Symbols panel |

## Debugging (DAP)

| Key | Description |
|---|---|
| `<Leader>dc` | Continue |
| `<Leader>do` | Step over |
| `<Leader>di` | Step into |
| `<Leader>du` | Step out |
| `<Leader>db` | Toggle breakpoint |
| `<Leader>dB` | Conditional breakpoint |
| `<Leader>dr` | Open REPL |
| `<Leader>dl` | Run last |
| `<Leader>dq` | Terminate session |
| `<Leader>dU` | Toggle DAP UI |

## Testing (neotest)

| Key | Description |
|---|---|
| `<Leader>nt` | Run nearest test |
| `<Leader>nf` | Run file tests |
| `<Leader>na` | Run all tests |
| `<Leader>nd` | Debug nearest test |
| `<Leader>ns` | Toggle test summary |
| `<Leader>no` | Toggle output panel |
| `<Leader>nq` | Stop tests |

## Git

| Key | Description |
|---|---|
| `<Leader>gg` | Git status (fugitive) |
| `<Leader>gc` | Git commit |
| `<Leader>gP` | Git push |
| `<Leader>gl` | Git log |
| `<Leader>gf` | Git fetch |
| `<Leader>gv` | Open diffview |
| `<Leader>gh` | File history |
| `<Leader>gH` | Repo history |
| `<Leader>gx` | Close diffview |
| `<Leader>gs` | Stage hunk |
| `<Leader>gr` | Reset hunk |
| `<Leader>gS` | Stage buffer |
| `<Leader>gR` | Reset buffer |
| `<Leader>gu` | Undo stage hunk |
| `<Leader>gp` | Preview hunk |
| `<Leader>gbl` | Blame line (full) |
| `<Leader>gB` | Toggle line blame |
| `<Leader>gd` | Diff this |
| `<Leader>gD` | Diff against ~ |
| `]h` / `[h` | Next / prev hunk |

## Java

| Key | Description |
|---|---|
| `<Leader>ji` | Organize imports |
| `<Leader>jt` | Run nearest test |
| `<Leader>jT` | Run test class |
| `<Leader>jev` | Extract variable |
| `<Leader>jem` | Extract method |
| `<Leader>jec` | Extract constant |
| `<Leader>jR` | Restart jdtls |

## Refactoring

| Key | Description |
|---|---|
| `<Leader>re` | Extract function (n/x) |
| `<Leader>rv` | Extract variable (n/x) |
| `<Leader>ri` | Inline variable (n/x) |
| `<Leader>rI` | Inline function (n/x) |
| `<Leader>rs` | Select refactor (n/x) |
| `<Leader>rp` | Debug print below (n/x) |
| `<Leader>rP` | Debug print above (n/x) |
| `<Leader>rc` | Clean up debug prints (n/x) |

## Buffers & Windows

| Key | Description |
|---|---|
| `<S-h>` / `<S-l>` | Prev / next buffer |
| `<Leader>bn` / `<Leader>bp` | Next / prev buffer |
| `<Leader>bd` | Delete buffer (preserves layout) |
| `<C-h/j/k/l>` | Navigate windows |
| `<C-Up/Down>` | Resize split height |
| `<C-Left/Right>` | Resize split width |
| `<Leader>sv` | Vertical split |
| `<Leader>sh` | Horizontal split |
| `[q` / `]q` | Prev / next quickfix item |
| `<Leader>q` | Diagnostics → loclist |
| `<Leader>pa` | Copy file path |
| `<Leader>es` | Sort visual selection |
| `<Leader>td` | Toggle diagnostics |
| `<Leader>ta` | Toggle autosuggestions |
| `<Leader>N` | Notification history |

## Editing

| Key | Description |
|---|---|
| `kj` | Exit insert mode |
| `j` / `k` | Move by visual line |
| `<Esc>` | Clear search highlight |
| `p` | Paste (no yank, visual) |
| `<Leader>D` | Delete to void (n/v) |
| `J` | Join lines (cursor fixed) |
| `<` / `>` | Indent left / right (hold visual) |

## Markdown

| Key | Description |
|---|---|
| `<Leader>mp` | Toggle browser preview |
| `<Leader>mo` | Open browser preview |
| `<Leader>mx` | Stop browser preview |

## Terminal & Session

| Key | Description |
|---|---|
| `<C-\>` | Toggle floating terminal |
| `<Esc><Esc>` | Exit terminal mode |
| `<C-h/j/k/l>` | Window nav from terminal |
| `<Leader>Sf` | Search sessions |
| `<Leader>Ss` | Save session |
| `<Leader>Sd` | Delete session |
| `]t` / `[t` | Next / prev TODO |

## Package Management

| Key / Command | Description |
|---|---|
| `<Leader>pu` / `:PackUpdate` | Update all plugins |
| `<Leader>pl` / `:PackList` | List installed plugins |
| `<Leader>pc` / `:PackClean` | Remove unused plugins |
