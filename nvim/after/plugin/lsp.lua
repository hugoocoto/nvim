require 'lspconfig'.clangd.setup {}
local lspconfig = require('lspconfig')
lspconfig.clangd.setup({
        cmd = { 'clangd', '--background-index', '--clang-tidy', '--log=verbose' },
})

vim.lsp.enable('luals')
vim.lsp.enable('pyright')
