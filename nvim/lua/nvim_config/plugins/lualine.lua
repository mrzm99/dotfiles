return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local lualine = require("lualine")
        local ts_ctx = require("treesitter-context")

        lualine.setup({
            options = {
                icons_enabled = true,
                theme = "seoul256",
            },
            sections = {
                lualine_c = {
                    {
                        'filename',
                        path = 3,
                    }
                },
            },
        })
    end
}
