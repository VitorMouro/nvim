-- Basic settings
vim.opt.number = true             -- Show line numbers
vim.opt.relativenumber = true     -- Show relative line numbers
vim.opt.tabstop = 4               -- Number of spaces a tab counts for
vim.opt.shiftwidth = 4            -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true          -- Use spaces instead of tabs
vim.opt.smartindent = true        -- Smart autoindenting when starting a new line
vim.opt.wrap = false              -- Disable line wrapping
vim.opt.scrolloff = 8             -- Minimum number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 8         -- Minimum number of screen columns to keep to the left and right of the cursor
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.mouse = "a"               -- Enable mouse support in all modes

-- Search Settings
vim.opt.hlsearch = false          -- Don't highlight all search matches
vim.opt.incsearch = true          -- Incremental search that shows matches as you type
vim.opt.ignorecase = true         -- Ignore case in search patterns
vim.opt.smartcase = true          -- Override 'ignorecase' if search contains uppercase characters

-- UI
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
