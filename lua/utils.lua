-- Define config command to open the config dir
vim.api.nvim_create_user_command("Config", function()
  local config_path = vim.fn.stdpath("config")
  vim.cmd("edit " .. config_path)
end, {})


