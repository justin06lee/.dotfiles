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
    lazypath,
  })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  -- Import your plugin specs
  { import = "5nsou.plugins" },
  { import = "5nsou.plugins.lsp" },

  -- Add nvim-lspconfig explicitly (if not already in your plugins)
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- LSP configuration
      local lspconfig = require("lspconfig")
      local util = require("lspconfig/util")

      -- Define on_attach function for LSP
      local on_attach = function(client, bufnr)
        -- Keybindings for LSP
        local opts = { buffer = bufnr, noremap = true, silent = true }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
      end

      -- Configure LSP servers
      local servers = {
        "gopls",    -- Go
        "pyright",  -- Python
        "rust_analyzer", -- Rust
        "lua_ls"
      }

      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
          on_attach = on_attach,
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
        })
      end

      -- Lua LSP specific configuration
      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })
    end,
  }, 
})
