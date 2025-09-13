-------------------------------------------------------------------------------
-- Plugins
-------------------------------------------------------------------------------
vim.pack.add({
        "https://github.com/stevearc/oil.nvim",
        "https://github.com/folke/lazy.nvim",
        "https://github.com/wakatime/vim-wakatime",
        "https://github.com/neovim/nvim-lspconfig",
        "https://github.com/williamboman/mason.nvim",
        "https://github.com/hugoocoto/hforest",
        "https://github.com/nvzone/showkeys",
        "https://github.com/nvim-treesitter/nvim-treesitter",
        "https://github.com/nvim-lua/plenary.nvim",
        "https://github.com/L3MON4D3/LuaSnip",
        "https://github.com/rose-pine/neovim",
        {
                src = "https://github.com/chomosuke/typst-preview.nvim",
                version = vim.version.range("1.*"),
        },
        {
                src = "https://github.com/nvim-telescope/telescope.nvim",
                version = vim.version.range("0.1.*"),
        },
        {
                src = "https://github.com/saghen/blink.cmp",
                version = vim.version.range("1.*"),
        },
})

vim.api.nvim_create_user_command("PackUpdate", function()
        vim.pack.update()
end, {})

-------------------------------------------------------------------------------
-- Options
-------------------------------------------------------------------------------
vim.g.did_install_default_menus = 1
vim.g.loaded_netrwPlugin = 0
vim.g.mapleader = " "
vim.o.tabstop = 8
vim.o.shiftwidth = 8
vim.o.softtabstop = -1
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.relativenumber = true
vim.o.number = true
vim.o.wrap = false
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.updatetime = 1000
vim.o.conceallevel = 0
vim.o.colorcolumn = "+0"
vim.o.textwidth = 80
vim.o.signcolumn = "yes"
vim.o.guicursor = ""
vim.o.virtualedit = "block"
vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.wildignorecase = true
vim.o.showmode = false
vim.o.ruler = false
vim.o.showcmd = false
vim.o.clipboard = "unnamedplus"
vim.o.termguicolors = true

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

-- Enable stuff for writing buffers
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = { "*.txt", "*.md", "*.typ" },
        callback = function()
                vim.opt_local.formatoptions = "tln"
                vim.opt_local.spell = true
                vim.opt_local.wrap = true
                vim.opt_local.linebreak = true
                vim.opt_local.spelllang = { "en", "es" }
                vim.keymap.set("n", "<leader>c", "1z=", { buffer = true })
        end,
})

vim.cmd("colorscheme hforest")

-------------------------------------------------------------------------------
-- LSP
-------------------------------------------------------------------------------
vim.lsp.enable({ 'clangd', 'pylsp', 'tinymist', 'lua_ls', 'bashls' })
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
                virtual_text = false,
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
                highlight = { enable = true, },
                auto_install = true, }
                require "showkeys".setup({ position = "top-right" })

                require("luasnip").setup({ enable_autosnippets = true })
                require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })

                require 'blink.cmp'.setup {
                        sources = { default = { 'lsp', 'path', 'buffer' } },
                        keymap = { preset = 'enter' },
                }

                require 'typst-preview'.setup {
                        dependencies_bin = { ['tinymst'] = 'tinymst' }
                }

                -------------------------------------------------------------------------------
                -- Remaps and other stuff
                -------------------------------------------------------------------------------
                vim.keymap.set("n", "<leader><leader>", vim.lsp.buf.format)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition)
                vim.keymap.set("x", "<leader>p", [["_dP]])
                vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
                vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")

                local builtin = require('telescope.builtin')
                vim.keymap.set('n', '<leader>ff', builtin.find_files)
                vim.keymap.set('n', '<leader>fg', builtin.live_grep)
                vim.keymap.set('n', '<leader>fb', builtin.buffers)
                vim.keymap.set('n', '<leader>e', ":Oil<cr>")

                vim.keymap.set('n', '<bs>', function()
                        vim.diagnostic.config({ virtual_lines = not vim.diagnostic.config().virtual_lines })
                end)

                local ls = require("luasnip")
                vim.keymap.set("i", "<C-L>", function() ls.expand_or_jump(1) end, { silent = true })
                vim.keymap.set({ "i", "s" }, "<C-p>", function() ls.jump(-1) end, { silent = true })
                vim.keymap.set({ "i", "s" }, "<C-n>", function() ls.jump(1) end, { silent = true })
