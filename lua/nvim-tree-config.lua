local mappings = {
	{ key = { "<C-k>" }, action = "" },
}

local TREE_WIDTH = 40

require("nvim-tree").setup({
	actions = {
		open_file = {
			resize_window = true
		}
	},
	reload_on_bufenter = true,
	update_focused_file = {
		enable = true,
	},
	view = {
		width = TREE_WIDTH,
		side = 'left',
		mappings = {
			list = mappings
		},
	},
	renderer = {
		highlight_git = true,
		icons = {
			git_placement = "after",
			glyphs = {
				git = {
					untracked = "M",
					unstaged  = "M",
					staged    = "A",
					deleted   = "D",
				},
			},
		},
	},
})
