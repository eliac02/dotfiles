return {
    -- Mason is used to completion and lsp
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls", --Lua
                    "gopls", -- Golang
                    "pyright", -- Python
                    "jdtls", -- Java
                    "sqlls", -- SQL
                    "html", -- HTML
                    "cssls", -- CSS
                    "bashls", -- Bash
                    "jsonls", -- JSON
                    "intelephense", -- PHP
                    --"ast_grep", -- Dart
                    "clangd", -- C
                    "asm_lsp", --Assembly
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")
            local servers = {
                "lua_ls",
                "gopls",
                "clangd",
                "pyright",
                "jdtls",
                "bashls",
                "jsonls",
                "sqlls",
                "asm_lsp",
                "html",
                "cssls",
                "intelephense",
            }

            for _,lsp in ipairs(servers) do
                lspconfig[lsp].setup({
                    capabilities = capabilities,
                })
            end
        end,
    },
}
