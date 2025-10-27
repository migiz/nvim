-- Neo-tree Overrides
---@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.popup_border_style = "rounded"

    opts.indent = opts.indent or {}
    opts.indent.padding = 1

    opts.filesystem = opts.filesystem or {}
    opts.filesystem.follow_current_file = opts.filesystem.follow_current_file or {}
    opts.filesystem.follow_current_file.enabled = true

    opts.filesystem.filtered_items = opts.filesystem.filtered_items or {}
    local filtered = opts.filesystem.filtered_items
    filtered.visible = false
    filtered.hide_dotfiles = false
    filtered.hide_gitignored = false
    filtered.hide_hidden = false
    filtered.hide_by_name = { "node_modules", "__pycache__" }
    filtered.never_show = { ".DS_Store", "__pycache__", "thumbs.db", ".pytest_cache" }

    return opts
  end,
}
