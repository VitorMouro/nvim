return {
    "numToStr/Comment.nvim",
    config = function()
        require("Comment").setup({})

        -- vim.cmd('autocmd BufEnter * set formatoptions-=cro')
        -- vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')
    end,
}
