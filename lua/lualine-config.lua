require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		-- component_separators = { left = '', right = ''},
		-- section_separators = { left = '', right = ''},
		component_separators = '|',
		section_separators = { left = '', right = '' },
		disabled_filetypes = { 'NvimTree' },
		always_divide_middle = true,
		globalstatus = false,
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = {},
		lualine_c = {
			{
				'diagnostics',
				sections = { 'error', 'warn', 'info', 'hint' },
				always_visible = true,
			}
		},
		lualine_x = { 'none' },
		lualine_y = { 'branch', 'diff' },
		lualine_z = {}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
	winbar = {
		lualine_a = { { 'filename', path = 1 } },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
	inactive_winbar = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
	extensions = {}
}
