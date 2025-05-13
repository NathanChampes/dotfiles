vim.opt.guicursor = ""
-- See `:help vim.opt`
vim.opt.number = true

-- Relative line parce que je trouve ça utile pour jump
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Bah en gros vu qu'il y a le mode dans statut on le répète pas
vim.opt.showmode = false

-- On fait en sorte que le presse papier soit global
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

vim.opt.breakindent = true

-- Ctrl z historique en gros
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.updatetime = 250

vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = false
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.inccommand = "split"

-- La ligne qui montre ou est le curseur
vim.opt.cursorline = false

-- Le nombre de ligne a garder au dessus et en dessous
vim.opt.scrolloff = 10

-- Empêche de quitter sans sauvegarder
vim.opt.confirm = true

-- Set current directory to the one passed as argument to nvim
if vim.fn.argc() > 0 then
	local first_arg = vim.fn.argv()[1]
	local stat = vim.loop.fs_stat(first_arg)

	if stat and stat.type == "directory" then
		vim.cmd("cd " .. vim.fn.fnameescape(first_arg))
	elseif stat and stat.type == "file" then
		vim.cmd("cd " .. vim.fn.fnameescape(vim.fn.fnamemodify(first_arg, ":h")))
	end
end
