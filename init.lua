-------------------------------------------------------------------------------
-- Options
-------------------------------------------------------------------------------

vim.g.did_install_default_menus = 1 -- avoid stupid menu.vim (saves ~100ms)
vim.g.loaded_netrwPlugin = 0        -- Disable netrw. 🚮 (comment from justinmk)
vim.opt.shortmess:append("I")       -- Disable start menu

vim.g.mapleader = " "               -- leader key (Space)
vim.o.guicursor = ""                -- use block cursor
vim.o.tabstop = 4                   -- tab display width
vim.o.shiftwidth = 4                -- indent width
vim.o.softtabstop = -1              -- follow shiftwidth
vim.o.expandtab = true              -- tabs -> spaces
vim.o.smartindent = true            -- auto-indent new lines
vim.o.relativenumber = true         -- relative line numbers
vim.o.number = true                 -- absolute current line number
vim.o.wrap = false                  -- disable line wrapping
vim.o.scrolloff = 4                 -- keep context around cursor
vim.o.hlsearch = false              -- don't persist search highlight
vim.o.incsearch = true              -- incremental search
vim.o.ignorecase = true             -- case-insensitive search
vim.o.smartcase = true              -- smart case when uppercase used
vim.o.updatetime = 1000             -- slower idle update events
vim.o.conceallevel = 0              -- show concealed text plainly
vim.o.lazyredraw = true             -- skip some intermediate redraws

vim.o.colorcolumn = "+0"            -- highlight at textwidth
vim.o.textwidth = 80                -- preferred line width
vim.o.signcolumn = "yes"            -- always show sign column

vim.o.swapfile = false              -- disable swap files
vim.o.backup = false                -- disable backup files
vim.o.undofile = true               -- persistent undo

-- vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir" -- undo file directory
vim.cmd("set path+=/usr/lib/gcc/**/include,**")

vim.o.clipboard = "unnamedplus"    -- use system clipboard
vim.o.ruler = false                -- hide ruler
vim.o.showcmd = false              -- hide partial command display
vim.o.showmode = false             -- hide default mode text
vim.opt.spelllang = { "en", "es" } -- spellcheck languages

