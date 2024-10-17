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
                null_ls.builtins.formatting.prettier,
                -- black is for Python
                null_ls.builtins.formatting.black,
                -- isort is for Python import statements
                null_ls.builtins.formatting.isort,
                -- gofumpt is for Go
                null_ls.builtins.formatting.gofumpt,
                -- goimports is for go import statements
                null_ls.builtins.formatting.goimports,
                -- google_java_format is for Java
                null_ls.builtins.formatting.google_java_format,
                -- shfmt is for Bash
                null_ls.builtins.formatting.shfmt,
                -- sqlfmt is for SQL
                null_ls.builtins.formatting.sqlfmt,
                -- astyle is for C, C++, C#, Java, Arduino
                null_ls.builtins.formatting.astyle,
                -- phpcbf is for PHP
                null_ls.builtins.formatting.phpcbf,
                --dart_format is for Dart
                --null_ls.builtins.formatting.dart_format,
                -- clang_format is for C, C++, and family
                null_ls.builtins.formatting.clang_format,
                -- asmfmt is for Assembly
                null_ls.builtins.formatting.asmfmt,
            },
        })

        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
