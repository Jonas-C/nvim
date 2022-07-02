local actions = require 'telescope.actions'
require('telescope').setup({
	defaults = {
		prompt_prefix = ' ❯ ',
    selection_caret = '❯ ',
		mappings = {
			i = {
				['<esc>'] = actions.close,
				['<c-j>'] = actions.move_selection_next,
				['<c-k>'] = actions.move_selection_previous,
				['<s-up>'] = actions.cycle_history_prev,
				['<s-down>'] = actions.cycle_history_next,

			},
		},
		sorting_strategy = "ascending",
		layout_config = {
			horizontal = {
				prompt_position = 'top'
			}
		},
	},

})

require('telescope').load_extension('fzf')
