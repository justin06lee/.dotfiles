vim.g.mapleader = " "

-- highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
-- Go back to nvim default file tree
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Source the current file
vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)

vim.keymap.set("n", "<leader>pf", function()
	vim.cmd("Telescope find_files")
end)

vim.keymap.set("n", "<leader>ps", function()
	vim.cmd("Telescope live_grep")
end)

-- wipe the entire file (delete all lines)
vim.keymap.set("n", "<leader>wipe", 'GVgg0"_d') -- copy the entire file to clipboard
vim.keymap.set("n", "<leader>cc", "gg<S-v>Gy")

-- save and quit file (quit safe)
vim.keymap.set("n", "<leader>qs", function()
	vim.cmd("wqa")
end)

-- force quit file (quit force)
vim.keymap.set("n", "<leader>qf", function()
	vim.cmd("q!")
end)

-- Move a selection of lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- When searching and moving to the next match, center screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste without copying the text
vim.keymap.set("v", "<leader>p", '"_dP')

-- Delete without copying the text
vim.keymap.set("v", "<leader>dd", '"_d')

-- Get file tree on the right side
vim.keymap.set("n", "<leader>of", function()
	vim.cmd("Neotree right")
end)

-- Pull up fuzzy finder
vim.keymap.set("n", "<leader>pf", function()
	vim.cmd("Telescope find_files")
end)

-- save the file
vim.keymap.set("n", "<leader>wf", function()
	vim.cmd("wa")
end)

-- remove search highlights
vim.keymap.set("n", "<leader>rh", function()
	vim.cmd("noh")
end)

-- disable copilot
vim.keymap.set("n", "<leader>dc", function()
	vim.cmd("Copilot disable")
end)

-- enable copilot
vim.keymap.set("n", "<leader>ec", function()
	vim.cmd("Copilot enable")
end)

-- set textwidth to 130
vim.keymap.set("n", "<leader>tw", function()
	vim.cmd("set textwidth=130")
end)

-- apply textwidth to the entire file
vim.keymap.set("n", "<leader>atw", function()
	vim.cmd("normal gggqG")
end)

vim.keymap.set("n", "<leader>dtw", function()
	-- Disable Copilot
	vim.cmd("Copilot disable")

	-- Set textwidth to 130
	vim.o.textwidth = 130

	-- Reformat entire buffer to fit within textwidth
	vim.cmd("normal! gggqG")

	-- Safely remove all double spaces if they exist
	pcall(vim.cmd, "%s/  //g")

	-- Clear search highlighting
	vim.cmd("noh")
end, { noremap = true, silent = true })

-- g_
vim.keymap.set("n", ";", "g_a<Space>")


