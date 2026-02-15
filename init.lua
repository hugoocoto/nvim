-------------------------------------------------------------------------------
-- Plugins
-------------------------------------------------------------------------------

vim.pack.add({
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/wakatime/vim-wakatime",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-mini/mini.pick",
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
    "https://github.com/sar/friendly-snippets.nvim",
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
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = -1
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.relativenumber = true
vim.o.number = true
vim.o.wrap = false
vim.o.scrolloff = 4
-- vim.o.sidescrolloff = 4
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
vim.opt.spelllang = { "en", "es" }
vim.o.path = '**'

-------------------------------------------------------------------------------
-- Misc stuff
-------------------------------------------------------------------------------
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_disable_italic_comment = 1
vim.cmd("colorscheme gruvbox-material")

-- Do not open pdf with nvim
vim.api.nvim_create_autocmd("BufReadCmd", {
    pattern = "*.pdf",
    callback = function(ev)
        vim.fn.jobstart({ "zathura", ev.file }, { detach = true })
        vim.cmd("quit")
    end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.c", "*.h" },
    callback = function()
        vim.opt_local.tabstop = 8
        vim.opt_local.shiftwidth = 8
        vim.opt_local.softtabstop = -1
        vim.bo.filetype = "c"
    end,
})

vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
    pattern = { "*.html", "*.css" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = -1
    end,
})

-------------------------------------------------------------------------------
-- LSP
-------------------------------------------------------------------------------
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
    'rust_analyzer',
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
require("oil").setup({
    keymaps = {
        ["<CR>"] = {
            callback = function()
                local oil = require("oil")
                local entry = oil.get_cursor_entry()
                if entry and entry.name:match("%.pdf$") then
                    local dir = oil.get_current_dir()
                    local filepath = dir .. entry.name
                    vim.fn.jobstart({ "zathura", filepath }, { detach = true })
                else
                    oil.select()
                end
            end,
        },
    },
})

require 'nvim-treesitter.configs'.setup {
    modules = { "all" },
    ensure_installed = { "c", "lua", "markdown" },
    sync_install = false,
    auto_install = true,
    ignore_install = {},
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false,
    },
}

local _, ls = pcall(require, "luasnip")
ls.setup({ enable_autosnippets = true })
require "luasnip.loaders.from_lua".load({ paths = "~/.config/nvim/snippets/" })
vim.keymap.set("i", "<C-L>", function() ls.expand_or_jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-p>", function() ls.jump(-1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-n>", function() ls.jump(1) end, { silent = true })

require 'blink.cmp'.setup {
    sources = { default = { 'lsp', 'path', 'buffer' } },
    keymap = { preset = 'enter', ['	'] = { 'show' } },
    completion = {
        trigger = { show_on_trigger_character = true },
        menu = { auto_show = false, },
    }
}

require 'typst-preview'.setup {
    dependencies_bin = { ['tinymst'] = 'tinymst' }
}

require 'mini.pick'.setup()

-------------------------------------------------------------------------------
-- Remaps and other stuff
-------------------------------------------------------------------------------
vim.keymap.set("n", "<leader><leader>", vim.lsp.buf.format)
vim.keymap.set("v", "<leader>p", [["_dP]])
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("c", "wq", "x") -- write if there are changes
vim.keymap.set("v", "<leader>e", "y:echo <C-r>\"<cr>gv")
vim.keymap.set("n", "<leader>c", "1z=")
vim.keymap.set('n', '<bs>', function()
    vim.diagnostic.config({ virtual_lines = not vim.diagnostic.config().virtual_lines })
end)
vim.keymap.set('n', '<leader>e', ":Oil<cr>")

-- Write a typst image func for the last screen capture
vim.keymap.set('n', '<leader>ls', function()
    -- configuration:
    local source_dir = os.getenv("HOME") .. "/ScreenCaptures"
    local dest_dir = "images"

    local handle = io.popen("ls -t " .. source_dir .. " | head -n 1")
    if (handle) then
        local filename = handle:read("*a")
        handle:close()
        filename = string.gsub(filename, "%s+", "")
        os.execute("mkdir -p " .. dest_dir)
        os.execute(string.format("cp '%s/%s' '%s/'", source_dir, filename, dest_dir))
        vim.api.nvim_put({ "#image(\"images/" .. filename .. "\")" }, 'c', false, true)
    end
end)

local nmap_leader = function(suffix, rhs, desc)
    vim.keymap.set('n', '<Leader>' .. suffix, rhs, { desc = desc })
end
nmap_leader('f/', '<Cmd>Pick history scope="/"<CR>', '"/" history')
nmap_leader('f:', '<Cmd>Pick history scope=":"<CR>', '":" history')
nmap_leader('fa', '<Cmd>Pick git_hunks scope="staged"<CR>', 'Added hunks (all)')
nmap_leader('fb', '<Cmd>Pick buffers<CR>', 'Buffers')
nmap_leader('fc', '<Cmd>Pick git_commits<CR>', 'Commits (all)')
nmap_leader('fC', '<Cmd>Pick git_commits path="%"<CR>', 'Commits (buf)')
nmap_leader('fd', '<Cmd>Pick diagnostic scope="all"<CR>', 'Diagnostic workspace')
nmap_leader('fD', '<Cmd>Pick diagnostic scope="current"<CR>', 'Diagnostic buffer')
nmap_leader('ff', '<Cmd>Pick files<CR>', 'Files')
nmap_leader('fg', '<Cmd>Pick grep_live<CR>', 'Grep live')
nmap_leader('fG', '<Cmd>Pick grep pattern="<cword>"<CR>', 'Grep current word')
nmap_leader('fh', '<Cmd>Pick help<CR>', 'Help tags')
nmap_leader('fr', '<Cmd>Pick resume<CR>', 'Resume')
