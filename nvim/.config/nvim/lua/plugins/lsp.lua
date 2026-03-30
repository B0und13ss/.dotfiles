return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"clangd",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "mason-lspconfig.nvim", "saghen/blink.cmp" },
		config = function()
			local original_capabilities = vim.lsp.protocol.make_client_capabilities()

      local capabilities = require('blink.cmp').get_lsp_capabilities(original_capabilities)

			-- Configure LSP servers using the new vim.lsp.config API
			local servers = { "clangd" }
			for _, lsp in ipairs(servers) do
				vim.lsp.config(lsp, {
					capabilities = capabilities,
				})
				vim.lsp.enable(lsp)
			end
		end,
	},
}
