require("hollow.remap")
require("hollow.treesitter")
require("hollow.color")
require("hollow.diagnostics")
require("hollow.noter")

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

vim.g.neovide_scroll_animation_length = 0
vim.g.neovide_position_animation_length = 0

if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
    vim.fn.chdir(vim.fn.argv(0))
end
