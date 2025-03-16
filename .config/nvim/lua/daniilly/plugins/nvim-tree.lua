return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local nvimtree = require("nvim-tree")

		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			view = {
				width = 35,
				relativenumber = true,
			},
			renderer = {
				indent_markers = {
					enable = true,
				},
			},
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".DS_Store" },
			},
			git = {
				ignore = false,
			},
			live_filter = {
				prefix = "[FILTER]: ",
				always_show_folders = false,
			},
		})

		local keymap = vim.keymap

		keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
		keymap.set(
			"n",
			"<leader>ef",
			"<cmd>NvimTreeFindFileToggle<CR>",
			{ desc = "Toggle file explorer on current file" }
		)
		keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

		-- Make :bd and :q behave as usual when tree is visible
		vim.api.nvim_create_autocmd({ "BufEnter", "QuitPre" }, {
			nested = false,
			callback = function(e)
				local tree = require("nvim-tree.api").tree

				if not tree.is_visible() then
					return
				end

				local winCount = 0
				for _, winId in ipairs(vim.api.nvim_list_wins()) do
					if vim.api.nvim_win_get_config(winId).focusable then
						winCount = winCount + 1
					end
				end

				if e.event == "QuitPre" and winCount == 2 then
					vim.api.nvim_cmd({ cmd = "qall" }, {})
				end

				-- :bd was probably issued an only tree window is left
				-- Behave as if tree was closed (see `:h :bd`)
				if e.event == "BufEnter" and winCount == 1 then
					vim.defer_fn(function()
						tree.toggle({ find_file = true, focus = true })
						tree.toggle({ find_file = true, focus = false })
					end, 10)
				end
			end,
		})
	end,
}
