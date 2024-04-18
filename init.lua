local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')

telescope.load_extension('live_grep_args')

vim.opt.listchars = {
	eol = '↵',
	tab = '¦ ',
	trail = '￮' }

vim.opt.list = true

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.autoindent = true

vim.opt.textwidth = 72
vim.opt.colorcolumn = '+0'

vim.opt.showcmd = true

vim.wo.number = true

vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.extensions.live_grep_args.live_grep_args, {})
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, {})

vim.g.gitblame_schedule_event = CursorHold
vim.g.gitblame_clear_event = CursorHoldI

vim.g.flog_permanent_default_opts = {
	format = "%as [%h] %cn: %s%d"
}

