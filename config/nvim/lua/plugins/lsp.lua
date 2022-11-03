local function init(use)
	use {
		"williamboman/mason.nvim",
		config = function() require('mason').setup() end
	}

	use {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"Afourcat/treesitter-terraform-doc.nvim",
	}
end

return {init = init}
