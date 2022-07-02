local palette = require('onedark.palette')
local cfg = vim.g.onedark_config
require('onedark').setup {
	style = 'warmer',
	highlights = {
		NvimTreeFolderName = { fg = '#abb2bf' },
	},
}
