return {
	{
		-- Автодополнение
		"saghen/blink.cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		-- main is v2 development (breaking); 1.x release tags ship a prebuilt
		-- Rust fuzzy matcher, so no build toolchain is needed.
		version = "1.*",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				version = "2.*",
				build = "make install_jsregexp",
			},
			"folke/lazydev.nvim",
		},
		opts = {
			snippets = { preset = "luasnip" },

			-- Exact replica of the previous nvim-cmp mapping set (including the
			-- preset.insert keys that came along implicitly).
			keymap = {
				preset = "none",
				["<CR>"] = { "accept", "fallback" },
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-y>"] = { "accept", "fallback" },
				["<C-e>"] = { "cancel", "fallback" },

				-- прокрутка документации
				["<C-n>"] = { "scroll_documentation_down", "fallback" },
				["<C-p>"] = { "scroll_documentation_up", "fallback" },

				-- навигация по списку
				["<C-b>"] = { "select_prev", "fallback" },
				["<C-f>"] = { "select_next", "fallback" },
				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },

				-- сниппеты
				["<C-h>"] = { "snippet_backward", "fallback" },
				["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
				["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
			},

			completion = {
				-- match cmp's completeopt=menu,menuone,noinsert + confirm{select=true}
				list = { selection = { preselect = true, auto_insert = false } },
				-- menu = { border = "rounded", direction_priority = { "n", "s" } },
				menu = { border = "rounded" },
				documentation = { auto_show = true, window = { border = "rounded" } },
			},

			sources = {
				default = { "lsp", "path", "snippets" },
				per_filetype = {
					lua = { inherit_defaults = true, "lazydev" },
				},
				providers = {
					lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
				},

				-- cmdline = {
				-- 	completion = {
				-- 		menu = { auto_show = true },
				-- 	},
				-- },
				-- min_keyword_length = function(ctx)
				-- 	if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then
				-- 		return 3
				-- 	end
				-- 	return 0
				-- end,
			},

			cmdline = {
				completion = {
					menu = { auto_show = true },
					list = {
						selection = {
							preselect = false,
							auto_insert = false,
						},
					},
				},
				-- 'buffer' добавит слова из открытых буферов
				sources = { "cmdline", "buffer" },
				-- min_keyword_length = 3,
				-- min_keyword_length = function(ctx)
				-- 	if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then
				-- 		return 3
				-- 	end
				-- 	return 0
				-- end,

				keymap = {
					["<Tab>"] = { "select_next", "fallback" },
					["<S-Tab>"] = { "select_prev", "fallback" },
					["<CR>"] = { "accept", "fallback" },
					-- ["<Esc>"] = { "hide", "fallback" },
				},
			},

			-- keep the native wildmenu cmdline (blink's cmdline module remaps
			-- Tab/arrows in ':' — parity opt-in for later)
			-- cmdline = { enabled = false },

			fuzzy = { implementation = "prefer_rust_with_warning" },
			-- fuzzy = { implementation = "lua" },
		},
	},
}
