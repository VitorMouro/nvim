return {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {"LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter", "LazyGitFilterCurrentFile"},
    keys = {
        {"<leader>lg", "<cmd>LazyGit<CR>", desc = "lazygit"},
        {"<leader>lc", "<cmd>LazyGitCurrentFile<CR>", desc = "lazygit current file"}
    }
}
