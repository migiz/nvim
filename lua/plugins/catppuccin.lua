---@type LazySpec
return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  ---@type CatppuccinOptions
  opts = {
    flavour = "mocha",
    integrations = {
      alpha = true,
      cmp = true,
      dap = true,
      dap_ui = true,
      dropbar = { enabled = true, color_mode = true },
      gitsigns = true,
      harpoon = true,
      hop = true,
      illuminate = true,
      indent_blankline = { enabled = true, colored_indent_levels = false },
      lsp_trouble = true,
      markdown = true,
      mason = true,
      mini = { enabled = true },
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
          ok = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
          ok = { "underline" },
        },
        inlay_hints = {
          background = true,
        },
      },
      neotree = true,
      notify = true,
      noice = true,
      semantic_tokens = true,
      symbols_outline = true,
      telescope = true,
      treesitter = true,
      treesitter_context = true,
      ts_rainbow = false,
      rainbow_delimiters = true,
      ufo = true,
      which_key = true,
      window_picker = true,
      colorful_winsep = { enabled = true, color = "sapphire" },
    },
  },
  specs = {
    {
      "akinsho/bufferline.nvim",
      optional = true,
      opts = function(_, opts)
        return require("astrocore").extend_tbl(opts, {
          highlights = require("catppuccin.groups.integrations.bufferline").get(),
        })
      end,
    },
    {
      "nvim-telescope/telescope.nvim",
      optional = true,
      opts = {
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      },
    },
  },
}
