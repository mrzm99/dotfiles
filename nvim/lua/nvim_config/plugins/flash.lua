return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "flash" },
        { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "flash treesitter" },
        { "r", mode = "o", function() require("flash").remote() end, desc = "remote flash" },
        { "R", mode = { "o", "x" }, function() require("flash").toggle() end, desc = "toggle flash search"},
    },
    config = function()
        vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#B00000", bg = "#1f1f1f", bold = true })
        vim.api.nvim_set_hl(0, "FlashMatch", { fg = "#30D030", bg = "#1f1f1f", bold = true })
    end
}
