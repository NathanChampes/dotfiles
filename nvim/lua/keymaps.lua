vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- WARNING: A CHANGER
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Better escape du terminal
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

-- Juste un petit raccourci pour save
-- Pas forcément le mieux de garder cette habitude donc je le désactive
-- vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Fait en sorte que Ctrl + S sauvegarde" })
-- vim.keymap.set("i", "<C-s>", "<Esc><cmd>w<CR>", { desc = "Fait en sorte que Ctrl + S sauvegarde" })

-- Juste parce que les claviers français c'est un peu chiant pour les déplacement rapide
vim.keymap.set("n", "&", "1")
vim.keymap.set("n", "é", "2")
vim.keymap.set("n", '"', "3")
vim.keymap.set("n", "'", "4")
vim.keymap.set("n", "(", "5")
vim.keymap.set("n", "-", "6")
vim.keymap.set("n", "è", "7")
vim.keymap.set("n", "_", "8")
vim.keymap.set("n", "ç", "9")
vim.keymap.set("n", "à", "0")

vim.keymap.set("v", "&", "1")
vim.keymap.set("v", "é", "2")
vim.keymap.set("v", '"', "3")
vim.keymap.set("v", "'", "4")
vim.keymap.set("v", "(", "5")
vim.keymap.set("v", "-", "6")
vim.keymap.set("v", "è", "7")
vim.keymap.set("v", "_", "8")
vim.keymap.set("v", "ç", "9")
vim.keymap.set("v", "à", "0")

-- Juste pour la gestion des buffers
vim.keymap.set("n", "<leader>bc", "<cmd>:bd <CR>", { desc = "Fermer le buffer actuel" })
vim.keymap.set("n", "<leader>bn", "<cmd>:bn <CR>", { desc = "On passe au prochain buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>:bp <CR>", { desc = "On passe au buffer précedent" })

-- Pour retourner vers oil.nvim
vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "J'ai bind le delete pour retourner vers oil.nvim" })

-- Pour toggle blame
vim.keymap.set("n", "<leader>lb", "<cmd>:GitBlameToggle <CR>", { desc = "On toggle le blame pour voir qui a commit" })
