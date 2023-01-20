local function init(use) 
  use {
    'vim-test/vim-test'
  }
  vim.keymap.set("n","<leader>tn","<Cmd>TestNearest<CR>", {desc = "run nearest test"})
  vim.keymap.set("n","<leader>tf","<Cmd>TestFile<CR>", {desc = "run tests inside file"})
  vim.keymap.set("n","<leader>ts","<Cmd>TestSuite<CR>", {desc = "run test suite"})
  --vim.keymap.set("n","<leader>tl","<Cmd>TestLast<CR>", {desc = "run nearest test"})
end

return {init = init}
