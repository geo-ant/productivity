local function init(use)
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	local lualine = require("lualine")
	lualine.setup( {
		extensions = {"fzf","fugitive","nvim-dap-ui","quickfix"}
	})
end

return {init = init}
