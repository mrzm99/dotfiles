return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-refactor",
    },
    config = function()
        local configs = require("nvim-treesitter.configs")
        local palette = {
            red = "#993F3A",
            orange = "#C27638",
            blue = "#6671C0",
            light_blue = "#38C2C2",
            green = "#8DC951",
            purple = "#6662A4",
            yellow = "#F6E85e",
            black = "#202020",
            white = "#E7E7E7",
            white_blue = "#A5D0D1",
            gray = "#B7B7B7",
            pink = "#B04DAB",
            lightgreen = "#32CD32",
        }

        configs.setup({
            ensure_installed = { "c", "cpp", "python", "rust", "lua", "vim" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },

            refactor = {
                highlight_definitions = {
                    enable = true,
                    clear_on_cursor_move = true,
                },
                highlight_current_scope = { enable = false },
            }
        })

        local is_hl_enabled = false

        vim.keymap.set('n', '<leader>th', function()
            is_hl_enabled = not is_hl_enabled

            if is_hl_enabled then
                vim.api.nvim_set_hl(0, "TSDefinition", { link = "Search" })
                vim.api.nvim_set_hl(0, "TSDefinitionUsage", { link = "Search" })
                print("Variable Highlight: ON")
            else
                vim.api.nvim_set_hl(0, "TSDefinition", {})
                vim.api.nvim_set_hl(0, "TSDefinitionUsage", {})
                print("Variable Highlight: OFF")
            end
        end, { noremap = true, silent = true })
    end
}
