-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- Basic configuration
    colorscheme = "catppuccin-nvim",

    highlights = {
      init = function()
        local get_hlgroup = require("astroui").get_hlgroup
        -- Catppuccin draws window separators in `base`/`crust`, both of which
        -- disappear against the buffer background. `surface1` reads as an edge
        -- without drawing attention.
        local separator = { fg = "#45475a" }
        -- The snacks picker inherits float colours (`mantle`), so the explorer
        -- reads as a darker view than the editor. Follow `Normal` instead, which
        -- also keeps it transparent in the terminal.
        local function unfilled(group) return vim.tbl_extend("force", get_hlgroup(group), { bg = "NONE" }) end

        return {
          WinSeparator = separator,
          NeoTreeWinSeparator = separator,
          SnacksPicker = { link = "Normal" },
          SnacksPickerInput = { link = "Normal" },
          SnacksPickerBorder = unfilled "FloatBorder",
          SnacksPickerTitle = unfilled "FloatTitle",
          SnacksPickerFooter = unfilled "FloatFooter",
        }
      end,
    },

    icons = {
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",

      GitAdd = "󰬈",
      GitChange = "󰬔",
      GitDelete = "󰬋",
      GitRenamed = "󰬙",
      GitUntracked = "󰬛",
      GitIgnored = "󰬐",
      GitUnstaged = "󰬜",
      GitStaged = "󰬚",
      GitConflict = "󰬊",
    },
  },
}
