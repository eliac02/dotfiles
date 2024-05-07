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
            },
        })

        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
