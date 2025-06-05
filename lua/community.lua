-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- ----------------------------------------------
  -- UI
  -- ----------------------------------------------
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  { import = "astrocommunity.color.transparent-nvim" },
  { import = "astrocommunity.color.nvim-highlight-colors" },
  { import = "astrocommunity.bars-and-lines.dropbar-nvim" },
  { import = "astrocommunity.scrolling.vim-smoothie" },
  { import = "astrocommunity.markdown-and-latex.render-markdown-nvim" },
  { import = "astrocommunity.recipes.disable-tabline" },
  { import = "astrocommunity.git.blame-nvim" },
  -- ----------------------------------------------
  -- Motions and UX
  -- ----------------------------------------------
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  { import = "astrocommunity.editing-support.dial-nvim" },
  { import = "astrocommunity.editing-support.suda-vim" },
  { import = "astrocommunity.editing-support.text-case-nvim" },
  { import = "astrocommunity.code-runner.conjure" },
  { import = "astrocommunity.motion.hop-nvim" },
  { import = "astrocommunity.motion.mini-basics" },
  { import = "astrocommunity.motion.mini-surround" },
  { import = "astrocommunity.motion.mini-ai" },
  { import = "astrocommunity.motion.mini-move" },
  { import = "astrocommunity.utility.nvim-toggler" },
  -- { import = "astrocommunity.note-taking.neorg" },
  -- ----------------------------------------------
  -- Packs
  -- --------------------------------------------
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.clojure" },
  { import = "astrocommunity.pack.fish" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.sql" },
  { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.pack.full-dadbod" },
  { import = "astrocommunity.docker.lazydocker" },
}
