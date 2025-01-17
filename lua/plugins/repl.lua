return {
    "Vigemus/iron.nvim",

    config = function ()
        local iron = require("iron.core")

        iron.setup({
            config = {
                repl_definition = {
                    python = {
                        command = {"python3"},
                        format = require("iron.fts.common").bracketed_paste_python
                    }
                }
            },

            keymaps = {
                send_motion = "<leader>sc",
                visual_send = "<leader>sc",
                send_line = "<leader>sl",
            }
        })
    end
}
