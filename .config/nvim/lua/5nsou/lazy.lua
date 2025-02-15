local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({
	    "git",
	  "clone",
	  "--filter=blob:none",
	  "https://github.com/folke/lazy.nvim.git",
	  "--branch=stable",
	  lazypath
  })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({ { import = "5nsou.plugins" }, { import = "5nsou.plugins.lsp" } }, {
	change_detection = {
		checker = {
			enabled = true,
			notify = false,
		},
		notify = false,
	},
})

local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier, -- Ensure Prettier is enabled
    },
})
