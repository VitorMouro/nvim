vim.g.mapleader = " "
vim.g.localmapleader = " "

vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.showmode = true
vim.opt.spell = true
vim.opt.spelllang = "en"
vim.opt.linebreak = true

-- indentation
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.breakindent = true

-- search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- UI
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.colorcolumn = "120"
vim.opt.list = true
vim.opt.listchars = {
    tab = "┊ ",
    trail = "·",
    extends = "»",
    precedes = "«",
    nbsp = "×"
}
vim.opt.inccommand = "split"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.termguicolors = true
