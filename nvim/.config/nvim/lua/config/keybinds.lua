-- This is my keymap file
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Let me move the cursor when in insert mode
vim.keymap.set("i", "<C-h>", "<left>")
vim.keymap.set("i", "<C-j>", "<down>")
vim.keymap.set("i", "<C-k>", "<up>")
vim.keymap.set("i", "<C-l>", "<right>")

vim.keymap.set("n", "<leader>e", ":Ex<CR>", { desc = "Open Explore" })

vim.keymap.set("n", "<Esc>", function()
	vim.cmd("nohlsearch")
	return "<Esc>"
end)
vim.keymap.set("n", "<leader>q", function()
	vim.cmd("q!")
end, { desc = "Quit Buffer" })
vim.keymap.set("n", "<leader>w", function()
	vim.cmd("w!")
end, { desc = "Write Buffer" })
vim.keymap.set("n", "<leader>x", function()
	vim.cmd("x!")
end, { desc = "Write and Quit Buffer" })

-- vim.keymap.set("n", "<S-h>", vim.cmd("tabp"), {desc = "Previous tab"})
-- vim.keymap.set("n", "<S-l>", vim.cmd("tabn"), {desc = "Next tab"})

vim.keymap.set("n", "<leader>pv", function()
	vim.cmd.vnew()
end, { desc = "Split Pane Vertical" })
vim.keymap.set("n", "<leader>ph", function()
	vim.cmd.new()
end, { desc = "Split Pane Horizontal" })

vim.keymap.set("n", "<leader>h", "<C-w><C-h>", { desc = "Focus Left" })
vim.keymap.set("n", "<leader>l", "<C-w><C-l>", { desc = "Focus Right" })
vim.keymap.set("n", "<leader>j", "<C-w><C-j>", { desc = "Focus Bottom" })
vim.keymap.set("n", "<leader>k", "<C-w><C-k>", { desc = "Focus Top" })

-- Telescope keymaps
vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "Search Files" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "Live Grep" })
vim.keymap.set("n", "<leader>sb", require("telescope.builtin").buffers, { desc = "Search Buffers" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "Help Tags" })

-- Terminal
-- Detect OS
local is_windows = vim.loop.os_uname().version:match("Windows")
local is_mac = vim.loop.os_uname().sysname == "Darwin"

if is_windows then
  -- PowerShell 7+
  vim.opt.shell = "pwsh"
  vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""
elseif is_mac then
  -- Prefer zsh if available
  if vim.fn.executable("zsh") == 1 then
    vim.opt.shell = "zsh"
  else
    vim.opt.shell = "bash"
  end
else
  -- Linux or anything else
  vim.opt.shell = "bash"
end
vim.keymap.set("n", "<space>t", function()
	vim.cmd.new()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 10)
end)

-- Manual formatting keymap
vim.keymap.set({ "n", "v" }, "<leader>ff", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format buffer" })

-- LSP keymaps (only when LSP is active)
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts, { desc = "Go To Definition" })
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts, { desc = "Go To References" })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts, { desc = "Hover Preview" })
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts, { desc = "Rename Buffer" })
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts, { desc = "Code Action" })
	end,
})

-- Whichkey
vim.keymap.set({ "n", "v" }, "<leader>?", function()
	require("which-key").show({ global = false })
end, { desc = "Local Keymaps (which-key)" })
