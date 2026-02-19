local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("mason").setup()
require("mason-lspconfig").setup()

-- HTML
vim.lsp.config.html = {
	cmd = { "vscode-html-language-server", "--stdio" },
	filetypes = { "html" },
	root_markers = { "package.json", ".git" },
	capabilities = capabilities,
}

-- CSS
vim.lsp.config.cssls = {
	cmd = { "vscode-css-language-server", "--stdio" },
	filetypes = { "css", "scss", "less" },
	root_markers = { "package.json", ".git" },
	capabilities = capabilities,
}

-- Python
vim.lsp.config.pyright = {
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = { "pyproject.toml", "setup.py", ".git" },
	capabilities = capabilities,
}

-- Lua
vim.lsp.config.lua_ls = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".git" },
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
		},
	},
}

-- Rust
vim.lsp.config.rust_analyzer = {
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	root_markers = { "Cargo.toml", "Cargo.lock", ".git" },
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {
			cargo = {
				allFeatures = true,
			},
			checkOnSave = true,
		},
	},
}

-- Svelte
vim.lsp.config.svelte = {
	cmd = { "svelteserver", "--stdio" },
	filetypes = { "svelte" },
	root_markers = { "package.json", "svelte.config.js", ".git" },
	capabilities = capabilities,
}

-- C
vim.lsp.config.clangd = {
	cmd = { "clangd" },
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
	root_markers = { "compile_commands.json", "compile_flags.txt", ".git" },
	capabilities = capabilities,
}

-- TS
vim.lsp.config.ts_ls = {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
	capabilities = capabilities,
}

vim.lsp.config.tinymist = {
	cmd = { "tinymist" },
	filetypes = { "typst" },
	root_markers = { ".git" },
	capabilities = capabilities,
}

vim.lsp.config.intelephense = {
	cmd = { "intelephense", "--stdio" },
	filetypes = { "php" },
	root_markers = { "composer.json", ".git" },
}

-- Enable LSPs for these filetypes
vim.lsp.enable({
	"pyright",
	"lua_ls",
	"rust_analyzer",
	"ts_ls",
	"svelte",
	"html",
	"cssls",
	"clangd",
	"tinymist",
	"intelephense",
})

-- Keybindings
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local opts = { buffer = args.buf }
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	end,
})

vim.keymap.set("n", "<Esc>", function()
	vim.lsp.buf.clear_references()
	vim.cmd("nohl") -- Also clears search highlights
end, { desc = "Clear highlights" })
