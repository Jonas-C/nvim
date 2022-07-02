local _cmp, cmp = pcall(require, "cmp")
local lspconfig = require('lspconfig')

if not _cmp then
	return
end

-- local servers = { 'rust_analyzer', 'pyright', 'tsserver' }
-- for _, lsp in ipairs(servers) do
-- 	lspconfig[lsp].setup {
-- 		-- on_attach = my_custom_on_attach,
-- 		-- capabilities = capabilities,
-- 	}
-- end

local kinds = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "ﰕ",
	Field = "ﰠ",
	Variable = "",
	Class = "ﴯ",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "塞",
	Value = "",
	Enum = "",
	Keyword = "廓",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "פּ",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

cmp.setup {
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end
	},
	experimental = {
		ghost_text = true,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	completion = {
		completeopt = "menu,menuone,noinsert",

	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(_, vim_item)
			vim_item.menu = vim_item.kind
			vim_item.kind = kinds[vim_item.kind]

			return vim_item
		end,
	},
	mapping = {
		["<C-j>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			end
		end, { "i", "s", "c" }),
		["<C-k>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			end
		end, { "i", "s", "c" }),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<S-j"] = cmp.mapping(cmp.mapping.select_next_item()),
		["<S-k"] = cmp.mapping(cmp.mapping.select_prev_item()),
		["<C-q>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm(),
		-- ["<CR>"] = cmp.mapping(function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.confirm({ cmp.ConfirmBehavior.Replace, select = false })
		-- 	else
		-- 		fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
		-- 	end
		-- end, { "i", "s", "c" }),
		-- ["<CR>"] = cmp.mapping(function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.complete()
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, { "i", "s", "c" }
		-- )
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "path" },
		{ name = "buffer" },
	},
	-- preselect = cmp.PreselectMode.None,
}

cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	},
		{
			{ name = "cmdline" },
		}),
})
