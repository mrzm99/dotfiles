return {
    "tzachar/highlight-undo.nvim",
    config = function()
        local highlight_undo = require("highlight-undo")

        highlight_undo.setup({
            duration = 500
        })
    end
}
