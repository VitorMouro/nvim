vim.keymap.set("n", "<esc>", vim.cmd.nohls, { desc = 'No search highlight' })
vim.keymap.set("t", "<esc>", "<C-\\><C-n>", { desc = 'Exit terminal mode' })

-- Windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = 'Move to window on the left' })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = 'Move to window below' })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = 'Move to window above' })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = 'Move to window right' })

vim.keymap.set("n", "H", "^", { desc = 'To first line pos' })
vim.keymap.set("n", "J", "}", { desc = 'To next blank line' })
vim.keymap.set("n", "K", "{", { desc = 'To previous blank line' })
vim.keymap.set("n", "L", "$", { desc = 'To last line pos' })
