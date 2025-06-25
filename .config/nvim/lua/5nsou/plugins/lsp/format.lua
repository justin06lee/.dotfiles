return {
	"stevearc/conform.nvim",
	opts = {
		format_on_save = true, -- Enable format on save
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black", "ruff" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			go = { "gofmt" },
			rust = { "rustfmt" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			java = { "google-java-format" },
			sh = { "shfmt" },
		},
	},
}
