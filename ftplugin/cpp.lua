-- 设置 clangd 为 C++ 的 Linter
vim.g.ale_linters = {
  cpp = { 'clangd' },
  c = { 'clangd' }
}

