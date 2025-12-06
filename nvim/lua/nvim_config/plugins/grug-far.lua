return {
    "MagicDuck/grug-far.nvim",
    config= function()
        local grug_far = require("grug-far")

        grug_far.setup({ })
        vim.keymap.set("n", "<leader>go", "<cmd>GrugFar<CR>", { noremap = true })
    end
}
