-- https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
local set = vim.opt
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true
set.relativenumber = true
set.number = true
set.signcolumn = "yes"
--set.splitright = true
set.splitbelow = true
set.scrolloff = 20
set.colorcolumn = "80"
set.fsync = true

-- netrw settings
vim.wo.wrap = false
-- https://shapeshed.com/vim-netrw/
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_winsize = 25
-- https://superuser.com/questions/1056929/open-file-in-vertical-split-in-vim-netrw/1062063#1062063
vim.g.netrw_altv = 1
