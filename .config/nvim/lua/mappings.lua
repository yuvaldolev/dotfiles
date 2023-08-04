-- Leader key.
vim.g.mapleader = " "

-- Open file explorer.
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- Center each search result to the middle of the screen.
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Smart way to move between windows.
vim.keymap.set({"n", "v", "s", "o"}, "<C-j>", "<C-W>j")
vim.keymap.set({"n", "v", "s", "o"}, "<C-k>", "<C-W>k")
vim.keymap.set({"n", "v", "s", "o"}, "<C-h>", "<C-W>h")
vim.keymap.set({"n", "v", "s", "o"}, "<C-l>", "<C-W>l")

-- Scrolling.
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Remap VIM 0 to first non-blank character.
vim.keymap.set({"n", "v", "s", "o"}, "0", "^")

-- Move lines.
vim.keymap.set("n", "<S-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<S-k>", ":m .-2<CR>==")
vim.keymap.set("v", "<S-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<S-k>", ":m '<-2<CR>gv=gv")

-- Copy to system clipboard.
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Replace without loosing the pasted text.
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Delete to null register.
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
