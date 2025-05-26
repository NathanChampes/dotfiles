---@diagnostic disable-next-line: undefined-global
local vim = vim

-- Bon la en gros on dit que le <leader> est espace
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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
