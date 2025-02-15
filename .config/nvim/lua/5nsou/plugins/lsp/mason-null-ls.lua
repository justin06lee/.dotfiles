
return {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "nvimtools/none-ls.nvim",
    },
    config = function()
        local DEFAULT_SETTINGS = {
            -- A list of sources to install if they're not already installed.
            ensure_installed = {},
            -- Enable or disable null-ls methods
            methods = {
                diagnostics = true,
                formatting = true,
                code_actions = true,
                completion = true,
                hover = true,
            },
            -- Whether to automatically install null-ls sources with Mason
            automatic_installation = false,
            handlers = nil, -- See documentation for handler usage
        }

        require("mason-null-ls").setup(DEFAULT_SETTINGS)
    end,
}
