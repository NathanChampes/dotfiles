-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Pour naviguer entre le buffer et le tree enfait il faut utiliser ctrl par default
-- vim.keymap.set("n", "<leader>h", "<C-w>h", { silent = true, remap = true })
-- vim.keymap.set("n", "<leader>l", "<C-w>l", { silent = true, remap = true })
-- vim.keymap.set("n", "<leader>j", "<C-w>j", { silent = true, remap = true })
-- vim.keymap.set("n", "<leader>k", "<C-w>k", { silent = true, remap = true })

-- Pour naviguer dans le buffer
vim.keymap.set("n", "<leader>n", ":bn<cr>")
vim.keymap.set("n", "<leader>p", ":bp<cr>")
vim.keymap.set("n", "<leader>x", ":bd<cr>")
