return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    notifier = {
      enabled = true,
      timeout = 8000,
      width = { min = 40, max = 0.8 },
      height = { min = 1, max = 0.8 },
    },
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
        preview_hscroll_left = function(picker)
          if picker.preview.win:valid() then require("hscroll").scroll(-1, picker.preview.win.win) end
        end,
        preview_hscroll_right = function(picker)
          if picker.preview.win:valid() then require("hscroll").scroll(1, picker.preview.win.win) end
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
            -- The preview has no editable cursor, so let it scroll sideways
            -- freely instead of stopping at the end of the cursor's line.
            preview = { wo = { virtualedit = "all" } },
            list = {
              keys = {
                ["h"] = "navigate_up",
                ["<CR>"] = "confirm_and_close",
                ["l"] = "confirm_nofocus",
                -- `H`/`L` pair with `J`/`K` to scroll the preview; `<CR>` still confirms and closes.
                ["J"] = { "preview_scroll_down", mode = { "i", "n" } },
                ["K"] = { "preview_scroll_up", mode = { "i", "n" } },
                ["H"] = { "preview_hscroll_left", mode = { "i", "n" } },
                ["L"] = { "preview_hscroll_right", mode = { "i", "n" } },
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
