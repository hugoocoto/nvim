require("hugo.set")
require("hugo.remap")
require("hugo.packer")

local augroup = vim.api.nvim_create_augroup
local ThePrimeagenGroup = augroup('ThePrimeagen', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
        require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
        group = yank_group,
        pattern = '*',
        callback = function()
                vim.highlight.on_yank({
                        higroup = 'IncSearch',
                        timeout = 40,
                })
        end
})

autocmd({ "BufWritePre" }, {
        group = ThePrimeagenGroup,
        pattern = "*",
        command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter", "BufLeave" }, {
        callback = function()
                if vim.bo.buftype == "terminal" then
                        vim.wo.number = false
                        vim.wo.relativenumber = false
                else
                        vim.wo.number = true
                        vim.wo.relativenumber = true
                end
        end,
})

vim.api.nvim_create_autocmd("BufReadPre", {
        pattern = "*.pdf",
        callback = function()
                print("Can not open file with nvim")
                vim.cmd("quit")
        end,
})


vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
