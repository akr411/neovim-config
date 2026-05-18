# Language Support

## Go

- **LSP**: gopls with inlay hints, staticcheck, gofumpt, shadow/unusedwrite analysis
- **Format**: goimports → gofumpt on save
- **Debug**: nvim-dap-go (delve) — breakpoints, step, REPL, remote attach
- **Test**: neotest + neotest-golang — run nearest/file/suite, debug tests via DAP
- **Snippets**: `iferr`, `ctx`, `ttest`, `goroutine`, `handler`, `slog`, and more

## Java

- **LSP**: nvim-jdtls — organize imports, extract method/variable/constant, test runner
- **Format**: google-java-format on save
- **Debug**: jdtls built-in DAP adapter
- **Snippets**: records, sealed interfaces, streams, JUnit 5, Mockito, Spring annotations

## Bash

- **LSP**: bash-language-server (shellcheck-backed diagnostics)
- **Format**: shfmt on save
- **Snippets**: shebang+set -euo, getopts, trap, retry, die, and more

## Snippets

Custom snippets in `snippets/` are loaded automatically by blink.cmp.

| File | Notable triggers |
|---|---|
| `go.json` | `iferr`, `iferrw`, `ttest`, `ctx`, `ctxt`, `goroutine`, `handler`, `logi`, `mutex`, `wg` |
| `java.json` | `rec`, `sealed`, `stream`, `test`, `testcls`, `ptest`, `mock`, `when`, `ctrl`, `svc` |
| `sh.json` | `shebang`, `fn`, `args`, `tmpdir`, `die`, `retry`, `readlines`, `chkcmd` |
| `markdown.json` | `cb`, `merm`, `cnote`, `cwarn`, `api`, `chlog`, `adr`, `toc`, `tasks` |
