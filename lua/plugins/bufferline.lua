return {
    'akinsho/bufferline.nvim',

    dependencies = {
        'lewis6991/gitsigns.nvim',
        'nvim-tree/nvim-web-devicons',
    },

    config = function()
        require('bufferline').setup({})
    end
}
