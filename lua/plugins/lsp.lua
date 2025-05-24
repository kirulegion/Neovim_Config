-- Ensure required plugins are installed
-- Install using a plugin manager like lazy.nvim or packer.nvim
local plugins = {
	"neovim/nvim-lspconfig",           -- LSP configuration
	"williamboman/mason.nvim",         -- Manage LSP servers
	"williamboman/mason-lspconfig.nvim", -- Bridge mason and lspconfig
	"hrsh7th/cmp-nvim-lsp",            -- LSP autocompletion
	"hrsh7th/nvim-cmp",                -- Completion engine
}

-- Initialize mason and mason-lspconfig
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "rust_analyzer", "tsserver", "pyright", "clangd" },
})

-- Setup nvim-cmp for autocompletion
local cmp = require("cmp")
cmp.setup({
	mapping = {
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
	sources = {
		{ name = "nvim_lsp" },
	},
})

-- LSP capabilities
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- LSP server configurations
local lspconfig = require("lspconfig")

-- Rust (rust-analyzer)
lspconfig.rust_analyzer.setup({
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {
			diagnostics = {
				enable = true,
			},
			checkOnSave = {
				command = "clippy",
			},
		},
	},
})

-- TypeScript/TSX/JavaScript/JSX (tsserver)
lspconfig.tsserver.setup({
	capabilities = capabilities,
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	settings = {
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
	},
})

-- Python (pyright)
lspconfig.pyright.setup({
	capabilities = capabilities,
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "workspace",
			},
		},
	},
})

-- C++ (clangd)
lspconfig.clangd.setup({
	capabilities = capabilities,
	filetypes = { "c", "cpp", "objc", "objcpp" },
	cmd = { "clangd", "--background-index" },
})

-- Keybindings for LSP
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
	end,
})

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = true,
	signs = true,
	update_in_insert = false,
})
