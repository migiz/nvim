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
  { import = "astrocommunity.color.transparent-nvim" },
  { import = "astrocommunity.color.nvim-highlight-colors" },
  { import = "astrocommunity.bars-and-lines.lualine-nvim" },
  { import = "astrocommunity.bars-and-lines.dropbar-nvim" },
  { import = "astrocommunity.scrolling.vim-smoothie" },
  { import = "astrocommunity.markdown-and-latex.render-markdown-nvim" },
  { import = "astrocommunity.recipes.disable-tabline" },
  { import = "astrocommunity.git.blame-nvim" },
  { import = "astrocommunity.recipes.diagnostic-virtual-lines-current-line" },
  { import = "astrocommunity.editing-support.nvim-devdocs" },
  { import = "astrocommunity.recipes.astrolsp-no-insert-inlay-hints" },
  { import = "astrocommunity.recipes.neo-tree-dark" },
  -- ----------------------------------------------
  -- Motions and UX
  -- ----------------------------------------------
  { import = "astrocommunity.terminal-integration.vim-tmux-yank" },
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  { import = "astrocommunity.utility.nvim-toggler" },
  { import = "astrocommunity.editing-support.dial-nvim" },
  { import = "astrocommunity.editing-support.suda-vim" },
  { import = "astrocommunity.editing-support.text-case-nvim" },
  { import = "astrocommunity.lsp.inc-rename-nvim" },
  -- { import = "astrocommunity.lsp.lsp-lens-nvim" },
  -- { import = "astrocommunity.lsp.lspsaga-nvim" },
  { import = "astrocommunity.lsp.nvim-lint" },
  -- { import = "astrocommunity.motion.nvim-spider" },
  { import = "astrocommunity.editing-support.multiple-cursors-nvim" },
  -- { import = "astrocommunity.code-runner.conjure" },
  -- { import = "astrocommunity.editing-support.nvim-parinfer" },
  { import = "astrocommunity.motion.hop-nvim" },
  { import = "astrocommunity.editing-support.quick-scope" },
  { import = "astrocommunity.lsp.garbage-day-nvim" },
  { import = "astrocommunity.motion.mini-basics" },
  -- { import = "astrocommunity.motion.mini-surround" },
  { import = "astrocommunity.motion.mini-ai" },
  -- { import = "astrocommunity.motion.mini-move" },
  { import = "astrocommunity.utility.nvim-toggler" },
  { import = "astrocommunity.editing-support.refactoring-nvim" },
  -- ----------------------------------------------
  -- Packs
  -- --------------------------------------------
  { import = "astrocommunity.editing-support.nvim-treesitter-endwise" },
  { import = "astrocommunity.pack.elixir-phoenix" },
  { import = "astrocommunity.test.neotest" },
  { import = "astrocommunity.pack.biome" },
  { import = "astrocommunity.completion.blink-cmp-tmux" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.fish" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.golangci-lint" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.rust" },
  -- { import = "astrocommunity.pack.haskell" },
  { import = "astrocommunity.pack.spring-boot" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.sql" },
  { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.programming-language-support.csv-vim" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.full-dadbod" },
  { import = "astrocommunity.docker.lazydocker" },
}
