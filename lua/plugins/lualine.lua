return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'AndreM222/copilot-lualine'
    },
    config = function()
        require('lualine').setup({
            sections = {
                lualine_c = { { 'filename', path = 1 } },
                lualine_x = { 'copilot', 'encoding', 'fileformat', 'filetype' },
            },
        })
    end
}
