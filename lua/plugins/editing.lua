return {
	-- выравнивание строк
	{
		"junegunn/vim-easy-align",
		config = function()
			vim.api.nvim_set_keymap("x", "ga", "<Plug>(EasyAlign)", {})
			vim.api.nvim_set_keymap("n", "ga", "<Plug>(EasyAlign)", {})
		end,
	},
	-- позволяет повторять сложные действия `vim-sexp` с помощью команды `.`
	{
		"tpope/vim-repeat",
		event = "VeryLazy",
	},
	-- Комментирование в версии 0.13 (`gcc`, `v<leader>gc`) добавлено по умолчанию (плагин `Comment.nvim` не обязателен)
	-- Автоматическое добавление закрывающей скобки (как в редакторах VS Code и IDE)
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	},
	-- Дополнительные действия с оборачиванием синтаксических элементов
	{
		"kylechui/nvim-surround",
		version = "^4.0.0", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		-- Optional: See `:h nvim-surround.configuration` and `:h nvim-surround.setup` for details
		-- config = function()
		--     require("nvim-surround").setup({
		--         -- Put your configuration here
		--     })
		-- end
	},
}
