-- Neo-tree Overrides
---@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  config = function()
    require("neo-tree").setup {
      popup_border_style = "rounded",
      filesystem = {
        filtered_items = {
          visible = false, -- show hidden files in alternate style
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false, -- only works on Windows for hidden files/directories
          hide_by_name = {
            "node_modules",
            "__pycache__",
          },
          hide_by_pattern = { -- uses glob style patterns
            --"*/src/*/tsconfig.json",
          },
          always_show = { -- remains visible even if other settings would normally hide it
            --".gitignored",
          },
          never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
            ".DS_Store",
            "__pycache__",
            "thumbs.db",
            ".pytest_cache",
          },
          never_show_by_pattern = { -- uses glob style patterns
            --".null-ls_*",
          },
        },
      },
    }
  end,
}
