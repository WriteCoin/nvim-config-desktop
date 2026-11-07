return {
	capabilities = {
		textDocument = {
			completion = {
				completionItem = {
					snippetSupport = true,
				},
			},
		},
	},
	settings = {
		["rust-analyzer"] = {
			-- modern schema: checkOnSave is a boolean; the command moved to check.*
			checkOnSave = true,
			check = {
				command = "clippy",
			},
		},
	},
}
