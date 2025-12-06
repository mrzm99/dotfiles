return {
    "mhartington/oceanic-next",
    lazy = false,
    config = function()
        vim.cmd("colorscheme OceanicNext")
        vim.api.nvim_set_hl(0, "Search", { bg = "#E6E600", fg = "#000000" })
    end
}
