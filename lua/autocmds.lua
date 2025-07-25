vim.api.nvim_create_autocmd("FileType", {
    pattern = "htmlangular",
    callback = function()
        vim.bo.filetype = "html"
    end,
})

-- Create Path command, that yanks the relative path of current file the working dir
vim.api.nvim_create_user_command("Path", function()
    local file_path = vim.fn.expand("%:p")
    local relative_path = vim.fn.fnamemodify(file_path, ":~:.")
    vim.fn.setreg("+", relative_path)
end, { desc = "Copy the relative path of the current file to the unnamed register" })

-- Same thing, but includes the current after the path, in the format LINE:COLUMN
vim.api.nvim_create_user_command("Line", function(args)
    local file_path = vim.fn.expand("%:p")
    local relative_path = vim.fn.fnamemodify(file_path, ":~:.")
    local full_path_with_range
    if args.range > 0 then
        local line_start = vim.fn.line("'<")
        local line_end = vim.fn.line("'>")
        local column_start = vim.fn.col("'<")
        local column_end = vim.fn.col("'>")
        local range_info = string.format("%d:%d-%d:%d", line_start, column_start, line_end, column_end)
        full_path_with_range = string.format("%s:%s", relative_path, range_info)
    else
        local line = vim.fn.line(".")
        local column = vim.fn.col(".")
        local range_info = string.format("%d:%d", line, column)
        full_path_with_range = string.format("%s:%s", relative_path, range_info)
    end
    vim.fn.setreg("+", full_path_with_range)
end, {
    nargs = 0,
    range = true,
    desc = "Copy the relative path of the current file with line and column to the unnamed register",
})

-- Run Copilot disable command on startup
-- vim.api.nvim_create_autocmd("VimEnter", {
--     pattern = "*",
--     callback = function()
--         vim.cmd("silent! Copilot disable")
--     end,
-- })
