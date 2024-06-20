-- plug default,not need map:
-------------------------------
-- comment line or block
-- gcc
-- gbc
-- gc
-- gb
-------------------------------
-- <leader> k   toggle highlight
-- <leader> K   clear all highlight
-------------------------------
-------------------------------
vim.keymap.set('n', '<leader>u',    "<esc>:call UpdateCtags()<CR>", { silent = true, noremap = true, desc = "update ctags" })
-------------------------------

