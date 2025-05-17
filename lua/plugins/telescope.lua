return {
    'nvim-telescope/telescope.nvim',

    dependencies = {
        'nvim-lua/plenary.nvim',
    },

    config = function()
        require('telescope').setup({})

        local builtin = require 'telescope.builtin'
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files (Telescope)' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep (Telescope)' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Buffers (Telescope)' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags (Telescope)' })
        vim.keymap.set('n', '<leader>fr', builtin.registers, { desc = 'Registers (Telescope)' })

    end,
}
