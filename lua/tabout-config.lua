require('tabout').setup {
	tabkey = '<Tab>',
	backwards_tabkey = '<S-Tab>',
	act_as_tab = true,
	act_as_shift_tab = true,
	enable_backwards = true,
	tabouts = {
		{ open = "'", close = "'" },
		{ open = '"', close = '"' },
		{ open = '`', close = '`' },
		{ open = '(', close = ')' },
		{ open = '[', close = ']' },
		{ open = '{', close = '}' }
	},
	exclude = {},
	ignore_beginning = true,
}