-- completion
vim.o.autocomplete = false                        -- manual completion only
vim.o.complete = '.,b,k'                          -- completion sources
vim.o.completeopt = 'menu,noselect,menuone,popup' -- popup completion behavior
vim.o.pummaxwidth = 0                             -- no popup width cap

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
-- Remaps and other stuff
-------------------------------------------------------------------------------
vim.keymap.set("n", "<leader><leader>", vim.lsp.buf.format)
vim.keymap.set("v", "<leader>p", [["_dP]])
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("c", "wq", "x")
vim.keymap.set("x", "<leader>e", "y:echo <C-r>\"<cr>gv")
vim.keymap.set("n", "<leader>c", "1z=")
vim.keymap.set('n', '<bs>', function()
    vim.diagnostic.config({ virtual_lines = not vim.diagnostic.config().virtual_lines })
end)

vim.keymap.set('n', '<leader>e', ":Oil<cr>")
vim.keymap.set('t', '<Esc>', [[<C-\><C-N>]])

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

-- bold and italic for typst
vim.keymap.set('x', '<C-b>', [[c**<esc>P]])
vim.keymap.set('x', '<C-_>', [[c__<esc>P]])

-- pickers
vim.keymap.set('n', '<Leader>f/', '<Cmd>Pick history scope="/"<CR>', { desc = '"/" history' })
vim.keymap.set('n', '<Leader>f:', '<Cmd>Pick history scope=":"<CR>', { desc = '":" history' })
vim.keymap.set('n', '<Leader>fC', '<Cmd>Pick git_commits path="%"<CR>', { desc = 'Commits (buf)' })
vim.keymap.set('n', '<Leader>fD', '<Cmd>Pick diagnostic scope="current"<CR>', { desc = 'Diagnostic buffer' })
vim.keymap.set('n', '<Leader>fG', '<Cmd>Pick grep pattern="<cword>"<CR>', { desc = 'Grep current word' })
vim.keymap.set('n', '<Leader>fa', '<Cmd>Pick git_hunks scope="staged"<CR>', { desc = 'Added hunks (all)' })
vim.keymap.set('n', '<Leader>fb', '<Cmd>Pick buffers<CR>', { desc = 'Buffers' })
vim.keymap.set('n', '<Leader>fc', '<Cmd>Pick git_commits<CR>', { desc = 'Commits (all)' })
vim.keymap.set('n', '<Leader>fd', '<Cmd>Pick diagnostic scope="all"<CR>', { desc = 'Diagnostic workspace' })
vim.keymap.set('n', '<Leader>ff', '<Cmd>Pick files<CR>', { desc = 'Files' })
vim.keymap.set('n', '<Leader>fg', '<Cmd>Pick grep_live<CR>', { desc = 'Grep live' })
vim.keymap.set('n', '<Leader>fh', '<Cmd>Pick help<CR>', { desc = 'Help tags' })
vim.keymap.set('n', '<Leader>fr', '<Cmd>Pick resume<CR>', { desc = 'Resume' })

-------------------------------------------------------------------------------
-- Plugins
-------------------------------------------------------------------------------

vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/chomosuke/typst-preview.nvim",

    "https://github.com/stevearc/oil.nvim",
    "https://github.com/nvim-mini/mini.pick",
    "https://github.com/nvim-mini/mini.extra",
    "https://github.com/wakatime/vim-wakatime",

    "https://github.com/cocopon/iceberg.vim",
    "https://github.com/hugoocoto/hforest",
    "https://github.com/morhetz/gruvbox",
    "https://github.com/nanotech/jellybeans.vim",
    "https://github.com/rebelot/kanagawa.nvim",
    "https://github.com/rose-pine/neovim",
    "https://github.com/sainnhe/everforest",
    "https://github.com/sainnhe/gruvbox-material",
    "https://github.com/vague-theme/vague.nvim",
})

vim.api.nvim_create_user_command("PackUpdate", function()
    vim.pack.update()
end, {})

-------------------------------------------------------------------------------
-- Plugin setup
-------------------------------------------------------------------------------

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, { autotrigger = false })
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
    end,
})

vim.keymap.set('i', '<Tab>', function()
    if vim.fn.pumvisible() == 1 then return '<C-n>' end
    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    local text_before_cursor = string.sub(line, 1, col)
    if string.match(text_before_cursor, "/$") then return '<C-x><C-f>' end
    return '<C-x><C-o>'
end, { expr = true, replace_keycodes = true })

vim.keymap.set('i', '<S-Tab>', function()
    if vim.fn.pumvisible() == 1 then return '<C-p>' end
    return '<S-Tab>'
end, { expr = true, replace_keycodes = true })

vim.keymap.set('i', '<CR>', function()
    if vim.fn.pumvisible() == 1 then return '<C-y>' end
    return '<CR>'
end, { expr = true, replace_keycodes = true })

-- Completion menu trigger on triggerCharacters
vim.api.nvim_create_autocmd("InsertCharPre", {
    callback = function(ev)
        local char = vim.v.char
        local clients = vim.lsp.get_clients({ bufnr = ev.buf })

        for _, client in ipairs(clients) do
            local provider = client.server_capabilities.completionProvider
            if provider and provider.triggerCharacters then
                if vim.tbl_contains(provider.triggerCharacters, char) then
                    vim.schedule(function()
                        vim.api.nvim_feedkeys(
                            vim.api.nvim_replace_termcodes("<C-x><C-o>", true, false, true),
                            "n",
                            false
                        )
                    end)
                    break
                end
            end
        end
    end,
})

require('vim._core.ui2').enable() -- enable ui2 messages

require 'typst-preview'.setup {
    dependencies_bin = { ['tinymst'] = 'tinymst' }
}

require 'mini.extra'.setup()
require 'mini.pick'.setup()
require 'oil'.setup()

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

vim.lsp.config('tinymist', {
    settings = { formatterMode = 'typstyle' }
})

vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true), }
        }
    }
})

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
