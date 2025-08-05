return {
    "Mofiqul/vscode.nvim",
    config = function()
        vim.opt.background = "light"
        local c = require("vscode.colors").get_colors()
        require("vscode").setup({})

        vim.cmd("colorscheme vscode")

        vim.cmd.highlight("LineNr guifg=#000000")
        vim.cmd.highlight("FoldColumn guifg=#afafaf")
        vim.cmd.highlight("NonText guifg=#afafaf")
        vim.cmd.highlight("Whitespace guifg=#afafaf")
    end,
}
