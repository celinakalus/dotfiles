local telescope_builtin = require('telescope.builtin')

vim.opt.listchars = {
	eol = '↵',
	tab = '▻ ',
	trail = '￮' }

vim.opt.list = true

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.autoindent = true

vim.opt.textwidth = 72
vim.opt.colorcolumn = '+0'

vim.wo.number = true

vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, {})

