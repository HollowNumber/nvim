require("nvim-treesitter").setup({
	install_dir = vim.fn.stdpath("data") .. "/site",
})

require("nvim-treesitter").install({
	"rust",
	"javascript",
	"c",
	"markdown",
	"svelte",
	"html",
	"css",
	"typst",
	"java",
	"typescript",
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})
