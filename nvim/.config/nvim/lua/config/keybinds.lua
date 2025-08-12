-- This is my keymap file
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Let me move the cursor when in insert mode
vim.keymap.set("i", "<C-h>", "<left>")
vim.keymap.set("i", "<C-j>", "<down>")
vim.keymap.set("i", "<C-k>", "<up>")
vim.keymap.set("i", "<C-l>", "<right>")

vim.keymap.set("n", "<leader>e", ":Ex<CR>", {desc = "Open Netrw"})

vim.keymap.set("n", "<Esc>", ":noh<CR>", {desc = "Remove highlighting"})

vim.keymap.set("n", "<leader>q", ":q!<CR>", {desc = "[Q]uit file"})
vim.keymap.set("n", "<leader>w", ":w!<CR>", {desc = "[W]rite file"})
vim.keymap.set("n", "<leader>x", ":x!<CR>", {desc = "Save [x] quit file"})

vim.keymap.set("n", "<S-h>", ":tabp<CR>", {desc = "Previous tab"})
vim.keymap.set("n", "<S-l>", ":tabn<CR>", {desc = "Next tab"})

vim.keymap.set("n", "<leader>pv", ":vnew<CR>", {desc = "Split [p]ane [v]ertical"})
vim.keymap.set("n", "<leader>ph", ":new<CR>", {desc = "Split [p]ane [h]orizontal"})

vim.keymap.set('n', '<leader>h', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<leader>l', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<leader>j', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<leader>k', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
