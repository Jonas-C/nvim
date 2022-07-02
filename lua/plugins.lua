return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'akinsho/bufferline.nvim'
	use { 'kylechui/nvim-surround', config = function()
		require('nvim-surround').setup {}
	end }
	use 'ryanoasis/vim-devicons'
	use 'neovim/nvim-lspconfig'
	use 'kosayoda/nvim-lightbulb'
	use 'antoinemadec/FixCursorHold.nvim'
	use 'kyazdani42/nvim-web-devicons'
	use 'kyazdani42/nvim-tree.lua'
	use 'jose-elias-alvarez/null-ls.nvim'
	use 'jose-elias-alvarez/nvim-lsp-ts-utils'
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use 'akinsho/toggleterm.nvim'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'saadparwaiz1/cmp_luasnip'
	use 'nvim-telescope/telescope.nvim'
	use 'lewis6991/gitsigns.nvim'
	use 'ray-x/lsp_signature.nvim'
	use 'ray-x/cmp-treesitter'
	use 'windwp/nvim-ts-autotag'
	use 'windwp/nvim-autopairs'
	use 'tpope/vim-fugitive'
	use 'sindrets/diffview.nvim'
	use 'nvim-lualine/lualine.nvim'
	use 'folke/trouble.nvim'
	use 'styled-components/vim-styled-components'
	use 'norcalli/nvim-colorizer.lua'
	use 'navarasu/onedark.nvim'
	use 'JoosepAlviste/nvim-ts-context-commentstring'
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use 'L3MON4D3/LuaSnip'
	use 'petertriho/nvim-scrollbar'
	use 'folke/which-key.nvim'
	use 'weilbith/nvim-code-action-menu'
	use 'simrat39/rust-tools.nvim'
	use 'akinsho/flutter-tools.nvim'
	use 'j-hui/fidget.nvim'
	use 'phaazon/hop.nvim'
	use 'MunifTanjim/nui.nvim'
	use 'vuki656/package-info.nvim'
	use 'RRethy/vim-illuminate'
	use 'marko-cerovac/material.nvim'
	use 'abecodes/tabout.nvim'
	use 'rcarriga/nvim-notify'
	use 'andymass/vim-matchup'
	use 'lewis6991/impatient.nvim'
	use 'stevearc/dressing.nvim'
	use 'ghillb/cybu.nvim'
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}
	use 'romgrk/barbar.nvim'
	use 'EdenEast/nightfox.nvim'
	use 'rebelot/kanagawa.nvim'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'shaunsingh/moonlight.nvim'

end)
