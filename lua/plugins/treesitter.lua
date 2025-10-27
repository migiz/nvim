-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "go",
      "lua",
      "vim",
      "python",
      "clojure",
      "rust",
      "typescript",
      "tsx",
      -- add more arguments for adding more treesitter parsers
    },
  },
}
