local function init(use)
  use { 
    "karb94/neoscroll.nvim",
    "ellisonleao/gruvbox.nvim",
    "jnurmine/Zenburn",
    "doums/darcula"
  }

  -- vim.o.background = "dark"
  vim.cmd("colorscheme darcula")
  require("neoscroll").setup()
end

return {init = init}
