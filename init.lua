-- Enable line numbers
vim.opt.nu = true

-- Number of spaces used for a tab character
vim.opt.tabstop = 4
-- Number of spaces used for auto-indentation
vim.opt.shiftwidth = 4
-- Convert tabs to spaces
vim.opt.expandtab = true

-- Lazy VIM
require("config.lazy")

-- LSP
vim.lsp.enable("clangd")
vim.lsp.enable("pyright")
vim.lsp.enable("html")
vim.lsp.enable("quick_lint_js")

