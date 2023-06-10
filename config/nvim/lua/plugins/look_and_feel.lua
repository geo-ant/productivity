local function init(use)
  use { 
    "karb94/neoscroll.nvim",
    "ellisonleao/gruvbox.nvim",
    "folke/tokyonight.nvim",
    "EdenEast/nightfox.nvim",
    "rebelot/kanagawa.nvim",
    "ribru17/bamboo.nvim",
    "loctvl842/monokai-pro.nvim",
  }

  -- vim.o.background = "dark"
  vim.cmd("colorscheme gruvbox")
  require("neoscroll").setup()
end

return {init = init}
