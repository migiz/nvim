-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    diagnostics = {
      virtual_text = true,
      virtual_lines = false,
      underline = true,
      update_in_insert = false,
    },
    rooter = {
      detector = {
        "lsp",
        { ".git" },
        { "lua", "Makefile", "package.json", "deps.edn", "pom.xml" },
      },
      autochdir = false,
      notify = true,
    },
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = true, -- sets vim.opt.wrap
        scrolloff = 8,
        timeout = true,
        timeoutlen = 300,
        winborder = "rounded",
      },
      g = { -- vim.g.<key>
      },
    },
    treesitter = {
      highlight = true,
      indent = true,
      auto_install = true,
      ensure_installed = {
        "bash",
        "css",
        "go",
        "gomod",
        "gosum",
        "gowork",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "rust",
        "svelte",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
    mappings = {
      n = {
        ["<Leader>w"] = { "<cmd>silent! wall<cr>", desc = "Save all" },
        ["<Leader>fe"] = {
          function()
            Snacks.picker.explorer {
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
            }
          end,
          desc = "Explorer browser",
        },
      },
      i = {
        ["kj"] = { "<Esc>", desc = "Escape" },
      },
    },
  },
}
