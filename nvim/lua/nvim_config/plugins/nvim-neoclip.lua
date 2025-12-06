return {
    "AckslD/nvim-neoclip.lua",
    dependencies = { {"kkharji/sqlite.lua", module = "sqlite"}, "nvim-telescope/telescope.nvim" },
    config = function()
        local neoclip = require("neoclip")
        local keymap = vim.keymap

        neoclip.setup({
            keys = {
                telescope = {
                    i = {
                        paste = '<CR>',
                    }
                }
            }
        })
        keymap.set("n", "<leader>nc", "<cmd>Telescope neoclip<CR>", { noremap = true }) 
        keymap.set("n", "<leader>nd", "<cmd>lua require(\"neoclip\").clear_history()<CR>", { noremap = true })
    end
}
