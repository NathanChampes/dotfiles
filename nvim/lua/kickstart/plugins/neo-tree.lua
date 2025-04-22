return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		{ "<leader>e", ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
	},
	opts = function(_, opts)
		opts.filesystem = vim.tbl_deep_extend("force", opts.filesystem or {}, {
			window = {
				mappings = {
					["<leader>e"] = "close_window",
				},
			},
		})

		opts.window = vim.tbl_deep_extend("force", opts.window or {}, {
			mappings = {
				["J"] = "navigate_up",
				["K"] = {
					"set_root",
					desc = "CD into directory",
				},
			},
		})

		opts.event_handlers = {
			{
				event = "file_opened",
				handler = function()
					-- Fermer Neo-tree lorsqu'un fichier est ouvert
					require("neo-tree.command").execute({ action = "close" })
				end,
			},
		}

		return opts
	end,
}
