return {
	{
		"nvim-telescope/telescope.nvim",
		opts = {
			pickers = {
				diagnostics = {
					theme = "ivy",
					initial_mode = "normal",
					layout_config = {
						preview_cutoff = 9999,
					},
				},
			},
			defaults = {
				prompt_prefix = "   ",
				selection_caret = "  ",
				entry_prefix = "  ",
				initial_mode = "insert",
				selection_strategy = "reset",
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
						results_width = 0.8,
					},
					vertical = {
						mirror = false,
					},
					width = 0.87,
					height = 0.80,
					preview_cutoff = 120,
				},
				file_sorter = function(...)
					require("telescope.sorters").get_fuzzy_file(...)
				end,
				file_ignore_patterns = { "node_modules/*", "*.git/*", "*/tmp/*" },
				generic_sorter = function(...)
					require("telescope.sorters").get_generic_fuzzy_sorter(...)
				end,
			},
		},
		config = function(_, opts)
			require("telescope").setup(opts)
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			{
				"danielfalk/smart-open.nvim",
				dependencies = {
					"kkharji/sqlite.lua",
					"nvim-telescope/telescope-fzy-native.nvim",
				},
				config = function()
					require("telescope").load_extension("smart_open")
				end,
			},
		},
		keys = {
			{
				"<leader>ff",
				"<cmd>lua require('telescope').extensions.smart_open.smart_open({ cwd_only = true, filename_first = false })<CR>",
				desc = "telescope: find_files",
			},
			{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "telescope: buffers" },
			{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "telescope: live_grep" },
			{ "<leader>f;", "<cmd>Telescope resume<CR>", desc = "telescope: resume" },
			{ "<leader>fx", "<cmd>Telescope diagnostics<CR>", desc = "telescope: diagnostics" },
		},
		cmd = {
			"Telescope",
		},
	},
}
