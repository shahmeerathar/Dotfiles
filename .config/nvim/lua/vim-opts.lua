vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.scrolloff = 15
vim.opt.signcolumn = 'yes'

vim.opt.splitright = true
vim.opt.splitbelow = true

-- since lualine already displays these
vim.opt.showmode = false
vim.opt.shortmess:append('S')

vim.keymap.set('n', '<leader><leader>', ':noh<CR>', { silent = true, desc = "Clear search highlighting" })

vim.keymap.set('n', '<M-o>', ':copen<CR>', { silent = true, desc = "Quickfix open" })
vim.keymap.set('n', '<M-c>', ':cclose<CR>', { silent = true, desc = "Quickfix close" })
vim.keymap.set('n', '<M-n>', ':cnext<CR>', { silent = true, desc = "Quickfix next" })
vim.keymap.set('n', '<M-p>', ':cprev<CR>', { silent = true, desc = "Quickfix previous" })

vim.keymap.set("i", '""', '""<Left>')
vim.keymap.set("i", "''", "''<Left>")
vim.keymap.set("i", "()", "()<Left>")
vim.keymap.set("i", "[]", "[]<Left>")
vim.keymap.set("i", "{}", "{}<Left>")
vim.keymap.set("i", "<>", "<><Left>")

vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set('n', '<leader>cp', function()
    vim.fn.setreg('+', vim.fn.expand('%'))
end, { desc = 'Copy file name to clipboard' })

vim.g.clipboard = {
    name = 'OSC 52',
    copy = {
        ['+'] = require('vim.ui.clipboard.osc52').copy '+',
        ['*'] = require('vim.ui.clipboard.osc52').copy '*',
    },
    paste = {
        ['+'] = require('vim.ui.clipboard.osc52').paste '+',
        ['*'] = require('vim.ui.clipboard.osc52').paste '*',
    },
}
