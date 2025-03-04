-- used to define all the keymaps in the neovim config
return {
	"mrjones2014/legendary.nvim",
    dependencies = {
        "kkharji/sqlite.lua",
        "nvim-telescope/telescope.nvim"
    },
	priority = 10000,
	lazy = false,
	config = function()
		require("legendary").setup({
            include_builtins = true,
            select_prompt = "Looking for something?",
			extensions = {
				lazy_nvim = true,
				nvim_tree = true,
			},
			keymaps = {
                {
                    "<C-o>",
                    ":Legendary<CR>",
                    description = "Search keymaps, commands and autocmd using Legendary",
                    mode = "n",
                },
				{
					"<C-t>",
					require("telescope.builtin").find_files,
					description = "Fuzzy find files using Telescope",
					mode = "n",
				},
				{
					"<C-g>",
					require("telescope.builtin").live_grep,
					description = "Live Grep in the file using Telescope",
					mode = "n",
				},
				{
					"<Leader>ls",
					require("auto-session.session-lens").search_session,
					description = "Change session's file using Sessions",
					mode = "n",
				},
				{
					"<C-b>",
					function()
						require("cmp").mapping.scroll_docs(-4)()
					end,
					description = "Scroll the completion docs up",
					mode = "i",
				},
				{
					"<C-f>",
					function()
						require("cmp").mapping.scroll_docs(4)()
					end,
					description = "Scroll completion docs down",
					mode = "i",
				},
				{
					"<C-Space>",
					function()
						require("cmp").mapping.complete()()
					end,
					description = "Trigger completion",
					mode = "i",
				},
				{
					"<C-e>",
					function()
						require("cmp").mapping.abort()()
					end,
					description = "Abort completion",
					mode = "i",
				},
				{
					"<CR>",
					function()
						require("cmp").mapping.confirm({ select = true })()
					end,
					description = "Confirm selected completion",
					mode = "i",
				},
				{
					"K",
					vim.lsp.buf.hover,
					description = "Show hover definition of the LSP",
					mode = "n",
				},
				{
					"gd",
					vim.lsp.buf.definition,
					description = "Go to the definition of the LSP",
					mode = "n",
				},
				{
					"<leader>ca",
					vim.lsp.buf.code_action,
					description = "Show the possible code actions from the LSP",
					mode = { "n", "v" },
				},
				{
					"<leader>gf",
					vim.lsp.buf.format,
					description = "Format the current buffer based on LSP",
					mode = "n",
				},
				{
					"<C-n>",
					":Neotree filesystem reveal left<CR>",
					description = "Toggle Neotree filesystem on the left",
					mode = "n",
				},
				{
					"<A-j>",
					":MoveLine 1<CR>",
					description = "Move the line up",
					mode = "n",
				},
				{
					"<A-k>",
					":MoveLine -1<CR>",
					description = "Move the line down",
					mode = "n",
				},
				{
					"<A-h>",
					":MoveHChar -1<CR>",
					description = "Move the character under the cursor left",
					mode = "n",
				},
				{
					"<A-l>",
					":MoveHChar 1<CR>",
					description = "Move the character under the cursor right",
					mode = "n",
				},
				{
					"<leader>wf",
					":MoveWord 1<CR>",
					description = "Move the word under the cursor forwards",
					mode = "n",
				},
				{
					"<leader>wb",
					":MoveWord -1<CR>",
					description = "Move the word under the cursor backwards",
					mode = "n",
				},
				{
					"<A-j>",
					":MoveBlock 1<CR>",
					description = "Move the selected block up",
					mode = "v",
				},
				{
					"<A-k>",
					":MoveBlock -1<CR>",
					description = "Move the selected block down",
					mode = "v",
				},
				{
					"<A-h>",
					":MoveHBlock -1<CR>",
					description = "Move a visual area left",
					mode = "v",
				},
				{
					"<A-l>",
					":MoveHBlock 1<CR>",
					description = "Move a visual area right",
					mode = "v",
				},
			},
		})
	end,
}
