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
vim.opt.foldmethod = 'marker'
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
                --   -- add your plugins here

                { "folke/lazy.nvim" },

                -- Telescope
                {
                        "nvim-telescope/telescope.nvim",
                        dependencies = { "nvim-lua/plenary.nvim" }
                },

                -- Treesitter
                {
                        "nvim-treesitter/nvim-treesitter",
                        build = function()
                                local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
                                ts_update()
                        end
                },

                -- Treesitter extras
                { "nvim-treesitter/playground" },
                { "nvim-treesitter/nvim-treesitter-context" },

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

                -- {
                --         dir = "~/code/shoebill/",
                --         name = "shoebill",
                --         lazy = false,
                --         priority = 1000,
                -- },

                {
                        'saghen/blink.cmp',
                        dependencies = { 'rafamadriz/friendly-snippets' },
                        version = '1.*',
                        opts = {
                                -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
                                -- 'super-tab' for mappings similar to vscode (tab to accept)
                                -- 'enter' for enter to accept
                                -- 'none' for no mappings
                                --
                                -- All presets have the following mappings:
                                -- C-space: Open menu or open docs if already open
                                -- C-n/C-p or Up/Down: Select next/previous item
                                -- C-e: Hide menu
                                -- C-k: Toggle signature help (if signature.enabled = true)
                                --
                                -- See :h blink-cmp-config-keymap for defining your own keymap
                                keymap = { preset = 'enter' },

                                appearance = {
                                        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                                        -- Adjusts spacing to ensure icons are aligned
                                        nerd_font_variant = 'mono'
                                },

                                -- (Default) Only show the documentation popup when manually triggered
                                completion = { documentation = { auto_show = false } },

                                -- Default list of enabled providers defined so that you can extend it
                                -- elsewhere in your config, without redefining it, due to `opts_extend`
                                sources = {
                                        default = { 'lsp', 'path', 'snippets', 'buffer' },
                                },

                                -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
                                -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
                                -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
                                --
                                -- See the fuzzy documentation for more information
                                -- fuzzy = { implementation = "prefer_rust_with_warning" }
                        },
                        opts_extend = { "sources.default" }
                }


        },
        -- -- Configure any other settings here. See the documentation for more details.
        -- -- colorscheme that will be used when installing plugins.
        -- install = { colorscheme = { "habamax" } },
        -- automatically check for plugin updates
        checker = { enabled = true },
})

vim.cmd("colorscheme shoebill")

-- Evaluates an expression using python. It replaces the whole line
-- Example:
-- 1 + 2 * (2 - 3)
-- Would be replaced by
-- -1
vim.keymap.set("v", "<leader>ev", "y:.!python3 -c \"print(<C-r>\")\" <CR>", { silent = true })

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader><leader>", vim.lsp.buf.format)

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

vim.lsp.config('clangd', {
        on_attach = function()
                vim.keymap.set("n", "<leader><leader>", ":w<cr>:! clang-format -i %<cr><cr>",
                        { silent = true, noremap = true })
        end
})

vim.lsp.enable('clangd') -- C
vim.lsp.enable('pylsp')  -- python
vim.lsp.enable('lua_ls') -- lua

vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
})

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fg', function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fD', builtin.lsp_implementations, {})
vim.keymap.set('n', '<leader>fd', builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>ft', builtin.lsp_type_definitions, {})
vim.keymap.set('n', '<leader>fa', builtin.treesitter, {})

require 'nvim-treesitter.configs'.setup {
        -- A list of parser names, or "all"
        ensure_installed = { "vimdoc", "c", "lua", "markdown", "python" },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = true,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,

        highlight = {
                -- `false` will disable the whole extension
                enable = true,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
        },
}
