return {
    "akinsho/toggleterm.nvim",
    tag = "*", 
    config = function()
        local toggleterm = require("toggleterm")
        local keymap = vim.keymap
    
        toggleterm.setup({})
        keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { noremap = true })
    end
}
