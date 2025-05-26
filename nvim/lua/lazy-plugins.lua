---@diagnostic disable-next-line: undefined-global
local vim = vim

require("lazy").setup({
	"tpope/vim-sleuth",
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	{
		"kdheepak/lazygit.nvim",
		event = "VimEnter",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
	{
		"numToStr/Comment.nvim",
		opts = {},
	},
	-- {
	-- 	"folke/which-key.nvim",
	-- 	event = "VimEnter",
	-- 	opts = {
	-- 		delay = 0,
	-- 		icons = {
	-- 			mappings = vim.g.have_nerd_font,
	-- 			keys = vim.g.have_nerd_font and {} or {
	-- 				Up = "<Up> ",
	-- 				Down = "<Down> ",
	-- 				Left = "<Left> ",
	-- 				Right = "<Right> ",
	-- 				C = "<C-…> ",
	-- 				M = "<M-…> ",
	-- 				D = "<D-…> ",
	-- 				S = "<S-…> ",
	-- 				CR = "<CR> ",
	-- 				Esc = "<Esc> ",
	-- 				ScrollWheelDown = "<ScrollWheelDown> ",
	-- 				ScrollWheelUp = "<ScrollWheelUp> ",
	-- 				NL = "<NL> ",
	-- 				BS = "<BS> ",
	-- 				Space = "<Space> ",
	-- 				Tab = "<Tab> ",
	-- 				F1 = "<F1>",
	-- 				F2 = "<F2>",
	-- 				F3 = "<F3>",
	-- 				F4 = "<F4>",
	-- 				F5 = "<F5>",
	-- 				F6 = "<F6>",
	-- 				F7 = "<F7>",
	-- 				F8 = "<F8>",
	-- 				F9 = "<F9>",
	-- 				F10 = "<F10>",
	-- 				F11 = "<F11>",
	-- 				F12 = "<F12>",
	-- 			},
	-- 		},
	-- 		spec = {
	-- 			{ "<leader>f", group = "Find" },
	-- 			{ "<leader>t", group = "Trouble" },
	-- 			{ "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
	-- 		},
	-- 	},
	-- },
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
			vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find keymaps" })
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>fs", builtin.builtin, { desc = "Find select telescope" })
			vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find Word" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find by grep" })
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Find diagnostics" })
			vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Find resume" })
			vim.keymap.set("n", "<leader>f.", function()
				require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
			end, { desc = "Find hidden and gitignored files" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find in buffers" })

			vim.keymap.set("n", "<leader>sb", function()
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "/ Fuzzily search in current buffer" })

			vim.keymap.set("n", "<leader>s/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "Search / in Open Files" })

			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "Search Neovim files" })
		end,
	},

	-- LSP Plugins
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", opts = {} },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			"saghen/blink.cmp",
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("grn", vim.lsp.buf.rename, "Rename")

					map("gra", vim.lsp.buf.code_action, "Goto Code Action", { "n", "x" })

					map("grr", require("telescope.builtin").lsp_references, "Goto References")

					map("gri", require("telescope.builtin").lsp_implementations, "Goto Implementation")

					map("grd", require("telescope.builtin").lsp_definitions, "Goto Definition")

					-- WARN: This is not Goto Definition, this is Goto Declaration.
					--  For example, in C this would take you to the header.
					map("grD", vim.lsp.buf.declaration, "Goto Declaration")

					map("gO", require("telescope.builtin").lsp_document_symbols, "Open Document Symbols")

					map("gW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Open Workspace Symbols")

					map("grt", require("telescope.builtin").lsp_type_definitions, "Goto Type Definition")

					local function client_supports_method(client, method, bufnr)
						if vim.fn.has("nvim-0.11") == 1 then
							return client:supports_method(method, bufnr)
						else
							return client.supports_method(method, { bufnr = bufnr })
						end
					end

					-- ça c'est super
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if
						client
						and client_supports_method(
							client,
							vim.lsp.protocol.Methods.textDocument_documentHighlight,
							event.buf
						)
					then
						local highlight_augroup =
							vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
							end,
						})
					end
				end,
			})

			vim.diagnostic.config({
				severity_sort = true,
				float = { border = "rounded", source = "if_many" },
				underline = { severity = vim.diagnostic.severity.ERROR },
				signs = vim.g.have_nerd_font and {
					text = {
						[vim.diagnostic.severity.ERROR] = "󰅚 ",
						[vim.diagnostic.severity.WARN] = "󰀪 ",
						[vim.diagnostic.severity.INFO] = "󰋽 ",
						[vim.diagnostic.severity.HINT] = "󰌶 ",
					},
				} or {},
				virtual_text = {
					source = "if_many",
					spacing = 2,
					format = function(diagnostic)
						local diagnostic_message = {
							[vim.diagnostic.severity.ERROR] = diagnostic.message,
							[vim.diagnostic.severity.WARN] = diagnostic.message,
							[vim.diagnostic.severity.INFO] = diagnostic.message,
							[vim.diagnostic.severity.HINT] = diagnostic.message,
						}
						return diagnostic_message[diagnostic.severity]
					end,
				},
			})

			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							workspace = {
								checkThirdParty = false,
								library = {
									[vim.env.VIMRUNTIME] = true,
									["${3rd}/luv/library"] = true,
									["${3rd}/busted/library"] = true,
									[vim.fn.expand("~/.config/nvim/lua")] = true,
								},
								ignoreDir = {
									".git",
									"node_modules",
									"site",
									"pack",
									"lazy",
									"opt",
									"plugged",
									"backups",
								},
								maxPreload = 2000,
								preloadFileSize = 100,
							},
							telemetry = { enable = false },
						},
					},
				},
			}
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua",
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				ensure_installed = {},
				automatic_installation = false,
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},

	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>bf",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "Buffer format",
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				local disable_filetypes = { c = true, cpp = true }
				if disable_filetypes[vim.bo[bufnr].filetype] then
					return nil
				else
					return {
						timeout_ms = 500,
						lsp_format = "fallback",
					}
				end
			end,
			formatters_by_ft = {
				lua = { "stylua" },
			},
		},
	},

	{
		"saghen/blink.cmp",
		event = "VimEnter",
		version = "1.*",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				version = "2.*",
				build = (function()
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {},
				opts = {},
			},
			"folke/lazydev.nvim",
		},
		opts = {
			keymap = {
				preset = "default",
			},

			appearance = {
				nerd_font_variant = "mono",
			},
			completion = {
				-- <c-space> Pour afficher ou cacher la documentation
				documentation = { auto_show = true, auto_show_delay_ms = 500 },
			},

			sources = {
				default = { "lsp", "path", "snippets", "lazydev" },
				providers = {
					lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
				},
			},

			snippets = { preset = "luasnip" },

			fuzzy = { implementation = "lua" },

			signature = { enabled = true },
		},
	},

	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup({ n_lines = 500 })
			require("mini.surround").setup()
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs",
		dependencies = { "OXY2DEV/markview.nvim" },
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"diff",
				"html",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"query",
				"vim",
				"vimdoc",
			},
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = { enable = true, disable = { "ruby" } },
		},
	},

	require("kickstart.plugins.debug"),
	-- J'aime pas trop utiliser neo-tree
	-- require("kickstart.plugins.neo-tree"),
	require("kickstart.plugins.indent_line"),
	require("kickstart.plugins.lint"),
	require("kickstart.plugins.autopairs"),
	require("kickstart.plugins.gitsigns"),

	{ import = "custom.plugins" },
}, {
	ui = {
		icons = vim.g.have_nerd_font and {} or {
			cmd = "",
			config = "",
			event = "",
			ft = "",
			init = "",
			keys = "",
			plugin = "",
			runtime = "",
			require = "",
			source = "",
			start = "",
			task = "",
			lazy = "",
		},
	},
})
