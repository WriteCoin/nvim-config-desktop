-- Строка состояния (дополнительная информация)
return {
	-- подсказка привязок, команд
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	-- Строка состояния (дополнительная информация)
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup()
		end,
	},
	-- {
	--     "nvim-tree/nvim-tree.lua",
	--     dependencies = {
	--         "nvim-tree/nvim-web-devicons", -- Необязательно, для иконок файлов
	--     },
	--     config = function()
	--         require("nvim-tree").setup()
	--     end,
	-- }
	-- Проводник файлов на боковой панели (neo-tree)
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},
		lazy = false, -- neo-tree will lazily load itself
		keys = {
			-- { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Toggle Neo-tree" },
			{ "<leader>e", "<cmd>Neotree filesystem reveal left<CR>", desc = "Toggle Neo-tree" },
			{ "<leader>ef", "<cmd>Neotree reveal<CR>", desc = "Reveal current file" },
		},
		config = function()
			require("neo-tree").setup({
				close_if_last_window = true, -- закрывать, если это последнее окно
				popup_border_style = "rounded",
				enable_git_status = true,
				enable_diagnostics = true,

				-- Файловая система
				filesystem = {
					filtered_items = {
						visible = true, -- скрытые файлы показаны
						hide_dotfiles = true, -- .gitignore и т.п. видны
					},
					follow_current_file = {
						enabled = true, -- автофокус на текущем файле
					},
					use_libuv_file_watcher = true, -- автообновление через uv
					-- Отключить следование Neo-tree за `cwd`
					bind_to_cwd = false,
				},
			})
		end,
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({})

			-- Пример: использование Alt+h/l для переключения буферов
			vim.keymap.set("n", "<A-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Предыдущий буфер" })
			vim.keymap.set("n", "<A-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Следующий буфер" })
			vim.keymap.set(
				"n",
				"<leader>bp",
				"<cmd>BufferLineTogglePin<CR>",
				{ desc = "Закрепить/открепить буфер" }
			)
			vim.keymap.set(
				"n",
				"<leader>bo",
				"<cmd>BufferLineCloseOthers<CR>",
				{ desc = "Закрыть все буферы, кроме текущего" }
			)
			vim.keymap.set(
				"n",
				"<leader>br",
				"<cmd>BufferLineCloseRight<CR>",
				{ desc = "Закрыть буферы справа" }
			)
			vim.keymap.set(
				"n",
				"<leader>bl",
				"<cmd>BufferLineCloseLeft<CR>",
				{ desc = "Закрыть буферы слева" }
			)
			vim.keymap.set(
				"n",
				"<leader>bc",
				"<cmd>BufferLinePick<CR>",
				{ desc = "Переключать буферы по подсказке" }
			)
		end,
	},
	-- Плагин к bufferline для дополнительных привязок по закрытию вкладок
	{
		"ojroques/nvim-bufdel",
		config = function()
			require("bufdel").setup({
				next = "tabs",
				quit = true, -- quit Neovim when last buffer is closed
			})

			vim.keymap.set("n", "<leader>bd", "<cmd>BufDel<CR>", { desc = "Закрыть буфер" })
			vim.keymap.set(
				"n",
				"<leader>baq",
				"<cmd>BufDel!<CR>",
				{ noremap = true, desc = "Закрыть буфер без сохранения изменений" }
			)
		end,
	},
	-- {
	-- 	"folke/noice.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {
	-- 		-- ваши настройки noice
	-- 	},
	-- 	dependencies = {
	-- 		"MunifTanjim/nui.nvim",
	-- 		-- nvim-notify нужен только если вы хотите использовать вид "notify"
	-- 		"rcarriga/nvim-notify",
	-- 	},
	-- 	config = function()
	-- 		require("noice").setup({
	-- 			cmdline = { enabled = false },
	-- 			messages = { enabled = false },
	-- 			notify = { enabled = true },
	-- 		})
	-- 	end,
	-- },
	{
		"mjmjm0101/quickui.nvim",
		lazy = false,
		config = function()
			require("quickui").setup({
				-- Переключение панели меню
				keymap = ",",
				-- Стиль границы (линия, двойная линия, круг, точки, пунктир и т.п.)
				border = "single",

				-- Устранить прозрачность окон
				-- Прозрачность от 0 до 100, число - как для панели, так и для меню, таблица - индивидуально
				-- По умолчанию 0 для панели, 40 - для меню
				winblend = { bar = 0, menu = 0 },

				-- Подавить все привязки, кроме тех, что определены для управления меню
				suppress_all_keys = true,

				-- Таблица различных меню
				menus = {
					{
						name = "&F Файл",
						items = {
							{ name = "&N Новый файл", cmd = ":enew<CR>", key = "<C-n>" },
							{ name = "&O Открыть", cmd = ":e ", key = "<C-o>" },
							{ name = "&S Сохранить", cmd = ":w<CR>", key = "<C-s>" },
							{ name = "separator" },
							{ name = "&Q Выйти", cmd = ":qa<CR>", key = "<C-q>", rtxt = "Ctrl-Q" },
						},
					},
					{
						name = "&E Правка",
						items = {
							{ name = "&U Отмена", cmd = "u", key = "<C-z>" },
							{ name = "&R Повтор", cmd = "<C-r>", key = "<C-r>", rtxt = "Ctrl-R" },
							{ name = "&C Копировать", cmd = '"+y', key = "<C-c>" },
							{ name = "&P Вставить", cmd = '"+p', key = "<C-v>" },
						},
					},
				},
			})
		end,
	},
}
