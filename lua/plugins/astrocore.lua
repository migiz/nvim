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
        wrap = false, -- sets vim.opt.wrap
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
        ["<Leader>w"] = { "<cmd>wall<cr>", desc = "Save all" },
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
        ["<Leader>un"] = {
          function() Snacks.notifier.show_history() end,
          desc = "Notification history",
        },
        -- `<C-h>`/`<C-l>` are split navigation, so horizontal scrolling gets Alt.
        ["<M-h>"] = {
          function() require("hscroll").scroll(-1) end,
          desc = "Scroll half a screen left",
        },
        ["<M-l>"] = {
          function() require("hscroll").scroll(1) end,
          desc = "Scroll half a screen right",
        },
      },
      x = {
        -- Wrap a visual-line selection in a ```` ``` ```` fenced code block.
        -- Visual-mode only, so the builtin Normal-mode `ga` (:ascii) is left intact.
        ["ga"] = {
          function()
            local s, e = vim.fn.line "v", vim.fn.line "."
            if s > e then
              s, e = e, s
            end
            vim.cmd [[execute "normal! \<Esc>"]]
            vim.api.nvim_buf_set_lines(0, e, e, false, { "```" })
            vim.api.nvim_buf_set_lines(0, s - 1, s - 1, false, { "```" })
            vim.api.nvim_win_set_cursor(0, { s, 0 })
          end,
          desc = "Fence selection in code block",
        },
      },
    },
  },
}
