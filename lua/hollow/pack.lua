-- Plugin management via vim.pack (Neovim 0.12+). Replaces packer.lua.
-- Lockfile: nvim-pack-lock.json in the config dir -- commit it.

local function gh(repo)
    return "https://github.com/" .. repo
end

-- Build/update hooks (packer's `run = ...`).
-- Must be registered BEFORE vim.pack.add() so they fire on first install.
vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if kind ~= "install" and kind ~= "update" then
            return
        end

        if name == "nvim-treesitter" then
            if not ev.data.active then
                vim.cmd.packadd("nvim-treesitter")
            end
            pcall(vim.cmd, "TSUpdate")
        end

        if name == "telescope-fzf-native.nvim" then
            local cmd
            if vim.fn.has("win32") == 1 then
                cmd = {
                    "cmd",
                    "/c",
                    "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release"
                    .. " && cmake --build build --config Release"
                    .. " && cmake --install build --prefix build",
                }
            else
                cmd = { "make" }
            end
            local ok, res = pcall(function()
                return vim.system(cmd, { cwd = ev.data.path }):wait()
            end)
            if not ok or res.code ~= 0 then
                vim.notify("telescope-fzf-native build failed (telescope falls back to its Lua sorter)",
                    vim.log.levels.WARN)
            end
        end
    end,
})

vim.pack.add({
    -- shared dependencies first
    gh("nvim-lua/plenary.nvim"),
    gh("nvim-tree/nvim-web-devicons"),

    { src = gh("nvim-telescope/telescope.nvim"), version = "v0.2.1" },
    gh("nvim-telescope/telescope-fzf-native.nvim"),

    { src = gh("catppuccin/nvim"),               name = "catppuccin" },
    gh("neovim-treesitter/treesitter-parser-registry"),
    gh("neovim-treesitter/nvim-treesitter"),

    { src = gh("ThePrimeagen/harpoon"),         version = "harpoon2" },

    gh("mbbill/undotree"),
    gh("tpope/vim-fugitive"),
    gh("neovim/nvim-lspconfig"),

    { src = gh("chomosuke/typst-preview.nvim"), version = vim.version.range("^1.0.0") },

    gh("folke/which-key.nvim"),
    gh("nvim-tree/nvim-tree.lua"),

    -- completion
    gh("hrsh7th/nvim-cmp"),
    gh("hrsh7th/cmp-nvim-lsp"),
    gh("hrsh7th/cmp-buffer"),
    gh("hrsh7th/cmp-path"),
    gh("L3MON4D3/LuaSnip"),
    gh("saadparwaiz1/cmp_luasnip"),

    gh("stevearc/conform.nvim"),
    gh("f-person/auto-dark-mode.nvim"),
    gh("windwp/nvim-autopairs"),
    gh("folke/trouble.nvim"),
    gh("OXY2DEV/markview.nvim"),
    gh("folke/zen-mode.nvim"),
    gh("nvim-lualine/lualine.nvim"),

    gh("mason-org/mason.nvim"),
    gh("mason-org/mason-lspconfig.nvim"),

    gh("ThePrimeagen/vim-be-good"),
    gh("tpope/vim-cucumber"),
    gh("arnamak/stay-centered.nvim"),
    gh("kylechui/nvim-surround"),
}, { confirm = false })

-- Was `config = function() ... end` on the packer spec
require("typst-preview").setup({})
