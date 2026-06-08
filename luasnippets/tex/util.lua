-- lua/luasnippets/tex/util.lua
local conditions = {}
local opts = {}

-- Condition functions
conditions.is_math = function()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

conditions.is_not_math = function()
  return vim.fn['vimtex#syntax#in_mathzone']() ~= 1
end

-- conditions.not_preceded_by_backslash = function(line_to_cursor, matched_trigger)
--   return not line_to_cursor:match('\\' .. matched_trigger .. '$')
-- end

conditions.not_preceded_by_backslash = function(context)
  if not context.matched_trigger then
    return true
  end
  return not context.line_to_cursor:match('\\' .. context.matched_trigger .. '$')
end

-- conditions.combine = function(cond_funcs)
--   return function(...)
--     for _, cond in ipairs(cond_funcs) do
--       if not cond(...) then
--         return false
--       end
--     end
--     return true
--   end
-- end

conditions.combine = function(cond_funcs)
  return function(line_to_cursor, matched_trigger)
    local context = { line_to_cursor = line_to_cursor, matched_trigger = matched_trigger }
    for _, cond in ipairs(cond_funcs) do
      local nparams = debug.getinfo(cond, 'u').nparams
      local result
      if nparams == 0 then
        result = cond()
      else
        result = cond(context)
      end
      if not result then
        return false
      end
    end
    return true
  end
end

-- Pre-configured option tables
-- opts.not_math = { condition = conditions.is_not_math, show_condition = conditions.is_not_math }
-- opts.math = { condition = conditions.is_math, show_condition = conditions.is_math }
-- opts.math_auto = { condition = conditions.is_math, auto = true, show_condition = conditions.is_math }

opts.auto = { auto = true }
opts.not_math = {
  condition = conditions.combine { conditions.is_not_math, conditions.not_preceded_by_backslash },
  show_condition = conditions.combine { conditions.is_not_math, conditions.not_preceded_by_backslash },
}
opts.math = {
  condition = conditions.combine { conditions.is_math, conditions.not_preceded_by_backslash },
  show_condition = conditions.combine { conditions.is_math, conditions.not_preceded_by_backslash },
}
opts.math = {
  condition = conditions.combine { conditions.is_math, conditions.not_preceded_by_backslash },
  show_condition = conditions.combine { conditions.is_math, conditions.not_preceded_by_backslash },
  auto = true,
}
opts.not_math = {
  condition = conditions.combine { conditions.is_not_math, conditions.not_preceded_by_backslash },
  auto = true,
}

return conditions, opts
