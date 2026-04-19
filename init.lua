-------------------------------------------------------------------------------
-- Plugins
-------------------------------------------------------------------------------

vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",

    "https://github.com/stevearc/oil.nvim",
    "https://github.com/nvim-mini/mini.pick",
    "https://github.com/nvim-mini/mini.extra",
    "https://github.com/wakatime/vim-wakatime",

    "https://github.com/rose-pine/neovim",
    "https://github.com/sainnhe/everforest",
    "https://github.com/sainnhe/gruvbox-material",
    "https://github.com/hugoocoto/hforest",

    "https://github.com/chomosuke/typst-preview.nvim",
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
vim.o.autocomplete = false
vim.o.completeopt = 'menu,noselect,menuone,popup'
vim.o.complete = '.,b,k'
vim.o.autocomplete = false
vim.o.pummaxwidth =0

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

-------------------------------------------------------------------------------
-- Remaps and other stuff
-------------------------------------------------------------------------------
vim.keymap.set("n", "<leader><leader>", vim.lsp.buf.format)
vim.keymap.set("v", "<leader>p", [["_dP]])
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("c", "wq", "x")
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

-- bold and italic for typst
vim.keymap.set('x', '<C-b>', [[c**<esc>P]])
vim.keymap.set('x', '<C-_>', [[c__<esc>P]])

local nmap_leader = function(suffix, rhs, desc)
    vim.keymap.set('n', '<Leader>' .. suffix, rhs, { desc = desc })
end

nmap_leader('f/', '<Cmd>Pick history scope="/"<CR>', '"/" history')
nmap_leader('f:', '<Cmd>Pick history scope=":"<CR>', '":" history')
nmap_leader('fC', '<Cmd>Pick git_commits path="%"<CR>', 'Commits (buf)')
nmap_leader('fD', '<Cmd>Pick diagnostic scope="current"<CR>', 'Diagnostic buffer')
nmap_leader('fG', '<Cmd>Pick grep pattern="<cword>"<CR>', 'Grep current word')
nmap_leader('fa', '<Cmd>Pick git_hunks scope="staged"<CR>', 'Added hunks (all)')
nmap_leader('fb', '<Cmd>Pick buffers<CR>', 'Buffers')
nmap_leader('fc', '<Cmd>Pick git_commits<CR>', 'Commits (all)')
nmap_leader('fd', '<Cmd>Pick diagnostic scope="all"<CR>', 'Diagnostic workspace')
nmap_leader('ff', '<Cmd>Pick files<CR>', 'Files')
nmap_leader('fg', '<Cmd>Pick grep_live<CR>', 'Grep live')
nmap_leader('fh', '<Cmd>Pick help<CR>', 'Help tags')
nmap_leader('fr', '<Cmd>Pick resume<CR>', 'Resume')
