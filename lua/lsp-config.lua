local lspconfig = require("lspconfig")
local null_ls = require("null-ls")
local runtime_path = vim.split(package.path, ';')
local illuminate = require("illuminate")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local border = {
	{ "╭", "FloatBorder" }, { "─", "FloatBorder" }, { "╮", "FloatBorder" },
	{ "│", "FloatBorder" }, { "╯", "FloatBorder" }, { "─", "FloatBorder" },
	{ "╰", "FloatBorder" }, { "│", "FloatBorder" }
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or border
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local buf_map = function(bufnr, mode, lhs, rhs, opts)
	vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or { silent = true })
end
local on_attach = function(client, bufnr)
	vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
	vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
	vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
	vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
	vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
	vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
	vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
	vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
	vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
	vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
	vim.cmd("command! LspDiagLine lua vim.diagnostic.open_float()")
	vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")
	buf_map(bufnr, "n", "gd", ":LspDef<CR>")
	buf_map(bufnr, "n", "gr", ":LspRename<CR>")
	buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>")
	buf_map(bufnr, "n", "K", ":LspHover<CR>")
	buf_map(bufnr, "n", "[a", ":LspDiagPrev<CR>")
	buf_map(bufnr, "n", "]a", ":LspDiagNext<CR>")
	buf_map(bufnr, "n", "ga", ":CodeActionMenu<CR>")
	buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>")
	buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>")
	illuminate.on_attach(client)
	if client.resolved_capabilities.document_formatting then
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	end
end

lspconfig.tsserver.setup({
	on_attach = function(client, bufnr)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
		local ts_utils = require("nvim-lsp-ts-utils")
		ts_utils.setup({})
		ts_utils.setup_client(client)
		buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
		buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
		buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")
		on_attach(client, bufnr)
	end
})

lspconfig.sumneko_lua.setup({
	on_attach = on_attach,
	settings = {
		Lua = {
			runtime = { version = 'LuaJIT', path = runtime_path },
			diagnostics = { globals = { 'vim' } },
			workspace = {
				library = {
					vim.fn.expand('$VIMRUNTIME/lua'),
					vim.fn.stdpath('config') .. '/lua'
				}
			}
		},
		telemetry = { enable = false }
	}
})

lspconfig.cssls.setup({
	filetypes = { "css", "scss", "less", "tsx", "ts", "js", "jsx" },
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		css = { validate = true },
		scss = { validate = true },
		less = { validate = true },
		tsx = { validate = true },

	},
})

lspconfig.eslint.setup {}

lspconfig.jsonls.setup {
	capabilities = capabilities,
}


lspconfig.html.setup {
	capabilities = capabilities,
}

lspconfig.gopls.setup {
	capabilities = capabilities,
}

lspconfig.graphql.setup {}

lspconfig.vimls.setup {}


require "rust-tools".setup({
	tools = {
		autoSetHints = true,
		hover_with_actions = true,
		inlay_hints = {
			show_parameter_hints = true,
			parameter_hints_prefix = "",
			other_hints_prefix = ""
		}
	},
	server = {
		on_attach = on_attach,
		settings = {
			["rust-analyzer"] = {
				assist = {
					importEnforceGranularity = true,
					importPrefix = "crate"
				},
				cargo = { allFeatures = true },
				checkOnSave = {
					-- default: `cargo check`
					command = "clippy"
				}
			},
			inlay_hints = {
				lifetimeEllisionHints = {
					enable = true,
					useParameterNames = true
				}
			}
		}
	}
})

require('flutter-tools').setup {
	lsp = { on_attach = on_attach },
	dev_log = { enabled = true }
}

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.prettier
	},
	on_attach = on_attach
})
