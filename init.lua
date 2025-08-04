-- Bootstrap lazy.nvim
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

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.opt.winborder = "rounded"
vim.opt.guicursor = ""
vim.opt.mouse = ""
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 8
vim.opt.softtabstop = 8
vim.opt.shiftwidth = 8
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.colorcolumn = "80"
vim.opt.updatetime = 500
vim.opt.termguicolors = true
vim.opt.conceallevel = 0

-- Do not open pdf with nvim as it brokes pdfs
vim.api.nvim_create_autocmd("BufReadPre", {
        pattern = "*.pdf",
        callback = function(args)
                vim.fn.jobstart({ "xdg-open", args.file }, { detach = true })
                vim.cmd("quit")
        end,
})

-- Setup lazy.nvim
require("lazy").setup({
        spec = {
                { "folke/lazy.nvim" },

                -- Telescope
                { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

                -- Wakatime
                { "wakatime/vim-wakatime" },

                { "neovim/nvim-lspconfig" },

                -- Mason
                { "williamboman/mason.nvim" },

                {
                        "hugocotoflorez/shoebill",
                        lazy = false,
                        priority = 1000,
                },

                {
                        'saghen/blink.cmp',
                        dependencies = { 'rafamadriz/friendly-snippets' },
                        version = '1.*',
                        opts = {
                                keymap = { preset = 'enter' },
                                appearance = { nerd_font_variant = 'mono' },
                                completion = { documentation = { auto_show = false } },
                                sources = { default = { 'lsp', 'path', 'snippets', 'buffer' }, },

                        },
                        opts_extend = { "sources.default" }
                }


        },
        checker = { enabled = true },
})

vim.cmd("colorscheme shoebill")

vim.keymap.set("n", "<leader>pv", ":Sex!<cr>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader><leader>", vim.lsp.buf.format)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)

vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("x", "<leader>s", "y:%s/<C-r>0/<C-r>0/gI<Left><Left><Left>")

-- Mason
require("mason").setup()

vim.g.clipboard = {
        name = 'wl-clipboard',
        copy = { ['+'] = 'wl-copy', ['*'] = 'wl-copy', },
        paste = { ['+'] = 'wl-paste', ['*'] = 'wl-paste', },
        cache_enabled = 0,
}


-- vim.lsp.config('clangd', {
--         on_attach = function()
--                 vim.keymap.set("n", "<leader><leader>", ":w<cr>:! clang-format -i %<cr><cr>",
--                         { silent = true, noremap = true })
--         end
-- })

vim.lsp.enable('clangd') -- C
vim.lsp.enable('pylsp')  -- python
vim.lsp.enable('lua_ls') -- lua
vim.lsp.config('lua_ls', {
        settings = {
                Lua = {
                        workspace = {
                                library = vim.api.nvim_get_runtime_file("", true), }
                }
        }
})

vim.diagnostic.config({
        virtual_text = false, -- show with C-w d
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
})

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- lsp find implementation, definition, type def
vim.keymap.set('n', '<leader>fi', builtin.lsp_implementations, {})
vim.keymap.set('n', '<leader>fd', builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>ft', builtin.lsp_type_definitions, {})

vim.keymap.set('n', '<leader>fs', builtin.git_status, {})
vim.keymap.set('n', '<leader>m', builtin.man_pages, {})
