return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, { "cmake" })
			end
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		opts = function(_, opts)
			local nls = require("null-ls")
			opts.sources = opts.sources or {}
			vim.list_extend(opts.sources, {
				nls.builtins.diagnostics.cmake_lint,
			})
		end,
	},
	{
		"mason.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "cmakelang" })
		end,
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				neocmake = {},
			},
		},
	},
	{
		"Civitasv/cmake-tools.nvim",
		opts = {
			cmake_command = "cmake",
			cmake_build_directory = "build",
			cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
			cmake_build_options = {},
			cmake_console_size = 10, -- cmake output window height
			cmake_show_console = "always", -- "always", "only_on_error"
			cmake_soft_link_compile_commands = false, -- this will automatically make a soft link from compile commands file to project root dir
			cmake_compile_commands_from_lsp = false, -- this will automatically set compile commands file location using lsp, to use it, please set `cmake_soft_link_compile_commands` to false
			cmake_dap_configuration = {
				name = "cpp",
				type = "codelldb",
				request = "launch",
				runInTerminal = false,
				stopOnEntry = true,
			}, -- dap configuration, optional
			cmake_dap_open_command = require("dap").repl.open, -- optional
			cmake_variants_message = {
				short = { show = true },
				long = { show = true, max_length = 40 },
			},
		},
		event = "BufRead",
	},
}
