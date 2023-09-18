-- see also https://github.com/Integralist/dotfiles/blob/main/.config/nvim/lua/plugins/lsp.lua
-- and https://rsdlt.github.io/posts/rust-nvim-ide-guide-walkthrough-development-debug/
return {
  {
    -- LSP
    "neovim/nvim-lspconfig",
  }, {
    -- RUST LSP
    "simrat39/rust-tools.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap"
    },
    lazy = false,
    config = function()
      local rt = require("rust-tools")
      rt.setup({
        -- rust-tools options
        tools = {
          autoSetHints = true,
          inlay_hints = {
            show_parameter_hints = true,
            parameter_hints_prefix = "<- ",
            other_hints_prefix = "=> "
          }
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
            -- print("Attaching rust-tools to " .. client.name)
            require("settings.shared")(client, bufnr)

            local bufopts = {
              -- noremap = true,
              -- silent = true,
              buffer = bufnr
            }
            -- Hover actions
            vim.keymap.set("n", "K", rt.hover_actions.hover_actions, bufopts)
          end,
          ["rust-analyzer"] = {
            assist = {
              importEnforceGranularity = true,
              importPrefix = "create"
            },
            cargo = { allFeatures = true },
            checkOnSave = {
              -- default: `cargo check`
              command = "clippy",
              allFeatures = true
            }
          },
          inlayHints = {
            -- NOT SURE THIS IS VALID/WORKS 😬
            lifetimeElisionHints = {
              enable = true,
              useParameterNames = true
            }
          }
        }
      })
    end
  }, {
    -- LSP INLAY HINTS
    -- rust-tools already provides this feature, but gopls doesn't
    "lvimuser/lsp-inlayhints.nvim",
    dependencies = "neovim/nvim-lspconfig"
  }, {
    -- LSP SERVER MANAGEMENT
    "williamboman/mason.nvim",
    dependencies = "nvim-lspconfig",
    config = true
  }, {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim"},
    config = function()
      local mason_lspconfig = require("mason-lspconfig")

      -- NOTE: sumneko_lua -> lua_ls
      -- https://github.com/williamboman/mason-lspconfig.nvim/pull/148
      mason_lspconfig.setup({
        ensure_installed = {
          -- this works for language servers only
          -- for the debug adapter protocols we use the 
          -- mason nvim dap plugin
          "marksman",
          "rust_analyzer",
          "lua_ls",
          "zls",
          "clangd",
          "cmake",
          "cssls",
          "fortls",
        }
      })

      mason_lspconfig.setup_handlers({
        -- this is the default function for every handler,
        -- here https://github.com/williamboman/mason.nvim/discussions/57
        -- we can see how to set up functions for individual setup_handlers
        -- DON'T forget to call the shared code, though!
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
        end,
        -- individual config for the fortran language server
        ["fortls"] = function()
          require("lspconfig").fortls.setup({
            on_attach = function(client, bufnr)
              require("settings/shared").on_attach(client, bufnr)
              -- require("illuminate").on_attach(client)
            end,
            -- see https://fortls.fortran-lang.org/editor_integration.html#vim-neovim-gvim
            cmd = {
              "fortls",
              -- see https://fortls.fortran-lang.org/options.html
              -- for additional options
              "--lowercase_intrinsics",
              -- '--hover_signature',
              -- '--hover_language=fortran',
              -- '--use_signature_help'
            },
          })
        end,
      })
    end
  },
  {
    "jay-babu/mason-nvim-dap.nvim", 
    dependencies = { "mfussenegger/nvim-dap", "williamboman/mason.nvim", },
    config = function() 
      require('mason-nvim-dap').setup({
        ensure_installed = {"codelldb","cpptools"},
        handlers = {},
      })
    end
  },
  {
    -- LSP DIAGNOSTICS
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup()

      local bufopts = { noremap = true, silent = true }
      vim.keymap.set("n", "<leader><leader>lc", "<Cmd>TroubleClose<CR>",
        bufopts)
      vim.keymap.set("n", "<leader><leader>li",
        "<Cmd>TroubleToggle document_diagnostics<CR>",
        bufopts)
      vim.keymap.set("n", "<leader><leader>lw",
        "<Cmd>TroubleToggle workspace_diagnostics<CR>",
        bufopts)
      vim.keymap.set("n", "<leader><leader>lr",
        "<Cmd>TroubleToggle lsp_references<CR>", bufopts)
      vim.keymap.set("n", "<leader><leader>lq",
        "<Cmd>TroubleToggle quickfix<CR>", bufopts)
      vim.keymap.set("n", "<leader><leader>ll",
        "<Cmd>TroubleToggle loclist<CR>", bufopts)
    end
  },
  {
    "ziglang/zig.vim",
  },
  {
    "rust-lang/rust.vim",
  },
  {
    -- ADD MISSING DIAGNOSTICS HIGHLIGHT GROUPS
    "folke/lsp-colors.nvim",
    config = true
  },
  -- {
  --   -- LSP VIRTUAL TEXT
  --   "https://git.sr.ht/~whynothugo/lsp_lines.nvim",       -- See also: https://github.com/Maan2003/lsp_lines.nvim
  --   config = function()
  --     require("lsp_lines").setup()

  --     -- disable virtual_text since it's redundant due to lsp_lines.
  --     vim.diagnostic.config({ virtual_text = false })
  --   end
  -- }, 
  -- {
  --   -- CODE ACTIONS POPUP
  --   "weilbith/nvim-code-action-menu",
  --   config = function()
  --     vim.keymap.set("n", "<leader><leader>la", "<Cmd>CodeActionMenu<CR>",
  --       { noremap = true, desc = "code action menu" })
  --     vim.g.code_action_menu_window_border = "single"
  --   end
  -- }, {
  --   "SmiteshP/nvim-navbuddy",
  --   dependencies = {
  --     "neovim/nvim-lspconfig", "SmiteshP/nvim-navic",
  --     "MunifTanjim/nui.nvim"
  --   },
  --   keys = {
  --     {
  --       "<leader>lt",
  --       function() require("nvim-navbuddy").open() end,
  --       desc = "Navigate symbols via Navbuddy tree",
  --       mode = "n",
  --       noremap = true,
  --       silent = true
  --     }
  --   },
  --   config = function()
  --     local navbuddy = require("nvim-navbuddy")
  --     local actions = require("nvim-navbuddy.actions")
  --     navbuddy.setup({
  --       mappings = {
  --         ["<Down>"] = actions.next_sibling(),               -- down
  --         ["<Up>"] = actions.previous_sibling(),             -- up
  --         ["<Left>"] = actions.parent(),                     -- Move to left panel
  --         ["<Right>"] = actions.children()                   -- Move to right panel
  --       }
  --     })
  --   end
  -- }
}
