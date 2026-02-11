return {
    "neovim/nvim-lspconfig",
    lazy = true,
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "SmiteshP/nvim-navbuddy",
        {
            "nvimdev/lspsaga.nvim",
            config = function()
                require("lspsaga").setup({
                    ui = { border = "rounded" },
                    symbol_in_winbar = { enable = false },
                })
            end,
            dependencies = {
                "nvim-treesitter/nvim-treesitter",
                "nvim-tree/nvim-web-devicons",
            }
        }
    },
    event = "BufReadPre",
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local lspconfig = require("lspconfig")
        local navbuddy = require("nvim-navbuddy")

        mason.setup({
            ui = {
                icons = {
                    package_installed = "✔",
                    package_pending = "➜",
                    package_uninstalled = "×"
                }
            }
        })
--        mason_lspconfig.setup({
--            ensure_installed = { "clangd", "lua_ls" },
--            automatic_installation = true,
--        })

        local common_on_attach = function(client, bufnr)
            navbuddy.attach(client, bufnr)
        end

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                local opts = { buffer = ev.buf, silent = true }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
                vim.keymap.set('n', '<leader>nv', '<cmd>Navbuddy<cr>', opts)
                vim.keymap.set('n', 'gp', '<cmd>Lspsaga peek_definition<cr>', opts)
                vim.keymap.set('n', 'gP', '<cmd>Lspsaga peek_type-definition<cr>', opts)
                vim.keymap.set('n', 'gh', '<cmd>Lspsaga finder<cr>', opts)
                vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', opts)
                vim.keymap.set('n', 'gn', '<cmd>Lspsaga rename<cr>', opts)
                vim.keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<cr>', opts)
                vim.keymap.set('n', '<leader>o', '<cmd>Lspsaga outline<cr>', optsqdfsss)
            end,
        })

        lspconfig.clangd.setup({
            on_attach = function(client, bufnr)
                client.server_capabilities.documentHighlightProvider = false
            end,
        })

        lspconfig.csharp_ls.setup({
            cmd = { vim.fn.expand("~/.dotnet/tools/csharp-ls") },
            filetype = { "cs" },
            root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj", ".git"),
            settings = {
                csharp = {
                    formatting = {
                        enable = true
                    }
                },
            },
        })
    end
}
