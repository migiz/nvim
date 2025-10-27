-- Customize nvim-lint configuration

---@type LazySpec
return {
  "mfussenegger/nvim-lint",
  opts = function(_, opts)
    -- Remove selene from lua linters since lua_ls already handles diagnostics
    -- and has mixed_table warnings disabled
    if opts.linters_by_ft and opts.linters_by_ft.lua then
      opts.linters_by_ft.lua = vim.tbl_filter(function(linter)
        return linter ~= "selene"
      end, opts.linters_by_ft.lua)
    end

    return opts
  end,
}
