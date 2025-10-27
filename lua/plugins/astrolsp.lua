-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    -- Configuration table of features provided by AstroLSP
    features = {
      signature_help = true,
      codelens = true, -- enable/disable codelens refresh on start
      inlay_hints = true, -- enable/disable inlay hints on start
      semantic_tokens = true, -- enable/disable semantic token highlighting
    },
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
      },
    },
    -- customize language server configurations
    config = {
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              disable = { "mixed_table", "missing-fields" },
            },
          },
        },
      },
      -- rust_analyzer is handled by rustaceanvim via the rust pack
    },
  },
}
