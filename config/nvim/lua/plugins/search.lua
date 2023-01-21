-- see https://github.com/Integralist/dotfiles/blob/main/.config/nvim/lua/plugins/search.lua

local function init(use)
  use {
    "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-fzf-native.nvim", run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    },
    config = function()
      --[[
          Opening mulitple files doesn't work by default.
          You can either following the implementation detailed here:
          https://github.com/nvim-telescope/telescope.nvim/issues/1048#issuecomment-1220846367
          Or you can have a more complex workflow:
          - Select multiple files using <Tab>
          - Send the selected files to the quickfix window using <C-o>
          - Search the quickfix window (using either :copen or <leader>q)
          NOTE: Scroll the preview window using <C-d> and <C-u>.
        ]]
      local actions = require("telescope.actions")
      local ts = require("telescope")
      -- see issue https://github.com/nvim-telescope/telescope.nvim/issues/2104
      -- to address the ordering of results in telescope find symbols
      local fzf_opts = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                           -- the default case_mode is "smart_case"
      }


      ts.setup({
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = actions.close,
              ["<C-o>"] = actions.send_selected_to_qflist,
            },
          },
        },
        -- extensions = {
        --   heading = {
        --     treesitter = true,
        --   },
        --   fzf = fzf_opts
        -- },
        -- pickers = {
        --   lsp_dynamic_workspace_symbols = {
        --     sorter = ts.extensions.fzf.native_fzf_sorter(fzf_opts)
        --   },
        -- },
      })

      --ts.load_extension("changed_files")
      --ts.load_extension("emoji")
      -- ts.load_extension("fzf")
      --ts.load_extension("heading")
      --ts.load_extension("ui-select")
      --ts.load_extension("windows")

      vim.g.telescope_changed_files_base_branch = "main"

      vim.keymap.set("n", "<leader>fb", "<Cmd>Telescope buffers<CR>", { desc = "search buffers" })
      --vim.keymap.set("n", "<leader>c", "<Cmd>Telescope colorscheme<CR>", { desc = "search colorschemes" })
      vim.keymap.set("n", "<leader>td", "<Cmd>TodoTelescope<CR>", { desc = "search TODOs" })
      --vim.keymap.set("n", "<leader>ej", "<Cmd>Telescope emoji<CR>", { desc = "search emojis" })
      vim.keymap.set("n", "<leader>ex", "<Cmd>Telescope commands<CR>", { desc = "search Ex commands" })
      vim.keymap.set("n", "<leader>ff", "<Cmd>Telescope find_files<CR>", { desc = "search files" })
      vim.keymap.set("n", "<leader>fc", "<Cmd>Telescope changed_files<CR>", { desc = "search changed files" })
      --vim.keymap.set("n", "<leader>h", "<Cmd>Telescope help_tags<CR>", { desc = "search help" })
      --vim.keymap.set("n", "<leader>i", "<Cmd>Telescope builtin<CR>", { desc = "search builtins" })
      vim.keymap.set("n", "<leader>km", "<Cmd>Telescope keymaps<CR>", { desc = "search key mappings" })
      vim.keymap.set("n", "<leader>dg", "<Cmd>Telescope diagnostics<CR>", { desc = "search lsp diagnostics" })
      --vim.keymap.set("n", "<leader>li", "<Cmd>Telescope lsp_incoming_calls<CR>", { desc = "search lsp incoming calls" })
      --vim.keymap.set("n", "<leader>lo", "<Cmd>Telescope lsp_outgoing_calls<CR>", { desc = "search lsp outgoing calls" })
      --vim.keymap.set("n", "<leader>lr", "<Cmd>Telescope lsp_references<CR>", { desc = "search lsp code reference" })
      vim.keymap.set("n", "<leader>ds", "<Cmd>Telescope lsp_document_symbols<CR>", { desc = "search lsp document tree" })
      vim.keymap.set("n", "<leader>fs", "<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>", { desc = "find workspace symbols" })
      vim.keymap.set("n", "<leader>fr", "<Cmd>Telescope lsp_references<CR>", { desc = "find references" })
      --vim.keymap.set("n", "<leader>m", "<Cmd>Telescope heading<CR>", { desc = "search markdown headings" })
      --vim.keymap.set("n", "<leader>n", "<Cmd>Noice telescope<CR>", { desc = "search messages handled by Noice plugin" })
      vim.keymap.set("n", "<leader>qf", "<Cmd>Telescope quickfix<CR>", { desc = "search quickfix list" })
      vim.keymap.set("n", "<leader>fh", "<Cmd>Telescope current_buffer_fuzzy_find<CR>",
        { desc = "search current buffer text" })
      --vim.keymap.set("n", "<leader>s", "<Cmd>Telescope treesitter<CR>", { desc = "search treesitter symbols" }) -- similar to lsp_document_symbols but treesitter doesn't know what a 'struct' is, just that it's a 'type'.
      --vim.keymap.set("n", "<leader>w", "<Cmd>Telescope windows<CR>", { desc = "search windows" })
      vim.keymap.set("n", "<leader>fg", "<Cmd>Telescope live_grep<CR>", { desc = "search text" })
    end
  }
  end

  return {init = init}
