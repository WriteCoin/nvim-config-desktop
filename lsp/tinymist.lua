return {
	cmd = { "tinymist" },
	filetypes = { "typst" },
	root_markers = { "typst.toml", ".git" },
	settings = {
		formatterMode = "typstyle",
		formatterIndentSize = 2,
		exportPdf = "onType", -- или "never", если не нужен авто-PDF
		semanticTokens = "enable",
		preview = {
			-- если хотите, чтобы preview шёл через tinymist
			-- background = false,
		},
	},
}
