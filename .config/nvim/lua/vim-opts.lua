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

vim.keymap.set('n', '<leader><leader>', ':noh<CR>', { silent = true })

vim.keymap.set('n', '<M-o>', ':copen<CR>', { silent = true })
vim.keymap.set('n', '<M-c>', ':cclose<CR>', { silent = true })
vim.keymap.set('n', '<M-j>', ':cnext<CR>', { silent = true })
vim.keymap.set('n', '<M-k>', ':cprev<CR>', { silent = true })
