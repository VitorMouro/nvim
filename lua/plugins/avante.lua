return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        {
            "MeanderingProgrammer/render-markdown.nvim",
            opts = {
                file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
        },
    },
    config = function()
        require("avante").setup({
            provider = "gemini",
        })
    end
}
