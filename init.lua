require("hollow.remap") -- sets mapleader, so keep it first
require("hollow.pack")  -- vim.pack.add(); plugins must be loaded before the requires below
require("hollow.treesitter")
require("hollow.color")
require("hollow.diagnostics")

-- noter depends on pkill/ghostty/zathura, so Linux only
if vim.fn.has("win32") == 0 then
    require("hollow.noter")
end

-- disable netrw at the very start of your init.lua
--vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4 -- Number of spaces for indentation
vim.opt.expandtab = true
vim.opt.guicursor = ""

if vim.g.neovide then
    vim.g.neovide_cursor_animation_length = 0
    vim.g.neovide_cursor_trail_size = 0
end
