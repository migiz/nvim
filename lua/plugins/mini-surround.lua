-- mini.surround with ergonomic `gs` mappings (the default `gz`/`s` prefixes are
-- awkward to reach). `gs<char>` wraps a Visual selection; `gs<motion><char>` works
-- in Normal mode; `gsd`/`gsr` delete/replace an existing surround. The Visual-mode
-- `gsa` (fence a selection in a ``` block) is defined in astrocore mappings.

---@type LazySpec
return {
  "echasnovski/mini.surround",
  event = "User AstroFile",
  specs = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        opts.mappings.n = opts.mappings.n or {}
        opts.mappings.n["gs"] = { desc = "Surround" }
      end,
    },
  },
  opts = {
    mappings = {
      add = "gs", -- Visual: gs<char>; Normal: gs<motion><char>
      delete = "gsd", -- gsd<char>
      replace = "gsr", -- gsr<old><new>
      find = "",
      find_left = "",
      highlight = "",
      update_n_lines = "",
    },
  },
}
