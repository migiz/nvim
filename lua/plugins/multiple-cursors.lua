---@type LazySpec
return {
  "brenton-leighton/multiple-cursors.nvim",
  keys = {
    {
      "<A-j>",
      "<Cmd>MultipleCursorsAddJumpNextMatch<CR>",
      mode = { "n", "v" },
      desc = "Add cursor and jump to next occurrence",
    },
    {
      "<A-k>",
      "<Cmd>MultipleCursorsJumpPrevMatch<CR>",
      mode = { "n", "v" },
      desc = "Jump to previous occurrence",
    },
    {
      "<A-i>",
      "<Cmd>MultipleCursorsAddMatches<CR>",
      mode = { "n", "v" },
      desc = "Add cursors to all occurrences",
    },
    -- Additional useful mappings
    {
      "<Leader>mc",
      "<Cmd>MultipleCursorsLock<CR>",
      mode = { "n", "v" },
      desc = "Lock virtual cursors",
    },
    {
      "<Esc>",
      "<Cmd>MultipleCursorsLock<CR>",
      mode = "x",
      desc = "Lock virtual cursors",
    },
  },
  config = function()
    require("multiple-cursors").setup {
      -- Custom highlight group for multiple cursors
      custom_key_maps = {
        -- Enable standard vim operations with multiple cursors
        { "c", "MultipleCursorsStart" },
        { "s", "MultipleCursorsStart" },
        { "S", "MultipleCursorsStart" },
        { "x", "MultipleCursorsStart" },
        { "d", "MultipleCursorsStart" },
        { "y", "MultipleCursorsStart" },
      },
    }
  end,
}
