vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeOpen)


vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>")
vim.keymap.set("n", "<leader>xw", "<cmd>Trouble diagnostics toggle<cr>")
vim.keymap.set("n", "<leader>xb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>")
vim.keymap.set("n", "<leader>xr", "<cmd>Trouble lsp_references toggle<cr>")
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix toggle<cr>")


vim.keymap.set('n', '<Up>', '<cmd>echo "Use k"<CR>')
vim.keymap.set('n', '<Down>', '<cmd>echo "Use j"<CR>')
vim.keymap.set('n', '<Left>', '<cmd>echo "Use h"<CR>')
vim.keymap.set('n', '<Right>', '<cmd>echo "Use l"<CR>')

vim.keymap.set('v', '<Up>', '<cmd>echo "Use k"<CR>')
vim.keymap.set('v', '<Down>', '<cmd>echo "Use j"<CR>')
vim.keymap.set('v', '<Left>', '<cmd>echo "Use h"<CR>')
vim.keymap.set('v', '<Right>', '<cmd>echo "Use l"<CR>')
