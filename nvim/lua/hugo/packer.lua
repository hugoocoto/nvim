local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
                "git", "clone", "--filter=blob:none",
                "https://github.com/folke/lazy.nvim.git",
                lazypath
        })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

        { "folke/lazy.nvim" },

        -- Telescope
        {
                "nvim-telescope/telescope.nvim",
                dependencies = { "nvim-lua/plenary.nvim" }
        },

        -- Trouble
        {
                "folke/trouble.nvim",
                config = function()
                        require("trouble").setup {
                                icons = false
                        }
                end
        },

        -- Scope
        {
                "tiagovla/scope.nvim",
                config = function()
                        require("scope").setup({})
                end
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

        -- Harpoon
        { "theprimeagen/harpoon" },

        -- Refactoring
        { "theprimeagen/refactoring.nvim" },

        -- Undotree
        { "mbbill/undotree" },

        -- Wakatime
        { "wakatime/vim-wakatime" },

        -- Markdown preview
        {
                "iamcco/markdown-preview.nvim",
                build = function() vim.fn["mkdp#util#install"]() end,
                ft = { "markdown" }
        },

        -- LSP config
        { "neovim/nvim-lspconfig" },

        -- Cloak
        { "laytan/cloak.nvim" },

        -- Mason
        { "williamboman/mason.nvim" },
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
                        fuzzy = { implementation = "prefer_rust_with_warning" }
                },
                opts_extend = { "sources.default" }
        }
})
