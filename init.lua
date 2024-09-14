local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')
local lspconfig = require('lspconfig')
local cmp = require('cmp')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local luasnip = require('luasnip')
local lsp_signature = require('lsp_signature')
local ts = require('nvim-treesitter')
local ts_conf = require('nvim-treesitter.configs')
local ts_ctx = require('treesitter-context')
local rose_pine = require('rose-pine')
local palette = require('rose-pine.palette')
local plenary = require('plenary')
local harpoon = require('harpoon')

local config_dir = vim.fn.stdpath('config')

-- treesitter
ts_conf.setup({
	ensure_installed = all,
	highlight = {
		enable = true
	}
})

-- treesitter-context
ts_ctx.setup({
	enable = true,
	mode = 'topline',
})

-- completion
cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	}, {
		{ name = 'buffer' },
	})
})

-- LSP
local servers = {
	'clangd',
	'pylsp',
	'gopls',
	'zls',
}

local lsp_signature_cfg = {
	bind = true,
	handler_opts = {
		border = "none"
	}
}

for _, server in ipairs(servers) do
	lspconfig[server].setup {
		capabilities = capabilities,
		on_attach = function(client, bufnr)
			lsp_signature.on_attach(lsp_signature_cfg, bufnr)

			local opts = { noremap=true, silent=true, buffer = bufnr }
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
			vim.keymap.set('n', '<leader>re', vim.lsp.buf.rename, {})
			vim.keymap.set('n', '<leader>rf', vim.lsp.buf.references, {})
		end
	}
end

-- harpoon
harpoon.setup()

-- Telescope
telescope.load_extension('live_grep_args')

-- settings
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

vim.opt.wrap = false

vim.opt.showcmd = true

vim.opt.mouse = 'a'

vim.opt.termguicolors = false;

vim.wo.number = true
vim.wo.relativenumber = true

vim.g.mapleader = ' '

-- file explorer
vim.keymap.set('n', '<leader>fe', ':Ex<CR>', {})

-- harpoon
vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-s>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-e>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-c>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-g>", function() harpoon:list():select(4) end)

-- telescope
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.extensions.live_grep_args.live_grep_args, {})
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, {})

-- Git integration
vim.keymap.set('n', '<leader>gq', ':Git<CR>', {})
vim.keymap.set('n', '<leader>gg', ':Flog -all<CR>', {})
vim.keymap.set('n', '<leader>gd', ':Gdiff<CR>', {})
vim.keymap.set('n', '<leader>ga', ':Gw<CR>', {})
vim.keymap.set('n', '<leader>gc', ':G commit<CR>', {})
vim.keymap.set('n', '<leader>gs', ':G commit -s<CR>', {})

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', {})
vim.keymap.set('n', '<C-j>', '<C-w>j', {})
vim.keymap.set('n', '<C-k>', '<C-w>k', {})
vim.keymap.set('n', '<C-l>', '<C-w>l', {})

-- yanking/pasting
-- p pastes from yank register,
-- x cuts to yank register
-- thus, d now deletes lines whereas
-- x cuts them to be pasted later
vim.keymap.set('n', 'p', '"0p', {})
vim.keymap.set('n', 'P', '"0P', {})
vim.keymap.set('v', 'p', '"0p', {})
vim.keymap.set('v', 'P', '"0P', {})
vim.keymap.set('n', 'x', '"0x', {})
vim.keymap.set('v', 'x', '"0x', {})

vim.g.gitblame_schedule_event = CursorHold
vim.g.gitblame_clear_event = CursorHoldI

vim.g.flog_permanent_default_opts = {
	format = "%as [%h] %cn: %s%d"
}

-- rose-pine color scheme
-- needs to happen at the end, otherwise bad things happen
rose_pine.setup({
	variant = "auto",
	enable = {
		terminal = true
	},
	styles = {
		bold = true,
		italic = false,
		transparency = true
	},
	highlight_groups = {
		TreesitterContext = { bg = "surface" }
	},
	disable_background = true
})

vim.cmd.colorscheme("rose-pine")

