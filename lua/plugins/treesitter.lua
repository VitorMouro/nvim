return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-context",
    },
    build = ":TSUpdate",
    config = function ()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "javascript", "typescript", "python" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })

        -- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
        -- vim.opt.foldtext = 'v:lua.vim.treesitter.foldtext()'
        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"

        require("treesitter-context").setup({})

    end
}
