vim.g.mapleader = " "
vim.g.localmapleader = " "

vim.schedule(function()
    vim.opt.clipboard = "unnamedplus"
end)

vim.opt.shell = "/usr/bin/zsh"
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.mouse = ""
vim.opt.showmode = true
vim.opt.spell = true
vim.opt.spelllang = "en,pt"
vim.opt.linebreak = true
vim.opt.wrap = false
vim.opt.textwidth = 80
vim.opt.colorcolumn = "+1"
vim.cmd("highlight ColorColumn ctermbg=lightgrey guibg=#cfd4e3")

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
