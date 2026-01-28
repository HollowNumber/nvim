require('conform').setup({
	formatters_by_ft = {
		lua = { 'stylua' },
		python = { 'black', 'isort' },
		javascript = { 'prettier' },
		typescript = { 'prettier' },
		rust = { 'rustfmt' },
		go = { 'gofmt' },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})

-- Manual format keybinding
vim.keymap.set('n', '<leader>f', function()
	require('conform').format({ async = true, lsp_fallback = true })
end, { desc = 'Format file' })
