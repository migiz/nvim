-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed or {}, {
        { "golangci-lint", version = "v2.5.0" },
        "basedpyright",
        "eslint-lsp",
        "gopls",
        "golangci-lint-langserver",
        "lua-language-server",
        "marksman",
        "prettier",
        "ruff",
        "stylua",
        "svelte-language-server",
        "tree-sitter-cli",
        "vtsls",
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      handlers = {
        ["haskell-debug-adapter"] = function() end,
      },
    },
  },
}
