-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`

-- Middle-ground inlay hints for vtsls and svelte-language-server: parameter
-- names on literal args and return/property types on, but variable and
-- parameter type hints off (Effect-style types make those span multiple lines).
local function inlay_hints()
  return {
    enumMemberValues = { enabled = true },
    functionLikeReturnTypes = { enabled = true },
    parameterNames = { enabled = "literals" },
    parameterTypes = { enabled = false },
    propertyDeclarationTypes = { enabled = true },
    variableTypes = { enabled = false },
  }
end

local function marksman_root_dir(bufnr, on_dir)
  local root = vim.fs.root(bufnr, { ".marksman.toml" })
  if root then on_dir(root) end
end

local function tailwindcss_root_dir(bufnr, on_dir)
  if vim.bo[bufnr].filetype == "markdown" then return end

  local util = require "lspconfig.util"
  local fname = vim.api.nvim_buf_get_name(bufnr)
  local root_files = {
    "tailwind.config.js",
    "tailwind.config.cjs",
    "tailwind.config.mjs",
    "tailwind.config.ts",
    "postcss.config.js",
    "postcss.config.cjs",
    "postcss.config.mjs",
    "postcss.config.ts",
    "theme/static_src/tailwind.config.js",
    "theme/static_src/tailwind.config.cjs",
    "theme/static_src/tailwind.config.mjs",
    "theme/static_src/tailwind.config.ts",
    "theme/static_src/postcss.config.js",
    ".git",
  }

  root_files = util.insert_package_json(root_files, "tailwindcss", fname)
  root_files = util.root_markers_with_field(root_files, { "mix.lock", "Gemfile.lock" }, "tailwind", fname)

  local root_file = vim.fs.find(root_files, { path = fname, upward = true })[1]
  if root_file then on_dir(vim.fs.dirname(root_file)) end
end

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
      disabled = {
        "basedpyright",
        "lua_ls",
        "svelte",
        "vtsls",
      },
    },
    servers = {
      "eslint",
    },
    -- customize language server configurations
    config = {
      lua_ls = {
        settings = {
          Lua = {
            format = {
              enable = false,
            },
            diagnostics = {
              disable = { "mixed_table", "missing-fields" },
            },
          },
        },
      },
      eslint = {
        settings = {
          format = false,
          workingDirectory = { mode = "auto" },
        },
      },
      marksman = {
        -- Avoid indexing every Markdown file in a large Git root. Add a
        -- .marksman.toml to a notes/docs root when cross-file Markdown LSP is wanted.
        root_dir = marksman_root_dir,
      },
      tailwindcss = {
        -- Tailwind's default Markdown support can scan broad Git roots while editing prose.
        root_dir = tailwindcss_root_dir,
      },
      vtsls = {
        settings = {
          typescript = { inlayHints = inlay_hints() },
          javascript = { inlayHints = inlay_hints() },
          -- Truncate long hints so wide types don't wrap across lines.
          vtsls = { experimental = { maxInlayHintLength = 30 } },
        },
      },
      svelte = {
        settings = {
          typescript = { inlayHints = inlay_hints() },
          javascript = { inlayHints = inlay_hints() },
        },
      },
      rust_analyzer = {
        -- rust_analyzer is started by rustaceanvim, but it merges these AstroLSP settings.
        settings = {
          ["rust-analyzer"] = {
            -- The Rust community pack defaults this to clippy; keep editor checks lighter.
            check = { command = "check", extraArgs = {} },
          },
        },
      },
    },
  },
}
