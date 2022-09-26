require('bufferline').setup {
	options = {
		separator_style = "thick",
		diagnostics = "nvim_lsp",
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "left"
			}
		}
	}
}
