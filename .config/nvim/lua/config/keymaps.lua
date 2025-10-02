-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set(
  "n",
  "<C-/>",
  "<cmd>ToggleTerm direction=float<cr>",
  { noremap = true, silent = true, desc = "Float Toggle Terminal" }
)
-- copy path to file relative to root
vim.keymap.set(
  "n",
  "<leader>fp",
  "<cmd>CurRelPath<cr>",
  { noremap = true, silent = true, desc = "Copy relative path to clipboard" }
)
-- teelscope file browser
vim.keymap.set("n", "<space>fb", ":Telescope file_browser<CR>")
-- Ctrl-Enter to insert a new line below in insert mode with cursor anywher on line
vim.api.nvim_set_keymap("i", "<C-CR>", "<Esc>o", { noremap = true })
-- remap double space to find files in cwd
vim.keymap.set("n", "<Space><Space>", ":Telescope find_files<CR>", { noremap = true })
