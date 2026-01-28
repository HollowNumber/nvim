require('lualine').setup({
    options = {
        theme = 'catppuccin',
        globalstatus = true, -- Single statusline for all windows
        component_separators = '',
        section_separators = '',
    },
    sections = {
        lualine_a = { 'mode', 'branch' },
        lualine_b = { 'diff', 'location' },
        lualine_c = { 'filename', 'diagnostics' },
        -- Right side - leave empty
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
})
