return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        json = { "prettier" },
        markdown = { "prettier" },
        lua = { "stylua" },
      },
      formatters = {
        prettier = {
          prepend_args = { "--tab-width", "2" },
        },
      },
    })

    -- Manual formatting keymap
    vim.keymap.set({ "n", "v" }, "<leader>ff", function()
      require("conform").format({ async = true, lsp_fallback = true })
    end, { desc = "Format buffer" })
  end
}
