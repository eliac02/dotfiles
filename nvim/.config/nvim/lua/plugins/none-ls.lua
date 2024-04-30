return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.golines,
        null_ls.builtins.formatting.google_java_format,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.biome,
				null_ls.builtins.formatting.sqlfmt,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
