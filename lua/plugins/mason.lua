-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        { "golangci-lint", version = "v2.5.0" },
        "lua-language-server",
        "stylua",
        "debugpy",
        "elixir-ls",
        "fish-lsp",
        "bacon-ls",
        "basics-language-server",
        "gh-actions-language-server",
        "nginx-language-server",
        "postgrestools",
        "biome",
        "tree-sitter-cli",
      },
    },
  },
  -- Prevent haskell-debug-adapter from being installed (fails with ghcup)
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      handlers = {
        -- Skip haskell-debug-adapter installation
        ["haskell-debug-adapter"] = function() end,
      },
    },
  },
}
