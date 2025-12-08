local M = {}
local map = vim.keymap.set

-- export on_attach & capabilities
M.on_attach = function(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
  map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
  -- map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
  -- map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")

  map("n", "<leader>lr", "<cmd>LspRestart<CR>", { desc = "Restart Lsp" })
  map("n", "<leader>fi", function()
    local clients = vim.lsp.get_clients { bufnr = 0 }
    for _, client in ipairs(clients) do
      if client.name == "pyright" then
        vim.cmd "PyrightOrganizeImports"
        return
      end
    end

    local offset_encoding = vim.lsp.util._get_offset_encoding(0)
    local params = vim.lsp.util.make_range_params(nil, offset_encoding)
    params.context = { only = { "source.organizeImports" } }
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 500)
    for _, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          vim.lsp.util.apply_workspace_edit(r.edit, offset_encoding)
        else
          vim.lsp.buf.execute_command(r.command)
        end
      end
    end
  end, { desc = "Lsp organize imports" })
  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts "List workspace folders")

  map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")
  -- map("n", "<leader>ra", vim.lsp.buf.rename, opts "NvRenamer")
end

-- disable semanticTokens
M.on_init = function(client, _)
  if vim.fn.has "nvim-0.11" ~= 1 then
    if client.supports_method "textDocument/semanticTokens" then
      client.server_capabilities.semanticTokensProvider = nil
    end
  else
    if client:supports_method "textDocument/semanticTokens" then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

M.defaults = function()
  dofile(vim.g.base46_cache .. "lsp")
  require("nvchad.lsp").diagnostic_config()

  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      M.on_attach(_, args.buf)
    end,
  })

  -- local lua_lsp_settings = {
  --   Lua = {
  --     workspace = {
  --       library = {
  --         vim.fn.expand "$VIMRUNTIME/lua",
  --         vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
  --         vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
  --         "${3rd}/luv/library",
  --       },
  --     },
  --   },
  -- }
  local lua_lsp_settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = {
        library = {
          vim.fn.expand "$VIMRUNTIME/lua",
          vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
          vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
          "${3rd}/luv/library",
        },
      },
    },
  }

  -- Support 0.10 temporarily

  -- if vim.lsp.config then
  --   vim.lsp.config("*", { capabilities = M.capabilities, on_init = M.on_init })
  --   vim.lsp.config("lua_ls", { settings = lua_lsp_settings })
  --   vim.lsp.enable "lua_ls"
  -- else
  --   require("lspconfig").lua_ls.setup {
  --     capabilities = M.capabilities,
  --     on_init = M.on_init,
  --     settings = lua_lsp_settings,
  --   }
  -- end
end

return M
