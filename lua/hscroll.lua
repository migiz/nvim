-- Smooth horizontal scrolling: the sideways counterpart to vim-smoothie's
-- `<C-d>`/`<C-u>`. vim-smoothie only implements the four vertical commands, and
-- Neovide animates vertical grid scrolls itself but not horizontal ones, so
-- drive the animation through snacks, which is already animating here.

local M = {}

--- Scroll a window sideways by half its width, a few columns per frame.
---@param direction integer negative scrolls left, positive scrolls right
---@param win? integer window to scroll, defaults to the current one
function M.scroll(direction, win)
  win = win or vim.api.nvim_get_current_win()
  if not vim.api.nvim_win_is_valid(win) then return end

  local columns = math.max(1, math.floor(vim.api.nvim_win_get_width(win) / 2))
  local key = direction < 0 and "zh" or "zl"
  local scrolled = 0

  require("snacks").animate.add(0, columns, function(value)
    local step = value - scrolled
    if step < 1 or not vim.api.nvim_win_is_valid(win) then return end
    scrolled = value
    vim.api.nvim_win_call(win, function() vim.cmd(("normal! %d%s"):format(step, key)) end)
  end, {
    int = true,
    duration = { total = 150 },
    easing = "outCubic",
    id = ("hscroll:%d"):format(win), -- one animation per window, restarted on repeat
  })
end

return M
