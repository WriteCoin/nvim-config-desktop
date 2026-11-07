return {
	{
		-- Конфигурация LSP
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "mason-org/mason.nvim", config = true },
			"mason-org/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			-- Per-server settings live in lsp/<name>.lua (0.11+ runtime convention;
			-- our files merge over nvim-lspconfig's defaults, user dir wins).
			-- Machine-local overrides (e.g. clangd) layer on top from lua/private/.
			local servers = {
				"clangd",
				"lua_ls",
				"tinymist",
				"ts_ls",
				"eslint",
				"racket_langserver",
				"rust_analyzer",
				"markdown_oxide",
			}

			require("mason").setup()

			local ensure_installed = vim.deepcopy(servers)
			for i, name in ipairs(ensure_installed) do
				if name == "racket_langserver" then
					table.remove(ensure_installed, i)
					break
				end
			end
			vim.list_extend(ensure_installed, {
				"stylua",
				"typstyle",
				"prettier",
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			-- mason-lspconfig v2: automatic_enable runs vim.lsp.enable() for every
			-- Mason-installed server — no per-server boilerplate here.
			require("mason-lspconfig").setup({})

			-- Completion capabilities: blink.cmp injects its own into vim.lsp.config
			-- automatically on Neovim 0.11+ — no manual plumbing needed.

			-- Ручная активация Racket LSP
			vim.lsp.enable("racket_langserver")
		end,
	},
}
