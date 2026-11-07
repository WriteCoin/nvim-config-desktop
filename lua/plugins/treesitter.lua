return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local ts = require("nvim-treesitter")
			-- Устанавливаем парсеры (это асинхронно)
			ts.install({
				"bash",
				"c",
				"diff",
				"html",
				"lua",
				"luadoc",
				"vim",
				"vimdoc",
				"python",
				"javascript",
				"typescript",
				"tsx",
				"markdown",
				"markdown_inline",
				"commonlisp",
				"fennel",
				"typst",
				"racket",
				"rust",
			})

			-- Включаем подсветку БЕЗОПАСНО: проверяем, готов ли парсер
			vim.api.nvim_create_autocmd("FileType", {
				callback = function(ev)
					local lang = vim.treesitter.language.get_lang(ev.match) or ev.match
					-- Безопасный вызов: если парсер не готов, Neovim просто молчит
					pcall(vim.treesitter.start, ev.buf, lang)
				end,
			})

			-- Инкрементное выделение встроено в Treesitter с версии 0.12
			vim.keymap.set("n", "<leader>ss", "van", { remap = true, desc = "TS [S]election [s]tart" })
			vim.keymap.set("x", "<leader>si", "an", { remap = true, desc = "TS selection [i]ncrement" })
			vim.keymap.set("x", "<leader>sc", "an", { remap = true, desc = "TS selection s[c]ope (approx)" })
			vim.keymap.set("x", "<leader>sd", "in", { remap = true, desc = "TS selection [d]ecrement" })
		end,
	},
	{
		-- Текстовые объекты af/if/ac/ic (функции/классы)
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-treesitter-textobjects").setup({
				select = { lookahead = true },
			})
			local select = require("nvim-treesitter-textobjects.select")
			for lhs, query in pairs({
				af = "@function.outer",
				["if"] = "@function.inner",
				ac = "@class.outer",
				ic = "@class.inner",
			}) do
				vim.keymap.set({ "x", "o" }, lhs, function()
					select.select_textobject(query, "textobjects")
				end, { desc = "TS textobject " .. query })
			end
		end,
	},
}
