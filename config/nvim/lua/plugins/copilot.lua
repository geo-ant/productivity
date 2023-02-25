local function init(use)
  use {
    'github/copilot.vim'
  }
end

vim.g.copilot_no_tab_map = 1
vim.api.nvim_set_keymap("i", "<C-H>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.keymap.set('i', '<C-J>', '<Plug>(copilot-next)')
vim.keymap.set('i', '<C-K>', '<Plug>(copilot-previous)')

return {init = init}
