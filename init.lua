-------------------------------------------------------------------------------
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
                { "folke/lazy.nvim" },
                { "wakatime/vim-wakatime" },
                { "neovim/nvim-lspconfig" },
                { "williamboman/mason.nvim" },
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
                },
                {
                        "nvim-telescope/telescope.nvim",
                        dependencies = { "nvim-lua/plenary.nvim" }
                },
                { "hugocotoflorez/shoebill", lazy = false },
        },
        checker = { enabled = false },
})

-------------------------------------------------------------------------------
-- Options
-------------------------------------------------------------------------------
vim.g.mapleader = " "
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.opt.guicursor = ""
local tabsize = 8
vim.opt.tabstop = tabsize
vim.opt.softtabstop = tabsize
vim.opt.shiftwidth = tabsize
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.updatetime = 500
vim.opt.conceallevel = 0
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

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

vim.cmd("colorscheme shoebill")

vim.g.clipboard = {
        name = 'wl-clipboard',
        copy = { ['+'] = 'wl-copy', ['*'] = 'wl-copy', },
        paste = { ['+'] = 'wl-paste', ['*'] = 'wl-paste', },
        cache_enabled = 0,
}

-------------------------------------------------------------------------------
-- Remaps and other stuff
-------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>pv", ":Sex!<cr>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set("n", "<leader><leader>", vim.lsp.buf.format)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("x", "<leader>s", "y:%s/<C-r>0/<C-r>0/gI<Left><Left><Left>")

-------------------------------------------------------------------------------
-- LSP
-------------------------------------------------------------------------------
vim.lsp.enable('clangd')   -- C
vim.lsp.enable('pylsp')    -- python
vim.lsp.enable('lua_ls')   -- lua
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
        underline = true,
        update_in_insert = false,
        severity_sort = true,
})

-------------------------------------------------------------------------------
-- Telescope
-------------------------------------------------------------------------------
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fi', builtin.lsp_implementations, {})
vim.keymap.set('n', '<leader>fd', builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>ft', builtin.lsp_type_definitions, {})
vim.keymap.set('n', '<leader>fs', builtin.git_status, {})
vim.keymap.set('n', '<leader>m', function() builtin.man_pages({ sections = { '1', '2', '3' } }) end)

-------------------------------------------------------------------------------
-- Plugin setup
-------------------------------------------------------------------------------
require("mason").setup()

require('nvim-treesitter.configs').setup {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "python", "markdown" },
        ignore_install = {},
        sync_install = false,
        auto_install = true,
        modules = {},
        highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
        },
}

require "blink.cmp".setup({
        opts = {
                keymap = { preset = 'enter' },
        },
        opts_extend = { "sources.default" }
})
