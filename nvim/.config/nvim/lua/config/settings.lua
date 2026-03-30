vim.opt.tabstop = 2                   --tab width of 2
vim.opt.softtabstop = 2               --tab width of 2
vim.opt.shiftwidth = 2                --tab width of 2
vim.opt.expandtab = true              --make tabs spaces
vim.opt.smartindent = true            --indent properly
vim.opt.breakindent = true            --wrapped lines will preserve the indent of its parent line
vim.autoindent = true                 --keep indent from previous line
vim.opt.smarttab = true               --rather than deleteing spaces, delete whole tabs

vim.opt.textwidth = 120 -- or your desired maximum line length
vim.opt.wrap = true                    --word wrap
vim.opt.linebreak = true                    --word wrap

vim.opt.showmode = false              --hide mode since it is in lualine
vim.opt.showmode = false              --hide mode since it is in lualine
vim.opt.cmdheight = 1                 
vim.opt.mouse = 'a'
vim.opt.undofile = true               --store undo history
vim.opt.termguicolors = true

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'   --use system clipboard after neovim starts up
end)

vim.opt.number = true                 --line numbers
vim.opt.relativenumber = true         --relative line numbers
vim.opt.scrolloff = 10                --keep n number of lines on the screen when scrolling
vim.opt.cursorline = true

vim.g.have_nerd_font = true
vim.opt.hlsearch = true

vim.opt.ignorecase = true             --search any case
vim.opt.smartcase = true              --when using a caps, search using specific case
vim.opt.signcolumn = "yes"            --always show sign column for lsp warnings / errors

vim.opt.splitright = true             --split right by default
vim.opt.splitbelow = true             --split below by default

-- highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.diagnostic.config({
  virtual_text = {
    prefix = '●',
    spacing = 4,
  },
  signs = false,
})

vim.cmd.colorscheme("monokai-pro") 

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

-- Monokai Pro Palette for Custom Colors
vim.api.nvim_set_hl(0, "CustomRed", { fg = "#ff6188" })
vim.api.nvim_set_hl(0, "CustomOrange", { fg = "#fc9867" })
vim.api.nvim_set_hl(0, "CustomGreen", { fg = "#a9dc76" })
vim.api.nvim_set_hl(0, "CustomYellow", { fg = "#ffd866" })
vim.api.nvim_set_hl(0, "CustomBlue", { fg = "#fc9867" })
vim.api.nvim_set_hl(0, "CustomMagenta", { fg = "#ab9df2" })
vim.api.nvim_set_hl(0, "CustomCyan", { fg = "#78dce8" })
vim.api.nvim_set_hl(0, "CustomWhite", { fg = "#fcfcfa" })
vim.api.nvim_set_hl(0, "CustomGray", { fg = "#8B888F" })

-- Syntax fixes for monokai pro
vim.api.nvim_set_hl(0, "@lsp.type.class.c", { link = "CustomCyan" })
vim.api.nvim_set_hl(0, "cType", { link = "CustomCyan" })
vim.api.nvim_set_hl(0, "@cTypedef", { link = "CustomRed" })
vim.api.nvim_set_hl(0, "cStatement", { link = "CustomRed" })
vim.api.nvim_set_hl(0, "@lsp.type.parameter.c", { link = "CustomOrange" })
vim.api.nvim_set_hl(0, "@cDeref", { link = "CustomRed" })
vim.api.nvim_set_hl(0, "@cNullColor", { link = "CustomGray" })

