-- used to format code
return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                -- stylua is for Lua
                null_ls.builtins.formatting.stylua,
                -- prettier is for JS, JSX, TS, HTML, CSS, JSON, MarkDown, YAML
                null_ls.builtins.formatting.prettier.with({
                    filetypes = {"html", "css", "json", "yaml", "markdown" },
                }),
                null_ls.builtins.diagnostics.markdownlint,
                -- black is for Python
                null_ls.builtins.formatting.black,
                -- isort is for Python import statements
                null_ls.builtins.formatting.isort,
                -- gofmt is for Go
                null_ls.builtins.formatting.gofmt,
                null_ls.builtins.diagnostics.golangci_lint,
                -- goimports is for go import statements
                null_ls.builtins.formatting.goimports,
                -- google_java_format is for Java
                null_ls.builtins.formatting.google_java_format,
                -- shfmt is for Bash
                null_ls.builtins.formatting.shfmt,
                -- sql_formatter is for SQL
                null_ls.builtins.formatting.sql_formatter,
                -- phpcsf is for check code standard violations
                null_ls.builtins.formatting.phpcsfixer,
                -- phpcbf is for fixing PHP code violations 
                null_ls.builtins.formatting.phpcbf,
                null_ls.builtins.diagnostics.phpstan,
                --dart_format is for Dart
                --null_ls.builtins.formatting.dart_format,
                -- clang_format is for C, C++, and family
                null_ls.builtins.formatting.clang_format.with({
                    disabled_filetypes = { "java" },
                }),
                -- asmfmt is for Assembly, formats like go code
                null_ls.builtins.formatting.asmfmt,
            },
        })

        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
