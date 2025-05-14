-- Pour avoir le flash quand je copie
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- En gros c'est une auto command on check si ça ouvre un dossier alors neotree est ouvert et focus pour être plus rapide ;)
-- vim.api.nvim_create_autocmd("VimEnter", {
-- 	callback = function()
-- 		local arg = vim.fn.argv(0)
-- 		if arg and vim.fn.isdirectory(arg) == 1 then
-- 			require("neo-tree.command").execute({ action = "focus", source = "filesystem", position = "left" })
-- 		end
-- 	end,
-- })
