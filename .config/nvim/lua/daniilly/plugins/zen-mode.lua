return {
	"folke/zen-mode.nvim",
	dependencies = { "folke/twilight.nvim" },
	opts = {
		plugins = {
			tmux = { enabled = true },
			twilight = { enabled = true },
			wezterm = {
				enabled = true,
				font = "+2",
			},
		},
	},
	config = function()
		vim.keymap.set("n", "<leader>zm", "<cmd>ZenMode<CR>", { desc = "Toggle Zen Mode" })
	end,
}
