return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local oil = require("oil")
        local keymap = vim.keymap

        oil.setup({
            default_file_explorer = false,
        })
        keymap.set("n", "<leader>oil", "<cmd>Oil --float<CR>", { desc = "Open Oil floating window", noremap = true })
    end
}
