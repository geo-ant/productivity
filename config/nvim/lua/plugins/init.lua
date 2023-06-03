--[[
-- this should automatically install packer for us
-- see https://github.com/Integralist/dotfiles/blob/main/.config/nvim/lua/plugins/init.lua
--]]

-- ends_with returns a bool indicating if the str ends with the specified substring.
local function ends_with(str, ending)
  return ending == "" or str:sub(- #ending) == ending
end

-- The following configuration ensures that when we clone these dotfiles to a
-- new laptop, that they'll continue to work without any manual intervention.
-- Check the bottom of the .startup() function for our call to packer_bootstrap.
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()

return require("packer").startup({
  function()
    -- plugin manager
    use "wbthomason/packer.nvim"

    -- icons used by many plugins
    use "nvim-tree/nvim-web-devicons"

    -- The following code loads our plugins based on their category group (e.g. autocomplete, lsp, search etc).
    -- it loads all .lua files in the plugins directory, and then calls the init() function in each file.
    local plugins = vim.api.nvim_get_runtime_file("lua/plugins/*.lua", true)
    for _, v in ipairs(plugins) do -- NOTE: ipairs() keeps key order, pairs() doesn't.

      if vim.fn.has("win32") then
        -- on windows, the path is separated by backslashes, so we need to replace them with forward slashes
        v = v:gsub("\\", "/")
      end

      for _, s in ipairs(vim.split(v, "/lua/")) do
        -- skip init.lua as that is this file and would cause an infinite loop!
        -- but ensure we don't accidentally try to load the directory itself (i.e. .config/nvim)
        if not ends_with(s, "/init.lua") and ends_with(s, ".lua") then
          for _, p in ipairs(vim.split(s, "[.]lua")) do
            if (p ~= "") then
              require(p).init(use)
            end
          end
        end
      end
    end

    -- automatically set up your configuration after cloning packer.nvim
    -- put this at the end after all plugins
    if packer_bootstrap then
      require("packer").sync()
    end
  end,
  config = {
    git = {
      clone_timeout = 120
    }
  }
})
