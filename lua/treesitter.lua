require "nvim-treesitter.configs".setup {
	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = false,
	},
	matchup = {
		enable = true,
	},
	ensure_installed = {
		"bash",
		"c",
		"cmake",
		"dockerfile",
		"go",
		"gomod",
		"gowork",
		"help",
		"make",
		"toml",
		"typescript",
		"css",
		"graphql",
		"html",
		"lua",
		"javascript",
		"jsdoc",
		"json",
		"markdown",
		"python",
		"regex",
		"rust",
		"scala",
		"scss",
		"tsx",
		"yaml"
	},
	sync_install = false,
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},

	},
	indent = {
		enable = true

	},
	autotag = {
		enable = true
	},
	context_commentstring = {
		enable = true,
	},
}
