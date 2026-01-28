require('nvim-tree').setup({
  view = {
    side = 'left',
    width = 30,
  },
  renderer = {
    indent_markers = {
      enable = true,
    },
  },
})

local preview = require('nvim-tree-preview')
preview.setup()

-- Keybindings for preview
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>')

-- Add preview keybinding when nvim-tree is open
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'NvimTree',
  callback = function()
    local api = require('nvim-tree.api')
    vim.keymap.set('n', 'P', preview.watch, { buffer = true, desc = 'Preview file' })
    vim.keymap.set('n', '<Esc>', preview.unwatch, { buffer = true, desc = 'Close preview' })
  end,
})
