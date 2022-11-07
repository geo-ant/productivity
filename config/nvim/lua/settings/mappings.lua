-- Common keymaps
-- There will be other keymaps for other plugins and extensions
-- within those .lua files. 

--vim.cmd([[let mapleader=" "]])
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true})
vim.g.mapleader = " "
vim.g.maplocalleader  = " "
--vim.g.mapleader = ";"
