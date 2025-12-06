return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local startify = require("alpha.themes.startify")
        local alpha = require("alpha")

        startify.file_icons.provider = "devicons",
        alpha.setup(
            startify.config
        )
    end
}
