return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({
            filetypes = {
                markdown = true,
                html = true,
                typescript = true,
                javascript = true,
                yaml = true,
            }
        })
    end,
}
