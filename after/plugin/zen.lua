require('zen-mode').setup({
    window = {
        width = 120,          -- width of the zen window
        options = {
            number = false,   -- disable line numbers
            relativenumber = false, -- disable relative numbers
            signcolumn = "no", -- disable sign column
            cursorline = false, -- disable cursor line
        }
    },
    plugins = {
        options = {
            enabled = true,
            ruler = false,          -- disables the ruler text
            showcmd = false,        -- disables the command in the last line
        },
        twilight = { enabled = false }, -- enable if you want dimming
        gitsigns = { enabled = false }, -- disable git signs
    },
})

-- Keybinding
vim.keymap.set('n', '<leader>z', '<cmd>ZenMode<CR>', { desc = 'Toggle Zen Mode' })
