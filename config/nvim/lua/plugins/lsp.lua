-- see also https://github.com/Integralist/dotfiles/blob/main/.config/nvim/lua/plugins/lsp.lua
-- and https://rsdlt.github.io/posts/rust-nvim-ide-guide-walkthrough-development-debug/
local function init(use)
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		'simrat39/rust-tools.nvim'
	}

	require('mason').setup()
	local mason_lspconfig = require('mason-lspconfig')
	mason_lspconfig.setup({
		ensure_installed = {
			--"codelldb",
			--"cpptools",
			"marksman",
			"rust_analyzer",
			"sumneko_lua",
			"zls",
			"clangd",
			"cmake",
			"cssls",
		}
	})
	mason_lspconfig.setup_handlers({
		function(server_name)
			require("lspconfig")[server_name].setup({
				on_attach = function(client, bufnr)
					require("settings/shared").on_attach(client, bufnr)
					-- require("illuminate").on_attach(client)

					if server_name == "terraformls" then
						require("treesitter-terraform-doc").setup()
					end
				end
			})
		end
	})


	require("rust-tools").setup({
		-- rust-tools options
		tools = {
			autoSetHints = true,
			inlay_hints = {
				show_parameter_hints = true,
				parameter_hints_prefix = "<- ",
				other_hints_prefix = "=> ",
			},
		},

		-- all the opts to send to nvim-lspconfig
		-- these override the defaults set by rust-tools.nvim
		--
		-- REFERENCE:
		-- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
		-- https://rust-analyzer.github.io/manual.html#configuration
		-- https://rust-analyzer.github.io/manual.html#features
		--
		-- NOTE: The configuration format is `rust-analyzer.<section>.<property>`.
		--       <section> should be an object.
		--       <property> should be a primitive.
		server = {
			on_attach = function(client, bufnr)
				require("settings/shared").on_attach(client, bufnr)
				-- require("illuminate").on_attach(client)

				local bufopts = { noremap = true, silent = true, buffer = bufnr }
				--vim.keymap.set('n', '<leader><leader>rr', "<Cmd>RustRunnables<CR>", bufopts)
				vim.keymap.set('n', 'K', "<Cmd>RustHoverActions<CR>", bufopts)
			end,
			["rust-analyzer"] = {
				assist = {
					importEnforceGranularity = true,
					importPrefix = "crate"
				},
				cargo = {
					allFeatures = true
				},
				checkOnSave = {
					-- default: `cargo check`
					command = "clippy",
					allFeatures = true,
				},
			},
			inlayHints = { -- NOT SURE THIS IS VALID/WORKS 😬
			lifetimeElisionHints = {
				enable = true,
				useParameterNames = true
			},
		},
	}
})
end

return {init = init}
