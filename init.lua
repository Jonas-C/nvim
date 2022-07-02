vim.o.syntax = 'on'
vim.o.nu = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.mouse = 'a'
vim.o.hidden = true
vim.o.termguicolors = true
vim.o.clipboard = 'unnamed'
vim.o.splitright = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.scl = 'yes:2'
-- vim.g.winbar = '%f'
-- vim.g.laststatus = 3
vim.g.cursorhold_updatetime = 100
vim.g.nvcode_termcolors = 256
vim.g.mapleader = ','
vim.g.border_style = 'rounded'


local keymap = vim.keymap.set

keymap('n', '<Leader>p', ':Telescope find_files<CR>', { desc = 'Find files...' })
keymap('n', '<Leader>f', ':Telescope live_grep<CR>', { desc = 'Find strings...' })
keymap('n', '<Leader>F', ':Telescope grep_string<CR>', { desc = 'Find current word' })
keymap('n', '<Leader>q', ':Telescope resume<CR>', { desc = 'Resume the previous Telescope picker' })
keymap('n', 'tt', '<cmd> exe v:count1 . "ToggleTerm"<CR>',
	{ desc = 'Toggle the floating terminal', silent = true })
keymap('t', 'tt', '<cmd> exe v:count1 ."ToggleTerm"<CR>',
	{ desc = 'Untoggle the floating terminal', silent = true })
keymap('n', '<Leader>e', '<cmd> NvimTreeFocus<CR>', { desc = 'Toggle NvimTree' })
keymap('n', '<esc><esc>', ':noh<CR>', { desc = 'Remove highlights' })
keymap('n', '<S-Tab>', '<cmd> BufferPick<CR>', { desc = 'Jump to buffer by key' })
keymap('n', '<Leader>s', ':w<CR>', { desc = 'Save the file' })
keymap('n', '<Leader>w', ':BufferClose<CR>', { desc = 'Close the active buffer' })
keymap('', '<C-j>', '5j', { desc = 'Go down five lines' })
keymap('', '<C-k>', '5k', { desc = 'Go up five lines' })
keymap('', '<Leader>h', ':HopWord<CR>', { desc = 'Magic word picking' })
keymap('', '<Leader>gg', ':lua DiffviewToggle()<cr>', { desc = 'Show git diff' })
keymap('', ' ', '/', { desc = 'Easy search' })

vim.cmd('cabb Wq wq')
vim.cmd('cabb Qa qa')
vim.cmd('cabb WQ wq')
vim.cmd('cabb QA qa')


require("plugins")
require("functions")
require("nvim-autopairs").setup {}
require("toggleterm-config")
require("completion")
require("barbar")
require("nvim-tree-config")
require("lualine-config")
require("telescope-config")
require("trouble-config")
require("treesitter")
require("lsp-config")
require("lightbulb-config")
require("gitsigns-config")
require("onedark-config")
require("lsp_signature-config")
require("nvim-scrollbar-config")
require("flutter-tools-config")
require("rust-tools-config")
require("fidget-config")
require("hop-config")
require("package-info-config")
require("colorizer-config")
require("tabout-config")
require("impatient-config")
require('cybu-config')
require('mason').setup {}
require('mason-lspconfig').setup {}
require('nvim-surround').setup {}
require('Comment').setup {}
-- require('material-config')
-- vim.g.material_style = 'darker'
-- require('material').setup({
-- 	lualine_style = 'default',
-- })
-- vim.cmd 'colorscheme material'
vim.cmd [[colorscheme onedark]]
