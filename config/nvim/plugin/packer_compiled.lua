-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/georgios/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/georgios/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/georgios/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/georgios/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/georgios/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/georgios/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/georgios/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/georgios/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/home/georgios/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/georgios/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/georgios/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/georgios/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/georgios/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire¹\a\1\0\t\0004\0u6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\0035\4\v\0009\5\b\0009\5\t\0059\5\n\5B\5\1\2=\5\f\0049\5\b\0009\5\t\0059\5\n\5B\5\1\2=\5\r\4=\4\t\0035\4\16\0009\5\14\0009\5\15\5B\5\1\2=\5\17\0049\5\14\0009\5\18\5B\5\1\2=\5\19\0049\5\14\0009\5\15\5B\5\1\2=\5\20\0049\5\14\0009\5\18\5B\5\1\2=\5\21\0049\5\14\0009\5\22\5)\aüÿB\5\2\2=\5\23\0049\5\14\0009\5\22\5)\a\4\0B\5\2\2=\5\24\0049\5\14\0009\a\14\0009\a\25\aB\a\1\0025\b\26\0B\5\3\2=\5\27\0049\5\14\0009\5\28\5B\5\1\2=\5\29\0049\5\14\0009\5\30\0055\a!\0009\b\31\0009\b \b=\b\"\aB\5\2\2=\5#\4=\4\14\0039\4\b\0009\4$\0044\6\a\0005\a%\0>\a\1\0065\a&\0>\a\2\0065\a'\0>\a\3\0065\a(\0>\a\4\0065\a)\0>\a\5\0065\a*\0>\a\6\6B\4\2\2=\4$\3B\1\2\0019\1\2\0009\1+\0015\3,\0005\4.\0009\5\14\0009\5-\0059\5+\5B\5\1\2=\5\14\0044\5\3\0005\6/\0>\6\1\5=\5$\4B\1\3\0019\1\2\0009\1+\0015\0030\0005\0041\0009\5\14\0009\5-\0059\5+\5B\5\1\2=\5\14\0044\5\3\0005\0062\0>\6\1\0055\0063\0>\6\2\5=\5$\4B\1\3\1K\0\1\0\1\0\1\tname\tpath\1\0\1\tname\fcmdline\1\0\0\1\2\0\0\6:\1\0\1\tname\vbuffer\1\0\0\vpreset\1\3\0\0\6/\6?\fcmdline\1\0\1\tname\rnvim_lua\1\0\1\tname\fluasnip\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\28nvim_lsp_signature_help\1\0\1\tname\rnvim_lsp\fsources\t<CR>\rbehavior\1\0\1\vselect\2\vInsert\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\1\3\0\0\6i\6c\rcomplete\n<C-f>\n<C-b>\16scroll_docs\n<Tab>\f<S-Tab>\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\18documentation\15completion\1\0\0\rbordered\vwindow\vconfig\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "/home/georgios/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/georgios/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/georgios/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/georgios/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/home/georgios/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/georgios/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire¹\a\1\0\t\0004\0u6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\0035\4\v\0009\5\b\0009\5\t\0059\5\n\5B\5\1\2=\5\f\0049\5\b\0009\5\t\0059\5\n\5B\5\1\2=\5\r\4=\4\t\0035\4\16\0009\5\14\0009\5\15\5B\5\1\2=\5\17\0049\5\14\0009\5\18\5B\5\1\2=\5\19\0049\5\14\0009\5\15\5B\5\1\2=\5\20\0049\5\14\0009\5\18\5B\5\1\2=\5\21\0049\5\14\0009\5\22\5)\aüÿB\5\2\2=\5\23\0049\5\14\0009\5\22\5)\a\4\0B\5\2\2=\5\24\0049\5\14\0009\a\14\0009\a\25\aB\a\1\0025\b\26\0B\5\3\2=\5\27\0049\5\14\0009\5\28\5B\5\1\2=\5\29\0049\5\14\0009\5\30\0055\a!\0009\b\31\0009\b \b=\b\"\aB\5\2\2=\5#\4=\4\14\0039\4\b\0009\4$\0044\6\a\0005\a%\0>\a\1\0065\a&\0>\a\2\0065\a'\0>\a\3\0065\a(\0>\a\4\0065\a)\0>\a\5\0065\a*\0>\a\6\6B\4\2\2=\4$\3B\1\2\0019\1\2\0009\1+\0015\3,\0005\4.\0009\5\14\0009\5-\0059\5+\5B\5\1\2=\5\14\0044\5\3\0005\6/\0>\6\1\5=\5$\4B\1\3\0019\1\2\0009\1+\0015\0030\0005\0041\0009\5\14\0009\5-\0059\5+\5B\5\1\2=\5\14\0044\5\3\0005\0062\0>\6\1\0055\0063\0>\6\2\5=\5$\4B\1\3\1K\0\1\0\1\0\1\tname\tpath\1\0\1\tname\fcmdline\1\0\0\1\2\0\0\6:\1\0\1\tname\vbuffer\1\0\0\vpreset\1\3\0\0\6/\6?\fcmdline\1\0\1\tname\rnvim_lua\1\0\1\tname\fluasnip\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\28nvim_lsp_signature_help\1\0\1\tname\rnvim_lsp\fsources\t<CR>\rbehavior\1\0\1\vselect\2\vInsert\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\1\3\0\0\6i\6c\rcomplete\n<C-f>\n<C-b>\16scroll_docs\n<Tab>\f<S-Tab>\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\18documentation\15completion\1\0\0\rbordered\vwindow\vconfig\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
