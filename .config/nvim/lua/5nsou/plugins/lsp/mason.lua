return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "Subhanallah",
					package_pending = "Inshallah",
					package_uninstalled = "Audhubillah",
				},
			},
		})
	end,
}
