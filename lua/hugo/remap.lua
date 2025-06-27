vim.g.mapleader = " "

vim.keymap.set("n", "<leader>w", ":wall<CR>")
vim.keymap.set("n", "<leader>q", ":wall<CR>:qall<CR>")

vim.keymap.set("n", "<CR>", ":w<cr>")
vim.keymap.set("n", "<leader>h", ":w<cr>:!guile --no-auto-compile %<cr>")

-- Follow link (probably the most useful remap I ever done)
vim.keymap.set("n", "<leader>fl", "yiW:!xdg-open <C-r>\" & <CR><CR>", { silent = true })

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

vim.keymap.set("n", "grn", "<nop>")
vim.keymap.set("n", "gra", "<nop>")
vim.keymap.set("n", "grr", "<nop>")
vim.keymap.set("n", "gri", "<nop>")
vim.keymap.set("n", "gO", "<nop>")
vim.keymap.set("n", "<C-s>", "<nop>")

vim.keymap.set("n", "<leader><leader>", vim.lsp.buf.format)
vim.keymap.set({ "n", "v" }, "ga", vim.lsp.buf.code_action)
vim.keymap.set("n", "grr", vim.lsp.buf.references)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gs", vim.lsp.buf.document_symbol)
vim.keymap.set("n", "<C-h>", vim.lsp.buf.signature_help)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("v", "<leader>x", ":'<,'>Refactor extract ")
vim.keymap.set("v", "<leader>X", ":'<,'>Refactor extract_to_file ")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("x", "<leader>s", "y:%s/<C-r>0/<C-r>0/gI<Left><Left><Left>")
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
vim.keymap.set('x', '<leader>r', ':<C-u>lua InputReplace()<CR>', { noremap = true, silent = true })

function InputReplace()
        local old_word = vim.fn.input('Replace: ')
        local new_word = vim.fn.input('With: ')
        vim.cmd('\'<,\'>s/' .. old_word .. '/' .. new_word .. '/gI')
end
