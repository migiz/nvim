return {
  "neanias/everforest-nvim",
  name = "everforest",
  lazy = false,
  priority = 1000,
  config = function()
    require("everforest").setup {
      background = "medium",
      transparent_background_level = 0,
      italics = true,
      disable_italic_comments = false,
    }
  end,
}
