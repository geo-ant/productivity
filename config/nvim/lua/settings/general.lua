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

vim.wo.wrap = false
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
