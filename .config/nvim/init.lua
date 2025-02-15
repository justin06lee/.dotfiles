require("5nsou.core")
require("5nsou.lazy")

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.js", "*.ts", "*.jsx", "*.tsx", "*.json", "*.md", "*.html", "*.css", "*.yaml" },
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})
