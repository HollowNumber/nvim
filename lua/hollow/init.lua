require('hollow.remap')
require('hollow.treesitter')
require('hollow.color')
require('hollow.diagnostics')

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.statuscolumn = "%s %{v:relnum} %{v:lnum}"
vim.opt.shiftwidth = 4 -- Number of spaces for indentation
vim.opt.expandtab = true
