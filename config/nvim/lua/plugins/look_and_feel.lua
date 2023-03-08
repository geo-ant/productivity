local function init(use)
  use { 
    "karb94/neoscroll.nvim",
    "ellisonleao/gruvbox.nvim",
    "jnurmine/Zenburn",
  }

  -- vim.o.background = "dark"
  vim.cmd("colorscheme gruvbox")
  require("neoscroll").setup()
end

return {init = init}
