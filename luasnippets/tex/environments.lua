-- import conditions
local cond, opts = dofile(vim.fn.stdpath 'config' .. '/luasnippets/tex/util.lua')

-- local auto = { auto = true }
-- local not_math_opts = {
--   condition = cond.combine { cond.is_not_math, cond.not_preceded_by_backslash },
--   show_condition = cond.combine { cond.is_not_math, cond.not_preceded_by_backslash },
-- }
-- local math_opts = {
--   condition = cond.combine { cond.is_math, cond.not_preceded_by_backslash },
--   show_condition = cond.combine { cond.is_math, cond.not_preceded_by_backslash },
-- }
-- local math_auto = {
--   condition = cond.combine { cond.is_math, cond.not_preceded_by_backslash },
--   show_condition = cond.combine { cond.is_math, cond.not_preceded_by_backslash },
--   auto = true,
-- }
-- local not_math_auto = {
--   condition = cond.combine { cond.is_not_math, cond.not_preceded_by_backslash },
--   auto = true,
-- }

return {

  -- SAL ==> begin align*
  s(
    {
      trig = 'SAL',
      dscr = 'begin align autotriggered',
      condition = opts.not_math.condition,
      show_condition = opts.not_math.condition,
      snippetType = 'autosnippet',
    },
    fmt(
      [[
      \begin{align*}
        <content>
      \end{align*}<out>
      ]],
      {
        content = i(1),
        out = i(0),
      },
      { delimiters = '<>' }
    ),
    opts.not_math_auto
  ),

  -- BAL ==> begin align
  s(
    {
      trig = 'BAL',
      dscr = 'begin align autotriggered',
      condition = opts.not_math.condition,
      show_condition = opts.not_math.condition,
      snippetType = 'autosnippet',
    },
    fmt(
      [[
      \begin{align}
        <content>
      \end{align}<out>
      ]],
      {
        content = i(1),
        out = i(0),
      },
      { delimiters = '<>' }
    )
  ),

  -- BEG ==> Begin environment
  s(
    {
      trig = 'BEG',
      dscr = 'begin environment autotriggered',
      condition = opts.not_math.condition,
      show_condition = opts.not_math.condition,
      snippetType = 'autosnippet',
    },
    fmt(
      [[
      \begin{<env>}
        <content>
      \end{<env_rep>}<out>
      ]],
      {
        env = i(1, 'align'),
        content = i(2),
        env_rep = rep(1),
        out = i(0),
      },
      { delimiters = '<>' }
    )
  ),

  -- display math \[ \]
  s(
    {
      trig = 'dm',
      dscr = 'Display math',
      snippetType = 'autosnippet',
    },
    fmt(
      [[
      \[
        <>
      \]
      ]],
      { i(1) },
      { delimiters = '<>' }
    )
  ),

  -- inline math \( \)
  s(
    {
      trig = 'fm',
      dscr = 'Inline math',
      snippetType = 'autosnippet',
    },
    fmt('\\(<>\\)', {
      i(1),
    }, {
      delimiters = '<>',
    })
  ),
}
