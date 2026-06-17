-- Customize nvim-autopairs

---@type LazySpec
return {
  "windwp/nvim-autopairs",
  config = function(plugin, opts)
    -- Run AstroNvim's default autopairs setup first.
    require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts)

    -- Don't auto-close a backtick when two already precede it, so typing ``` for a
    -- fenced code block doesn't leave a trailing pair to navigate around. Inline
    -- `code` still pairs normally.
    local npairs = require "nvim-autopairs"
    local cond = require "nvim-autopairs.conds"
    for _, rule in ipairs(npairs.get_rules "`") do
      rule:with_pair(cond.not_before_text "``")
    end
  end,
}
