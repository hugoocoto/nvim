-------------------------------------------------------------------------------
-- Plugins
-------------------------------------------------------------------------------
function Pack()
        vim.pack.add({
                "https://github.com/stevearc/oil.nvim",
                "https://github.com/nvim-telescope/telescope.nvim",
                "https://github.com/wakatime/vim-wakatime",
                "https://github.com/neovim/nvim-lspconfig",
                "https://github.com/nvim-treesitter/nvim-treesitter",
                "https://github.com/nvim-lua/plenary.nvim",

                "https://github.com/L3MON4D3/LuaSnip",
                "https://github.com/rose-pine/neovim",
                "https://github.com/sainnhe/everforest",
                "https://github.com/sainnhe/gruvbox-material",
                "https://github.com/ellisonleao/gruvbox.nvim",
                "https://github.com/hugoocoto/hforest",
                {
                        src = "https://github.com/chomosuke/typst-preview.nvim",
                        version = vim.version.range("1.*"),
                },
                {
                        src = "https://github.com/saghen/blink.cmp",
                        version = vim.version.range("1.*"),
                },
        })

        vim.api.nvim_create_user_command("PackUpdate", function()
                vim.pack.update()
        end, {})
end

-------------------------------------------------------------------------------
-- Options
-------------------------------------------------------------------------------
function Options()
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
        vim.o.path = '**'
end

-------------------------------------------------------------------------------
-- Misc stuff
-------------------------------------------------------------------------------
function MISC()
        -- Do not open pdf with nvim
        vim.api.nvim_create_autocmd("BufReadPre", {
                pattern = "*.pdf",
                callback = function(args)
                        vim.cmd("quit")
                end,
        })

        vim.cmd("colorscheme hforest")
        vim.api.nvim_create_autocmd("BufReadPre", {
                pattern = "*.java",
                callback = function()
                        vim.opt.tabstop = 4
                        vim.opt.shiftwidth = 4
                        vim.opt.softtabstop = -1
                end,
        })

        vim.api.nvim_create_autocmd("BufReadPre", {
                pattern = "*.html",
                callback = function()
                        vim.opt.tabstop = 2
                        vim.opt.shiftwidth = 2
                        vim.opt.softtabstop = -1
                end,
        })

        -- Save on focus lost
        vim.api.nvim_create_autocmd({ "FocusLost", "WinLeave" }, {
                pattern = "*",
                callback = function()
                        if vim.fn.expand("%") ~= "" and vim.bo.buftype == "" then
                                vim.cmd("w")
                        end
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
                end,
        })
end

-------------------------------------------------------------------------------
-- LSP
-------------------------------------------------------------------------------
function Lsp()
        vim.lsp.enable({
                'clangd',
                'pylsp',
                'tinymist',
                'lua_ls',
                'bashls',
                'html',
                'cssls',
                'dockerls',
                'hls',
                'jdtls',
        })
        vim.lsp.config('tinymist', { settings = { formatterMode = 'typstyle' } })
        vim.lsp.config('lua_ls', { -- remove undeclared vim
                settings = {
                        Lua = {
                                workspace = {
                                        library = vim.api.nvim_get_runtime_file("", true), }
                        }
                }
        })
end

-------------------------------------------------------------------------------
-- Diagnostics
-------------------------------------------------------------------------------
function Diagnostics()
        vim.diagnostic.config({
                virtual_text = false,
                signs = true,
                underline = false,
                update_in_insert = false,
                severity_sort = true,
        })
end

-------------------------------------------------------------------------------
-- Plugin setup
-------------------------------------------------------------------------------
function PluginSetup()
        require 'oil'.setup()

        require 'nvim-treesitter.configs'.setup {
                modules = { "all" },
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
                sync_install = false,
                auto_install = true,
                ignore_install = {},
                highlight = {
                        enable = true,
                        disable = {},
                        additional_vim_regex_highlighting = false,
                },
        }

        require("luasnip").setup({ enable_autosnippets = true })
        require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })

        require 'blink.cmp'.setup {
                sources = { default = { 'lsp', 'path', 'buffer' } },
                keymap = { preset = 'enter' },
        }

        require 'typst-preview'.setup {
                dependencies_bin = { ['tinymst'] = 'tinymst' }
        }
end

-------------------------------------------------------------------------------
-- Remaps and other stuff
-------------------------------------------------------------------------------
function Mappings()
        vim.keymap.set("n", "<leader><leader>", vim.lsp.buf.format)
        vim.keymap.set("n", "gd", [[:echo "Use ^["<cr>]])
        vim.keymap.set("v", "<leader>p", [["_dP]])
        vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
        vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
        vim.keymap.set("c", "wq", "x") -- just write if there are changes

        vim.keymap.set("n", "<leader>c", "1z=")

        vim.keymap.set('n', '<bs>', function()
                vim.diagnostic.config({ virtual_lines = not vim.diagnostic.config().virtual_lines })
        end)

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leade>ff', builtin.find_files)
        vim.keymap.set('n', '<leader>fg', builtin.live_grep)
        vim.keymap.set('n', '<leader>fb', builtin.buffers)
        vim.keymap.set('n', '<leader>fh', builtin.help_tags)
        vim.keymap.set('n', '<leader>fr', builtin.lsp_references)
        vim.keymap.set('n', '<leader>e', ":Oil<cr>")

        local okk, ls = pcall(require, "luasnip")
        if (okk) then
                vim.keymap.set("i", "<C-L>", function() ls.expand_or_jump(1) end, { silent = true })
                vim.keymap.set({ "i", "s" }, "<C-p>", function() ls.jump(-1) end, { silent = true })
                vim.keymap.set({ "i", "s" }, "<C-n>", function() ls.jump(1) end, { silent = true })
        end
end

if vim.g.vscode then
        Options()
        Mappings()
else
        Pack()
        Lsp()
        Options()
        Diagnostics()
        PluginSetup()
        Mappings()
        MISC()
end
