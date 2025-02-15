vim.g.mapleader = " "

-- highlight text on yank
vim.api.nvim_create_autocmd("textyankpost", {
	desc = "highlight when yanking text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function() vim.highlight.on_yank()
	end,
})
-- Go back to nvim default file tree vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Source the current file
vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)
vim.keymap.set("n", "<leader>pf", function()
	vim.cmd("Telescope find_files")
end)

vim.keymap.set("n", "<leader>ps", function()
	vim.cmd("Telescope live_grep") end)

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
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- When searching and moving to the next match, center screen vim.keymap.set("n", "n", "nzzzv")
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
vim.keymap.set("n", ";", "g_")

-- Define the function to comment selected lines
function python_comment_lines(comment_string)
  -- Get the current visual selection start and end positions
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")

  -- Extract line numbers from the start and end positions
  local start_line = start_pos[2]
  local end_line = end_pos[2]

  -- Ensure we go in the correct direction for line iteration
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end

  -- Loop through each selected line and prepend '#' symbol
  for line_num = start_line, end_line do
    local line = vim.fn.getline(line_num)
    -- Prepend '#' symbol if not already commented
    if not line:match("^%s*#") then
      vim.fn.setline(line_num, comment_string .. line)
    end
  end
end

-- Set keymap to call the function in visual mode (Y to comment)
vim.api.nvim_set_keymap("v", "#", [[:lua python_comment_lines("# ")<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap("v", "//", [[:lua python_comment_lines("// ")<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap("v", "--", [[:lua python_comment_lines("-- ")<CR>]], { noremap = true, silent = true })
