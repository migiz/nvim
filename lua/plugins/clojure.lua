---@type LazySpec
return {
  "clojure-vim/vim-jack-in",
  "radenling/vim-dispatch-neovim",
  "tpope/vim-dispatch",
  {
    "Olical/conjure",
    ft = { "clojure", "fennel", "python" },
    lazy = true,
    init = function()
      -- vim.g["conjure#debug"] = true

      vim.g["conjure#mapping#doc_word"] = "K"
      vim.g["conjure#mapping#def_word"] = "gd"
    end,

    dependencies = { "PaterJason/cmp-conjure" },
  },
  {
    "PaterJason/cmp-conjure",
    lazy = true,
  },
  -- ------------------------------------------
}
