local export = {}

function export.on_attach(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', '<c-]>', "<Cmd>lua vim.lsp.buf.definition()<CR>", bufopts)
  vim.keymap.set('n', 'K', "<Cmd>lua vim.lsp.buf.hover()<CR>", bufopts)
  vim.keymap.set('n', '<leader><leader>h', "<Cmd>lua vim.lsp.buf.signature_help()<CR>", bufopts)
  vim.keymap.set('n', '<leader><leader>ca', "<Cmd>lua vim.lsp.buf.code_action()<CR>", bufopts)
  vim.keymap.set('n', '<leader><leader>gi', "<Cmd>lua vim.lsp.buf.implementation()<CR>", bufopts)
  vim.keymap.set('n', '<leader><leader>ic', "<Cmd>lua vim.lsp.buf.incoming_calls()<CR>", bufopts)
  vim.keymap.set('n', '<leader><leader>gd', vim.lsp.buf.definition,bufopts)
  vim.keymap.set('n', '<leader><leader>gD', vim.lsp.buf.declaration,bufopts)
  vim.keymap.set('n', '<leader><leader>td', "<Cmd>lua vim.lsp.buf.type_definition()<CR>", bufopts)
  -- vim.keymap.set('n', '<leader><leader>fr', "<Cmd>lua vim.lsp.buf.references()<CR>", bufopts)
  vim.keymap.set('n', '<leader><leader>rn', "<Cmd>lua vim.lsp.buf.rename()<CR>", bufopts)
  vim.keymap.set('n', '<leader><leader>ds', "<Cmd>lua vim.lsp.buf.document_symbol()<CR>", bufopts)
  vim.keymap.set('n', '<leader><leader>so', "<Cmd>SymbolsOutline<CR>", bufopts)
  --vim.keymap.set('n', 'gw', "<Cmd>lua vim.lsp.buf.workspace_symbol()<CR>", bufopts) --use telescope for that
  --vim.keymap.set('n', '[x', "<Cmd>lua vim.diagnostic.goto_prev()<CR>", bufopts)
  --vim.keymap.set('n', ']x', "<Cmd>lua vim.diagnostic.goto_next()<CR>", bufopts)
  vim.keymap.set('n', '<leader><leader>di', "<Cmd>lua vim.diagnostic.open_float()<CR>", bufopts)
  --vim.keymap.set('n', ']s', "<Cmd>lua vim.diagnostic.show()<CR>", bufopts)

  --vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  --  group = vim.api.nvim_create_augroup("SharedLspFormatting", { clear = true }),
  --  pattern = "*",
  --  command = "lua vim.lsp.buf.format()",
  --})

  if client.server_capabilities.documentSymbolProvider then
    -- https://github.com/SmiteshP/nvim-navic/issues/72
    -- require("nvim-navic").attach(client, bufnr)
  end
end

return export
