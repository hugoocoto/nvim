vim.g.mapleader = " "

vim.keymap.set("i", "<CR>", function()
  if vim.fn.pumvisible() == 1 then
    return vim.api.nvim_replace_termcodes("<C-y>", true, true, true)
  else
    return vim.api.nvim_replace_termcodes("<CR>", true, true, true)
  end
end, { expr = true, noremap = true })


vim.keymap.set("n", "<leader>w", ":wall<CR>")
vim.keymap.set("n", "<leader>q", ":wall<CR>:qall<CR>")

vim.keymap.set("n", "<leader>c", "_i//<Esc>_")
vim.keymap.set("v", "<leader>c", "c/*\n/<Esc>kp")

vim.keymap.set("n", "<leader>mm", [[:MarkdownPreviewToggle<cr>]])

vim.keymap.set("n", "<leader>do", ":lua vim.cmd.colorscheme('odhugotty')<cr>")
vim.keymap.set("n", "<leader>od", ":lua vim.cmd.colorscheme('odhugo')<cr>")

vim.keymap.set("n", "<TAB>", ":cnext<cr>")
vim.keymap.set("n", "<S-TAB>", ":cprev<cr>")
vim.keymap.set("n", "<leader>t", ":tabnew | terminal zsh<CR>a", { noremap = true, silent = true })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")

-- open markdown list-title format
vim.keymap.set("n", "<leader>-", "<Esc>^i- ****:<Esc>2hi")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set("n", "<C-a>", [[ggVG"+y<cr><C-o><C-o>]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader><leader>", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set('x', '<leader>r', ':<C-u>lua InputReplace()<CR>', { noremap = true, silent = true })
vim.keymap.set("v", "<leader>x", ":'<,'>Refactor extract ")

vim.keymap.set("v", "<leader>\"", [[c""<Esc>hp]])
vim.keymap.set("v", "<leader>'", [[c''<Esc>hp]])
vim.keymap.set("v", "<leader>(", [[c()<Esc>hp]])
vim.keymap.set("v", "<leader>[", [[c[]<Esc>hp]])
vim.keymap.set("v", "<leader>{", [[c{}<Esc>hp]])


Is_wrapping_on = false
function Toggle_wrapping()
        if (Is_wrapping_on) then
                vim.opt.wrap = false
                vim.opt.linebreak = false
                Is_wrapping_on = false
        else
                vim.opt.wrap = true
                vim.opt.linebreak = true
                Is_wrapping_on = true
        end
end

vim.keymap.set('n', '<leader>ll', Toggle_wrapping)

function InputReplace()
        local old_word = vim.fn.input('Replace: ')
        local new_word = vim.fn.input('With: ')
        vim.cmd('\'<,\'>s/' .. old_word .. '/' .. new_word .. '/gI')
end
