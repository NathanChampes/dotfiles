---@diagnostic disable-next-line: undefined-global
local vim = vim

require("azerty-tweaks")

vim.opt.hlsearch = true

-- Better escape du terminal
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- C'est pour éviter d'utiliser les flèches en normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Pour le focus ctrl + hjkl
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Juste pour la gestion des buffers
vim.keymap.set("n", "<leader>bc", "<cmd>:bd <CR>", { desc = "Fermer le buffer actuel" })
vim.keymap.set("n", "<leader>bn", "<cmd>:bn <CR>", { desc = "On passe au prochain buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>:bp <CR>", { desc = "On passe au buffer précedent" })

-- Pour retourner vers oil.nvim
vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "J'ai bind le delete pour retourner vers oil.nvim" })

-- Pour toggle blame
vim.keymap.set("v", "<leader>lb", "<cmd>:GitBlameToggle <CR>", { desc = "On toggle le blame pour voir qui a commit" })

vim.keymap.set("n", "<leader>ct", function()
	require("cloak").toggle()
end, { desc = "Toggle Cloak" })
