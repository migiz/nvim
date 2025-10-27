-- Configure nvim-spider to stop at punctuation instead of skipping over it
-- This ensures operators like `yw` only yank the word without trailing punctuation

---@type LazySpec
return {
  "chrisgrieser/nvim-spider",
  opts = {
    skipInsignificantPunctuation = false,
  },
}
