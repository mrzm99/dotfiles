return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                sorter = require("telescope.sorters").get_fuzzy_file,
                sorting_strategy = "descending",
                scroll_strategy = "limit",
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = { width = 0.9, height = 0.6 },
                },
                mappings = {
                    i = {
                        ["<C-h>"] = "which_key",
                    }
                },
                file_ignore_patterns = {
                    "%.git/",
                    ".git/",
                    "node_modules/",
                    "%.DS_Store/",
                    "%.cache/",
                    "%.vscode/",
                    ".vscode/",
                    "vendor/",
                    "build/",
                    "[/\\]bin[/\\]",
                    "[/\\]obj[/\\]",
                },
            },
        })
        local opts = { noremap = true, silent = true }
        vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
        vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
        vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
        vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)
        vim.api.nvim_set_keymap("n", "<leader>ch", "<cmd>Telescope command_history<CR>", opts)
        vim.api.nvim_set_keymap("n", "<leader>fq", "<cmd>Telescope quickfix<CR>", opts)
        vim.api.nvim_set_keymap("n", "<leader>fu", "<cmd>Telescope search_history<CR>", opts)
        vim.api.nvim_set_keymap("n", "<leader>fm", "<cmd>Telescope marks<CR>", opts)
        vim.keymap.set("n", "<leader>fd", builtin.diagnostics, opts)
    end
}
