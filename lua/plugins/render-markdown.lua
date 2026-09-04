-- Reading Markdown is the common case here, so render as much of it as possible.
--
-- Two things get in the way by default:
--   * render-markdown only renders the range visible in a window and refreshes
--     from its own buffer-local events. Neither reaches a snacks picker
--     preview: snacks renders it once when the file loads, so the preview stops
--     being rendered as soon as it scrolls.
--   * `anti_conceal` strips rendering from the line the cursor is on, which is
--     what you want while editing and a distraction while reading.

local plugin_name = "render-markdown.nvim"

---@return table
local function resolved_opts()
  local plugin = require("lazy.core.config").spec.plugins[plugin_name]
  return require("lazy.core.plugin").values(plugin, "opts", false)
end

--- Re-render the preview of any snacks picker whose window just scrolled.
local function render_scrolled_previews()
  if not package.loaded["render-markdown"] or not package.loaded["snacks"] then return end

  local previews = {} ---@type table<integer, boolean>
  for _, picker in ipairs(require("snacks").picker.get()) do
    local win = vim.tbl_get(picker, "preview", "win", "win")
    if win then previews[win] = true end
  end

  for key in pairs(vim.v.event) do
    local win = tonumber(key)
    if win and previews[win] and vim.api.nvim_win_is_valid(win) then
      local buf = vim.api.nvim_win_get_buf(win)
      if vim.bo[buf].filetype:find "^markdown" then
        require("render-markdown").render { buf = buf, win = win, event = "Scroll" }
      end
    end
  end
end

local reading = true

--- Swap between reading (cursor line stays rendered) and editing (it does not).
local function toggle_reading_mode()
  reading = not reading
  local opts = resolved_opts()
  opts.anti_conceal = vim.tbl_extend("force", opts.anti_conceal or {}, { enabled = not reading })

  local render_markdown = require "render-markdown"
  render_markdown.setup(opts)
  render_markdown.set(true) -- redraw every attached buffer with the new config

  require("astrocore").notify(("Markdown reading mode %s"):format(reading and "on" or "off"))
end

---@type LazySpec
return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = { anti_conceal = { enabled = false } },
  },
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      autocmds = {
        render_markdown_preview = {
          {
            event = "WinScrolled",
            desc = "Re-render Markdown in scrolled snacks picker previews",
            callback = render_scrolled_previews,
          },
        },
      },
      mappings = {
        n = {
          ["<Leader>ur"] = { toggle_reading_mode, desc = "Toggle Markdown reading mode" },
        },
      },
    },
  },
}
