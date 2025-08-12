return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<C-u>"] = false,
						["<C-d>"] = false,
					},
				},
			},
		})

		-- Telescope keymaps
		vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files)
		vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep)
		vim.keymap.set("n", "<leader>sb", require("telescope.builtin").buffers)
		vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags)
	end,
}
