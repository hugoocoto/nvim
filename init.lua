------------------------------------------------------------------------------
-- Lazy installation
-------------------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
        local lazyrepo = "https://github.com/folke/lazy.nvim.git"
        local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
        if vim.v.shell_error ~= 0 then
                vim.api.nvim_echo({
                        { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
                        { out,                            "WarningMsg" },
                        { "\nPress any key to exit..." },
                }, true, {})
                vim.fn.getchar()
                os.exit(1)
        end
end
vim.opt.rtp:prepend(lazypath)

-------------------------------------------------------------------------------
-- Plugins
-------------------------------------------------------------------------------
require("lazy").setup({
        spec = {
                { "stevearc/oil.nvim" },
                { "folke/lazy.nvim" },
                { "wakatime/vim-wakatime" },
                { "neovim/nvim-lspconfig" },
                { "williamboman/mason.nvim" },
                {
                        'chomosuke/typst-preview.nvim',
                        ft = 'typst',
                        version = '1.*',
                },
                {
                        "nvim-treesitter/nvim-treesitter",
                        lazy = false,
                        branch = 'master',
                        build = ":TSUpdate"
                },
                {
                        'saghen/blink.cmp',
                        version = '1.*',
                        dependencies = { 'rafamadriz/friendly-snippets' },
                        opts = { keymap = { preset = 'enter' }, },
                        opts_extend = { "sources.default" }
                },
                { "echasnovski/mini.pick", version = "*" },
                { "hugoocoto/shoebill",    lazy = false },
                {
                        'nvim-telescope/telescope.nvim',
                        branch = '0.1.x',
                        dependencies = { 'nvim-lua/plenary.nvim' }
                },
                { "nvzone/showkeys", cmd = "ShowkeysToggle" },
        },
        checker = { enabled = false },
})

-------------------------------------------------------------------------------
-- Options
-------------------------------------------------------------------------------
-- This is as based as it's written in vimscript
vim.cmd [[
let g:did_install_default_menus=1
let g:loaded_netrwPlugin=0
set guicursor=""
set tabstop=8
set shiftwidth=8
set softtabstop=-1
set expandtab
set smartindent
set relativenumber
set nu
set nowrap
set nohlsearch
set incsearch
set scrolloff=8
set sidescrolloff=8
set updatetime=1000
set conceallevel=0
set noswapfile
set nobackup
set undofile
set wildignorecase
set ignorecase
set smartcase
set noshowmode
set noruler
set noshowcmd
]]

vim.g.mapleader = " "
vim.opt.clipboard = 'unnamedplus'
vim.opt.virtualedit = "block"
vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes"
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-------------------------------------------------------------------------------
-- Misc stuff
-------------------------------------------------------------------------------
-- Do not open pdf with nvim
vim.api.nvim_create_autocmd("BufReadPre", {
        pattern = "*.pdf",
        callback = function(args)
                vim.fn.jobstart({ "xdg-open", args.file }, { detach = true })
                vim.cmd("quit")
        end,
})

vim.cmd("colorscheme shoebill-forest")

-------------------------------------------------------------------------------
-- Remaps and other stuff
-------------------------------------------------------------------------------
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<leader><leader>", vim.lsp.buf.format)
vim.keymap.set("n", "gd", vim.lsp.buf.definition) -- it is not default?

vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fg', builtin.live_grep)
vim.keymap.set('n', '<leader>fb', builtin.buffers)
vim.keymap.set('n', '<leader>e', ":Oil<cr>")

-- I stole this from someone and I like it
vim.keymap.set('n', '<bs>', function()
        vim.diagnostic.config({ virtual_lines = not vim.diagnostic.config().virtual_lines })
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end)
vim.keymap.set('n', '<cr>', vim.cmd.write)


-------------------------------------------------------------------------------
-- LSP
-------------------------------------------------------------------------------
vim.lsp.enable('clangd')   -- C
vim.lsp.enable('pylsp')    -- python
vim.lsp.enable('tinymist') -- typst
vim.lsp.enable('lua_ls')   -- lua
vim.lsp.enable('bashls')   -- bash, shell

vim.lsp.config('tinymist', { settings = { formatterMode = 'typstyle' } })
vim.lsp.config('lua_ls', { -- remove undeclared vim
        settings = {
                Lua = {
                        workspace = {
                                library = vim.api.nvim_get_runtime_file("", true), }
                }
        }
})

-------------------------------------------------------------------------------
-- Diagnostics
-------------------------------------------------------------------------------
vim.diagnostic.config({
        virtual_text = false, -- show with C-w d
        signs = true,
        underline = false,
        update_in_insert = false,
        severity_sort = true,
})

-------------------------------------------------------------------------------
-- Plugin setup
-------------------------------------------------------------------------------
require 'mason'.setup()
require 'oil'.setup()
require 'nvim-treesitter.configs'.setup {
        ensure_installed = {},
        sync_install = false,
        auto_install = true,
        ignore_install = {},
        modules = {},
        highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
        },
}
