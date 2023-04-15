local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<space>E", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
vim.api.nvim_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
vim.api.nvim_set_keymap("n", "<space>ac", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

local formatting_augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local enable_autoformatting = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = formatting_augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = formatting_augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ bufnr = bufnr, async = true })
			end,
		})
	end
end

local on_attach = function(client, buffer_number)
	vim.api.nvim_buf_set_option(buffer_number, "omnifunc", "v:lua.vim.lsp.omnifunc")
	vim.api.nvim_buf_set_keymap(buffer_number, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(buffer_number, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(buffer_number, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(buffer_number, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(buffer_number, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.api.nvim_buf_set_keymap(buffer_number, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.api.nvim_buf_set_keymap(buffer_number, "v", "<space>gq", "<cmd>lua require('lsp').format_range()<CR>", opts)
	vim.api.nvim_buf_set_keymap(
		buffer_number,
		"n",
		"<space>gq",
		"<cmd>lua vim.lsp.buf.format({async = true})<CR>",
		opts
	)
	vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

	enable_autoformatting(client, buffer_number)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = { "pyright", "tsserver", "terraformls", "tflint", "clojure_lsp" }
for _, lsp in pairs(servers) do
	require("lspconfig")[lsp].setup({ on_attach = on_attach, capabilities = capabilities })
end

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require("lspconfig").lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = runtime_path,
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

local null_ls = require("null-ls")
local command_resolver = require("null-ls.helpers.command_resolver")

null_ls.setup({
	sources = {
		null_ls.builtins.code_actions.shellcheck,
		null_ls.builtins.diagnostics.shellcheck,
		null_ls.builtins.formatting.shellharden,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.diagnostics.gitlint,
		-- null_ls.builtins.diagnostics.codespell,

		null_ls.builtins.code_actions.eslint,
		null_ls.builtins.formatting.eslint,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.formatting.prettier,
	},
	on_attach = function(client, bufnr)
		enable_autoformatting(client, bufnr)
	end,
})

local cmp = require("cmp")

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-\\>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp", group_index = 1 },
	}, {
		{ name = "buffer", group_index = 2 },
	}),
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

M = {}

M.format_range = function()
	local start = vim.api.nvim_buf_get_mark(0, "<")
	local finish = vim.api.nvim_buf_get_mark(0, ">")
	vim.lsp.buf.range_formatting({}, start, finish)
end

return M
