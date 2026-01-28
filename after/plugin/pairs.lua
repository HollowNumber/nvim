local npairs = require('nvim-autopairs')

npairs.setup({
    check_ts = true,
    enable_check_bracket_line = false, -- Don't add pairs if closing bracket already exists on the line
})

-- Make Tab jump out if at closing bracket, otherwise trigger completion
vim.keymap.set('i', '<Tab>', function()
    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    local char_under_cursor = line:sub(col + 1, col + 1)

    if char_under_cursor:match('[%)%]%}"\']') then
        return '<Right>'
    else
        return vim.fn.pumvisible() == 1 and '<C-n>' or '<Tab>'
    end
end, { expr = true })
