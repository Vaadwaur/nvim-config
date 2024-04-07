-- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.mapleader = " "

-- Same for `maplocalleader`
vim.g.maplocalleader = " "

vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('highlight_yank', {}),
    desc = 'Highlight selection on yank',
    pattern = '*',
    callback = function()
        vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
    end,
})

