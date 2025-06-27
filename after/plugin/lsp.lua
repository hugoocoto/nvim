require 'lspconfig'.clangd.setup {
        cmd = { 'clangd', '--background-index', '--fallback-style=none', '--clang-tidy', '--log=verbose' },
}

-- vim.lsp.enable('clangd')
vim.lsp.enable('luals')
vim.lsp.enable('pyright')
