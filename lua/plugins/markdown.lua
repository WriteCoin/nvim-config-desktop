return {
	{
		"tadmccorkle/markdown.nvim",
		ft = "markdown", -- or 'event = "VeryLazy"'
		opts = {
			-- configuration here or empty for defaults
			mappings = {
				-- Отключить привязку gx по умолчанию
				link_follow = false,
			},
		},
		config = function()
			-- Явно привязать gx в буфере markdown к команде url-open
			vim.keymap.set("n", "gx", "<esc>:URLOpenUnderCursor<cr>", {
				buffer = true,
				desc = "Открыть URL под курсором",
			})
			-- Переход по ссылкам привязать к другой клавише (вместо gx, будет использоваться для открытия URL плагином url-open)
			vim.keymap.set(
				"n",
				"gL",
				"<Plug>(markdown_follow_link)",
				{ buffer = true, desc = "Markdown: переход по ссылке" }
			)
		end,
	},
	{
		"preservim/vim-markdown",
		init = function()
			vim.g.vim_markdown_folding_disabled = 1
		end,
		config = function()
			-- Явно привязать gx в буфере markdown к команде url-open
			vim.keymap.set("n", "gx", "<esc>:URLOpenUnderCursor<cr>", {
				buffer = true,
				desc = "Открыть URL под курсором",
			})
			vim.keymap.set(
				"n",
				"gL",
				"<Plug>Markdown_OpenUrlUnderCursor",
				{ desc = "vim-markdown: открыть ссылку" }
			)
		end,
	},
}
