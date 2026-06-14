return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  opts = {
    flavour = "mocha",
    auto_integrations = true,
    integrations = {
      blink_cmp = { style = "bordered" },
      dap = true,
      dap_ui = true,
      dropbar = { enabled = true, color_mode = true },
      gitsigns = true,
      hop = true,
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
      notify = true,
      semantic_tokens = true,
      treesitter = true,
      treesitter_context = true,
      ts_rainbow = false,
      rainbow_delimiters = true,
      which_key = true,
      colorful_winsep = { enabled = true, color = "sapphire" },
    },
  },
  specs = {
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
