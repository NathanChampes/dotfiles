-- NOTE: :tutor c'est cool
-- Bon la en gros on dit que le <leader> est espace
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- J'ai nerd font d'installer donc je met a true
vim.g.have_nerd_font = true

-- [[ Setting options ]]
require("options")

-- [[ Basic Keymaps ]]

require("keymaps")

-- [[ Auto command ]]

require("auto-cmd")

-- [[ Lazy Manager ]]

require("lazy-manager")

-- [[ Configure and install plugins ]]
require("lazy-plugins")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
