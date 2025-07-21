return {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    dependencies = {
        "tpope/vim-repeat",
    },
    config = function()
        require('leap').setup({})
        require('leap').opts.equivalence_classes = { ' \t\r\n', '([{', ')]}', '\'"`' }
        require('leap').opts.preview_filter = function(ch0, ch1, ch2)
            return not (
                ch1:match('%s') or
                ch0:match('%a') and ch1:match('%a') and ch2:match('%a')
            )
        end

        vim.keymap.set({ 'n', 'x', 'o' }, '<leader>s', function()
            require('leap').leap({})
        end, { desc = "Leap Forward to" })

        vim.keymap.set({ 'n', 'x', 'o' }, '<leader>S', function()
            require('leap').leap({ backward = true })
        end, { desc = "Leap Backward to" })

        vim.keymap.set({ 'n', 'x', 'o' }, '<leader>gs', function()
            require('leap').leap({ target_windows = vim.api.nvim_list_wins() })
        end, { desc = "Leap Across Windows" })
    end,
}
