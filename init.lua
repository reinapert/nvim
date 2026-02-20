-- Enable line numbers
vim.opt.nu = true

-- Number of spaces used for a tab character
vim.opt.tabstop = 4
-- Number of spaces used for auto-indentation
vim.opt.shiftwidth = 4
-- Convert tabs to spaces
vim.opt.expandtab = true

-- Use Truecolor
vim.opt.termguicolors = true

-- Set Colorscheme
vim.cmd.colorscheme('habamax')

-- Lazy VIM
require("config.lazy")

-- LSP
vim.lsp.enable("clangd")
vim.lsp.enable("pyright")
vim.lsp.enable("html")
vim.lsp.enable("quick_lint_js")

vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts) -- Go to declaration
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts) -- Go to definition

local ts_builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', ts_builtin.find_files, { desc = "Find files" })
