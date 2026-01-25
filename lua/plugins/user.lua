---@type LazySpec
return {
  {
    "max397574/better-escape.nvim",
    event = "InsertCharPre",
    opts = {
      timeout = 150,
      default_mappings = true,
      mappings = {
        i = { k = { j = "<Esc>" } },
        c = { k = { j = "<Esc>" } },
        t = { k = { j = "<Esc>" } },
        v = { k = { j = "<Esc>" } },
        s = { k = { j = "<Esc>" } },
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      ---@type false | "classic" | "modern" | "helix"
      preset = "modern",
      keys = {
        scroll_down = "<c-j>", -- binding to scroll down inside the popup
        scroll_up = "<c-k>", -- binding to scroll up inside the popup
      },
    },
  },
  -- Amp Plugin
  {
    "sourcegraph/amp.nvim",
    branch = "main",
    lazy = false,
    opts = { auto_start = true, log_level = "info" },
  },
}
