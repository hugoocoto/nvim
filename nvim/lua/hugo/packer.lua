-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required itf you have packer configured as `opt`
-- vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        use {
                'nvim-telescope/telescope.nvim', -- tag = '0.1.0',
                requires = { { 'nvim-lua/plenary.nvim' } }
        }
        use({
                "folke/trouble.nvim",
                config = function()
                        require("trouble").setup {
                                icons = false,
                                -- your configuration comes here
                                -- or leave it empty to use the default settings
                                -- refer to the configuration section below
                        }
                end
        })

        use({
                "tiagovla/scope.nvim",
                config = function()
                        require("scope").setup({})
                end
        })
        use {
                'nvim-treesitter/nvim-treesitter',
                run = function()
                        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
                        ts_update()
                end, }

        use("nvim-treesitter/playground")
        use("tree-sitter/java-tree-sitter")
        use("theprimeagen/harpoon")
        use("theprimeagen/refactoring.nvim")
        use("mbbill/undotree")
        use("tpope/vim-fugitive")
        use("nvim-treesitter/nvim-treesitter-context");
        use("wakatime/vim-wakatime");
        use("mfussenegger/nvim-dap");
        -- install without yarn or npm
        use({
                "iamcco/markdown-preview.nvim",
                run = function() vim.fn["mkdp#util#install"]() end,
        })

        use("laytan/cloak.nvim")
        use({ 'williamboman/mason.nvim' })
end)
