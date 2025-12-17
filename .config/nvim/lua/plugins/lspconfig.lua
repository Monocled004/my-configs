
-- Python
vim.lsp.config("pyright", {
  on_attach = on_attach,
})
vim.lsp.enable("pyright")

-- JavaScript / TypeScript
vim.lsp.config("tsserver", {
  on_attach = on_attach,
})
vim.lsp.enable("tsserver")

-- C / C++
vim.lsp.config("clangd", {
  on_attach = on_attach,
})
vim.lsp.enable("clangd")
