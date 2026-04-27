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

        -- LSPがバッファにアタッチされた時の共通処理
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
                vim.keymap.set('n', '<leader>o', '<cmd>Lspsaga outline<cr>', opts) -- ★タイポを修正

                local client = vim.lsp.get_client_by_id(ev.data.client_id) -- ★argsをevに修正

                if client then
                    -- 使われていなかった共通関数 (common_on_attach) の代わりにここでNavbuddyをアタッチ
                    navbuddy.attach(client, ev.buf)

                    -- LSPサーバーが「ドキュメントハイライト機能」をサポートしているか確認
                    if client.server_capabilities.documentHighlightProvider then
                        local hl_augroup = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })

                        vim.api.nvim_clear_autocmds({ buffer = ev.buf, group = hl_augroup }) -- ★argsをevに修正
                        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                            buffer = ev.buf,
                            group = hl_augroup,
                            callback = vim.lsp.buf.document_highlight,
                        })

                        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                            buffer = ev.buf,
                            group = hl_augroup,
                            callback = vim.lsp.buf.clear_references,
                        })
                    end
                end
            end,
        })

        -- =====================================================================
        -- 旧: require('lspconfig') の削除と、新: vim.lsp.config() への移行
        -- =====================================================================

        -- 1. clangd のセットアップ
        vim.lsp.config('clangd', {
            root_markers = { 'Makefile', '.git', 'compile_commands.json' },
        })
        vim.lsp.enable('clangd')

        -- 2. csharp_ls のセットアップ
        vim.lsp.config('csharp_ls', {
            cmd = { vim.fn.expand("~/.dotnet/tools/csharp-ls") },
            filetypes = { "cs" }, 
            root_markers = { ".sln", ".csproj", ".git" }, -- Neovim 0.11のネイティブなルート指定方法
            settings = {
                csharp = {
                    formatting = {
                        enable = true
                    }
                },
            },
        })
        vim.lsp.enable('csharp_ls')
    end
}
