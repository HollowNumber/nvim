require("catppuccin").setup({
	flavour = "frappe",
	transparent_background = false,
	integrations = {
		telescope = true,
		cmp = true,
		mason = true,
		--neotree = true,
		-- other integrations you want
	},
})
vim.cmd.colorscheme("catppuccin")
