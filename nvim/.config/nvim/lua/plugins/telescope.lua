return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  dependencies = { 
    "nvim-lua/plenary.nvim",
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<C-u>"] = false,
          ["<C-d>"] = false
        }
      }
    }
  }
}
