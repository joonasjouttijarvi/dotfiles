local nvim_lsp = require("lspconfig")

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "➤",
    },
  },
})

-- set lsp icons for diagnostics
local diagnostic_signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "➤" },
  { name = "DiagnosticSignInfo", text = "" },
}
for _, sign in ipairs(diagnostic_signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
end

-- function for toggling inlay hints
local inlay_hints_enabled = false

function ToggleInlayHints()
  inlay_hints_enabled = not inlay_hints_enabled
  if inlay_hints_enabled then
    -- Enable inlay hints
    vim.lsp.inlay_hint.enable(0, true)
  else
    -- Refresh to remove the inlay hints
    vim.lsp.inlay_hint.enable(0, false)
  end
end

vim.api.nvim_set_keymap("n", "<leader>ih", ":lua ToggleInlayHints()<CR>", { noremap = true, silent = true })

require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "pyright",
    "jdtls",
    "robotframework_ls",
    "lua_ls",
    "jsonls",
    "clangd",
    "yamlls",
  },
  automatic_installation = true,
})

-- Lsp server setups
local capabilities = require("cmp_nvim_lsp").default_capabilities()
nvim_lsp.cssls.setup({
  capabilities = capabilities,
})
nvim_lsp.jdtls.setup({
  capabilities = capabilities,
})

nvim_lsp.pyright.setup({
  capabilities = capabilities,
})

nvim_lsp.yamlls.setup({
  capabilities = capabilities,
})
nvim_lsp.robotframework_ls.setup({

  cmd = { "robotframework_ls" },
  filetypes = { "robot" },
  settings = {
    robot = {
      filetype = "robot",
      pythonpath = "/opt/homebrew/lib/python3.11/site-packages/robotframework_ls",
    },
  },
})
nvim_lsp.lua_ls.setup({
  cmd = { "/opt/homebrew/bin/lua-language-server" },
  settings = {
    Lua = {
      hint = {
        enable = true,
        -- list nubering for inlay hints false
      },
      runtime = {
        version = "LuaJIT",
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
        },
      },
    },
  },
})

-- clangd setup
nvim_lsp.clangd.setup({
  capabilities = capabilities,
})

-- gopls setup
nvim_lsp.gopls.setup({
  capabilities = capabilities,
})

-- jsonls setup

nvim_lsp.jsonls.setup({
  capabilities = capabilities,
})

-- marksman setup
nvim_lsp.marksman.setup({
  capabilities = capabilities,
})

-- Tsserver setup

nvim_lsp.tsserver.setup({
  capabilities = capabilities,
})

-- tailwindcss setup
nvim_lsp.tailwindcss.setup({
  capabilities = capabilities,
})
