return {
    "kevinhwang91/nvim-ufo",
    event = "VeryLazy",
    dependencies = {
        "kevinhwang91/promise-async",
    },
    config = function()
        require("ufo").setup({
            provider_selector = function(bufnr, filetype, buftype)
                return { "treesitter", "indent" }
            end,
            preview = {
                win_config = {
                    border = "rounded"
                }
            }
        })

        vim.opt.foldcolumn = "1"
        vim.opt.foldlevel = 99
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true

        vim.keymap.set('n', 'zr', function() require("ufo").openAllFolds() end, { desc = "Open all folds" })
        vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith, { desc = "Close all folds" })
        vim.keymap.set('n', 'K', function()
            local winid = require("ufo").peekFoldedLinesUnderCursor()
            if not winid then
                vim.lsp.buf.hover({
                    border = "rounded"
                })
            end
        end)
    end,
}
