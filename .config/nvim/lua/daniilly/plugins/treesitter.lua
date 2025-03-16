return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			highlight = {
				enable = true,
			},
			indent = { enable = false },
			autotag = {
				enable = true,
			},
			ensure_installed = {
				"markdown_inline",
				"dockerfile",
				"typescript",
				"javascript",
				"gitignore",
				"markdown",
				"angular",
				"vimdoc",
				"prisma",
				"query",
				"ruby",
				"bash",
				"scss",
				"html",
				"yaml",
				"json",
				"vim",
				"lua",
				"css",
				"tsx",
				"c",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})

		vim.opt.indentexpr = "GetTypescriptIndent()"
	end,
}
