vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = 'Explorer' })
vim.keymap.set("n", "<leader>nh", vim.cmd.nohls, { desc = 'No search highlight' })

vim.keymap.set("t", "<esc>", "<C-\\><C-n>", { desc = 'Exit terminal mode' })

vim.keymap.set("n", "<leader>q", vim.cmd.q, { desc = 'Quit' })

