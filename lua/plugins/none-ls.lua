-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    -- opts variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

    -- Only insert new sources, do not replace the existing ones
    -- (If you wish to replace, use `opts.sources = {}` instead of the `list_insert_unique` function)
    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      null_ls.builtins.formatting.prettier.with {
        prefer_local = "node_modules/.bin",
        extra_filetypes = { "svelte" },
      },
    })
  end,
  specs = {
    {
      "jay-babu/mason-null-ls.nvim",
      opts = function(_, opts)
        local function default_setup(source_name, methods)
          require("mason-null-ls").default_setup(source_name, methods)
        end

        opts.handlers = opts.handlers or {}
        -- Keep Mason-installed stale formatters from silently registering with none-ls.
        opts.handlers[1] = function() end

        for _, source in ipairs {
          "shellcheck",
          "stylua",
          "selene",
          "gomodifytags",
          "iferr",
          "impl",
          "gotests",
          "goimports",
        } do
          if opts.handlers[source] == nil then opts.handlers[source] = default_setup end
        end
      end,
    },
  },
}
