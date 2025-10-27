return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
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
          auto_close = true,
          hidden = true,
          ignored = true,
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
            preview = true,
            cycle = true,
            layout = {
              box = "horizontal",
              position = "float",
              height = 0.95,
              width = 0,
              border = "rounded",
              {
                box = "vertical",
                width = 40,
                min_width = 40,
                { win = "input", height = 1, title = "{title} {live} {flags}", border = "single" },
                { win = "list" },
              },
              { win = "preview", width = 0, border = "left" },
            },
          },
        },
      },
    },
  },
}
