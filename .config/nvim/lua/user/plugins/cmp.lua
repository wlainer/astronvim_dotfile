return {
  -- override nvim-autopairs plugin
  "hrsh7th/nvim-cmp",
  -- override the options table that is used in the `require("cmp").setup()` call
  opts = function(_, opts)
    -- opts parameter is the default options table
    -- the function is lazy loaded so cmp is able to be required
    local cmp = require "cmp"

    opts.mapping["<CR>"] = cmp.mapping(function(fallback)
      -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
      if cmp.visible() then
        local entry = cmp.get_selected_entry()
        if not entry then cmp.select_next_item { behavior = cmp.SelectBehavior.Select } end
        cmp.confirm()
      else
        fallback()
      end
    end, { "i", "s", "c" })

    opts.performance = {
      debounce = 300,
      throttle = 120,
      fetching_timeout = 100,
    }

    opts.sorting = {
      comparators = {
        cmp.config.compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
        cmp.config.compare.offset,
      },
    }

    -- return the new table to be used
    return opts
  end,
}
