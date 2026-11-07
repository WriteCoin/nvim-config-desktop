return {
	{
		"tpope/vim-fugitive",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				linehl = true,
				signcolumn = true,
			})

			-- Взятие цвета фона из цветовой схемы
			local bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
			bg = string.format("#%06x", bg)

			-- local bg = "#1a212e"

			-- Для управления цветовой схемой плагина gitsigns.nvim
			-- Не устанавливайте fg, оставьте только bg
			vim.api.nvim_set_hl(0, "GitSignsAddLn", { bg = bg }) -- изменённая (добавленная) строка
			vim.api.nvim_set_hl(0, "GitSignsChangeLn", { bg = bg }) -- изменённая строка
			vim.api.nvim_set_hl(0, "GitSignsDeleteLn", { bg = bg }) -- удалённая строка
		end,
	},
}
