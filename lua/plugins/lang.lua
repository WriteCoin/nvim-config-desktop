return {
	-- Плагин перевода, базирующийся на внешних средствах, в т.ч. Translate Shell
	{
		"uga-rosa/translate.nvim",
		config = function()
			require("translate").setup({
				default = {
					-- Используется консольная программа Translate Shell, ее необходимо установить в системе
					command = "translate_shell",
					output = "insert",
				},
				preset = {
					output = {
						-- окно занимает всю ширину редактора и никак не настраивается
						split = {
							append = true,
							base = "bottom",
							position = "bottom",
							min_size = 5,
							max_size = 0.5,
							off = -1,
						},
						-- Вставляется со слишком большими отступами от исходной позиции переводимого текста
						-- Вставляется в конец строки при любом раскладе, непонятно, как настроить
						insert = {
							append = true,
							base = "bottom",
							off = 0,
						},
						-- Придется использовать метод регистров, копирование и вставка
						register = {
							name = "a",
						},
					},
				},
			})

			-- Привязка для визуального режима
			vim.keymap.set("v", "<leader>tw", ":Translate RU -output=split<CR>", {
				desc = "Перевести и вставить в окне с сохранением позиции буфера",
			})
			vim.keymap.set(
				"v",
				"<leader>tr",
				":Translate RU -output=register<CR>",
				{ desc = "Перевести и вставить в регистр" }
			)

			vim.keymap.set(
				"v",
				"<leader>ti",
				":Translate RU -output=insert<CR>",
				{ desc = "Перевести и вставить на следующей строке в буфере" }
			)

			vim.keymap.set(
				"v",
				"<leader>tf",
				":Translate RU -output=floating<CR>",
				{ desc = "Перевести и показать перевод в плавающем окне" }
			)
		end,
	},
}
