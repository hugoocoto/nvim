require 'lspconfig'.clangd.setup {
        cmd = { 'clangd', '--background-index', '--fallback-style=none', '--clang-tidy', '--log=error' },
}

-- vim.lsp.enable('clangd')
vim.lsp.enable('luals')
vim.lsp.enable('pyright')

vim.diagnostic.config({
        virtual_text = true, -- esta línea es la que muestra el texto en la línea del error
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
})
