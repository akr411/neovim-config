# Language Support

## Go

- **LSP**: gopls with inlay hints, staticcheck, gofumpt, shadow/unusedwrite analysis
- **Format**: goimports → gofumpt on save
- **Debug**: nvim-dap-go (delve) - breakpoints, step, REPL, remote attach
- **Test**: neotest + neotest-golang - run nearest/file/suite, debug tests via DAP
- **Snippets**: `iferr`, `ctx`, `ttest`, `goroutine`, `handler`, `slog`, and more

## Java

- **LSP**: nvim-jdtls - organize imports, extract method/variable/constant, test runner
- **Format**: google-java-format on save
- **Debug**: jdtls built-in DAP adapter
- **Snippets**: records, sealed interfaces, streams, JUnit 5, Mockito, Spring annotations

## JavaScript / TypeScript

- **LSP**: ts_ls - completions, inlay hints, single-file support
- **Lint**: eslint - diagnostics on type, auto-fix on save (`EslintFixAll`)
- **Format**: prettierd on save
- **Snippets**: arrow fns, async, imports/exports, destructuring, array methods, try/catch, promise

## React (JSX / TSX)

- **LSP**: ts_ls - full JSX/TSX support, hooks completions
- **Lint**: eslint - JSX/TSX diagnostics, auto-fix on save
- **Format**: prettierd on save
- **Snippets**: `rfc`, `rfcp`, hooks, context, memo, forwardRef, event handlers

## Bash

- **LSP**: bash-language-server (shellcheck-backed diagnostics)
- **Format**: shfmt on save
- **Snippets**: shebang+set -euo, getopts, trap, retry, die, and more

## Rust

- **LSP**: rust-analyzer - clippy check on save, all cargo features enabled, full inlay hints (parameter names, chaining, type hints, lifetime hints)
- **Format**: rustfmt on save
- **Debug**: codelldb (via mason) - launch binary, launch with args; uses nvim-dap UI (same keymaps: `<Leader>dc/do/di/du/db`)
- **Test**: neotest + neotest-rust - `<Leader>nt` nearest, `<Leader>nf` file, `<Leader>na` suite, `<Leader>nd` debug via DAP

## Snippets

Custom snippets in `snippets/` are loaded automatically by blink.cmp.

| File              | Notable triggers                                                                                                                                                                                |
| ----------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `go.json`         | `iferr`, `iferrw`, `ttest`, `ctx`, `ctxt`, `goroutine`, `handler`, `logi`, `mutex`, `wg`                                                                                                        |
| `java.json`       | `rec`, `sealed`, `stream`, `test`, `testcls`, `ptest`, `mock`, `when`, `ctrl`, `svc`                                                                                                            |
| `javascript.json` | `afn`, `afni`, `aafn`, `fn`, `cl`, `ce`, `dest`, `desta`, `tern`, `opt`, `nc`, `prom`, `tryc`, `fe`, `map`, `filt`, `red`, `imp`, `impn`, `expd`, `expn`                                        |
| `typescript.json` | `iface`, `type`, `typeg`, `enum`, `cenum`, `afn`, `aafn`, `gfn`, `cls`, `acls`, `impl`, `ro`, `nn`, `as`, `sat`, `rec`, `part`, `req`, `pick`, `omit`, `kof`, `tof`, `tguard`, `mtype`, `ctype` |
| `react.json`      | `rfc`, `rfcp`, `rnc`, `ust`, `uef`, `uefc`, `ucb`, `umo`, `urf`, `uctx`, `ured`, `hook`, `ctx`, `frag`, `cond`, `tern`, `lmap`, `props`, `evh`, `onch`, `fref`, `memo`                          |
| `sh.json`         | `shebang`, `fn`, `args`, `tmpdir`, `die`, `retry`, `readlines`, `chkcmd`                                                                                                                        |
| `rust.json`       | `fn`, `afn`, `struct`, `enum`, `impl`, `implt`, `match`, `mres`, `mopt`, `iflet`, `uoe`, `test`, `testmod`, `atest`, `derive`, `vec`, `pl`, `dbg`, `todo`, `use`, `puse`, `cl`, `map`, `filt`   |
| `markdown.json`   | `cb`, `merm`, `cnote`, `cwarn`, `api`, `chlog`, `adr`, `toc`, `tasks`                                                                                                                           |
