-- Create leader mapping
vim.g.mapleader = " "
-- File tree remapping from ":Ex" to "<leader>pv"
vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>")

-- don't copy deleted selection to yank register, instead through it in the void
vim.keymap.set("x", "<leader>p", "\"_dP")

-- copy to computer clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

