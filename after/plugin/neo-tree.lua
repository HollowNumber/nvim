require("neo-tree").setup({
	close_if_last_window = true,
	window = {
		position = "left",
		width = 30,
	},
	filesystem = {
		follow_current_file = {
			enabled = true,
		},
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = false,
		},
	},
})

vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>")
vim.keymap.set("n", "<leader>f", "<cmd>Neotree focus<CR>")
