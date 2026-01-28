require("catppuccin").setup({
	flavour = "frappe",
	transparent_background = true,
	integrations = {
		telescope = true,
		cmp = true,
		neotree = true,
		-- other integrations you want
	},
})
vim.cmd.colorscheme("catppuccin")
