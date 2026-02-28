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
vim.lsp.config(
    'clangd',
    {
        filetypes = { 'c', 'cpp','cc', 'h', 'hpp' },
    }
)
vim.lsp.enable("clangd")
vim.lsp.enable("pyright")
vim.lsp.enable("html")
vim.lsp.enable("quick_lint_js")

vim.lsp.config(
    'csharp-ls',
    {
        cmd = { 'csharp-ls' },
        filetypes = { 'cs' },
        root_markers = { '*.sln', '*.csproj' },
    }
)
vim.lsp.enable("csharp-ls")


vim.lsp.config(
    'asm-lsp',
    {
        cmd = { 'asm-lsp' },
        filetypes = { 'asm', 's', 'S' },
    }
)
vim.lsp.enable("asm-lsp")

-- LSP Autocompletion
-- menuone: Use the popup menu also when there is only one match
-- noselect: No menu item is pre-selected
-- popup: Show extra info about the currently selected completion option in a popup window
vim.opt.completeopt = { "menuone", "noselect", "popup" }

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
    if client:supports_method('textDocument/completion') then
      -- Optional: trigger autocompletion on EVERY keypress. May be slow!
      -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
      -- client.server_capabilities.completionProvider.triggerCharacters = chars
      vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
    end
  end,
})

-- Keymaps
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts) -- Go to declaration
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts) -- Go to definition

local ts_builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', ts_builtin.find_files, { desc = "Find files" })

