return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    explorer = { enabled = false },
    words = { enabled = true },
    input = {
      icon = " ",
      icon_hl = "SnacksInputIcon",
      icon_pos = "left",
      prompt_pos = "title",
      win = { style = "input" },
      expand = true,
    },
    animate = {
      fps = 240,
    },
    picker = {
      enabled = true,
      prompt = "   ",
      actions = {
        navigate_up = function(picker) picker:action "explorer_up" end,
        confirm_and_close = function(picker)
          picker:action "confirm"
          picker:action "close"
        end,
        confirm_nofocus = function(picker)
          picker:action "confirm"
          picker:focus()
        end,
      },
      sources = {
        explorer = {
          auto_close = false,
          follow_file = true,
          hidden = true,
          ignored = true,
          tree = true,
          win = {
            list = {
              keys = {
                ["h"] = "navigate_up",
                ["L"] = "confirm_and_close",
                ["l"] = "confirm_nofocus",
                ["J"] = { "preview_scroll_down", mode = { "i", "n" } },
                ["K"] = { "preview_scroll_up", mode = { "i", "n" } },
              },
            },
          },
          layout = {
            preset = "sidebar",
            preview = false,
          },
        },
      },
    },
  },
}
