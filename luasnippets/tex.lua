local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local d = ls.dynamic_node
local sn = ls.snippet_node
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

-- Include this `is_math` function at the start of a snippets file...
local is_math = function()
  -- The `in_mathzone` function requires the VimTeX plugin
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
--
local is_not_math = function()
  -- The `in_mathzone` function requires the VimTeX plugin
  return vim.fn['vimtex#syntax#in_mathzone']() ~= 1
end
-- Then include `condition = is_math / is_not_math` to any snippet you want to
-- expand only in math contexts.

-- ----------------------------------------
-- --
-- --  Generic Matrix generator
-- --
-- ----------------------------------------
--
-- local matrix_content = function(args)
--   local rows = tonumber(args[1][1]) or 2
--   local cols = tonumber(args[2][1]) or 2
--
--   local nodes = {}
--   local idx = 1
--
--   for r = 1, rows do
--     for c = 1, cols do
--       table.insert(nodes, i(idx))
--       idx = idx + 1
--       if c < cols then
--         table.insert(nodes, t ' & ')
--       end
--     end
--     if r < rows then
--       table.insert(nodes, t { ' \\\\', '\t' })
--     end
--   end
--
--   return sn(nil, nodes)
-- end
--
--[[
--
-- NOTE: Snippets below
--
--]]

return {

  -- Hyperref
  s(
    { trig = 'hr', dscr = "The hyperref package's href{}{} command (for url links)" },
    fmt([[\href{<>}{<>}]], {
      i(1, 'url'),
      i(2, 'display name'),
    }, {
      delimiters = '<>',
    })
  ),

  -- -- display math \[ \]
  -- s(
  --   {
  --     trig = 'dm',
  --     dscr = 'Display math',
  --     snippetType = 'autosnippet',
  --   },
  --   fmt(
  --     [[
  --     \[
  --       <>
  --     \]
  --     ]],
  --     { i(1) },
  --     { delimiters = '<>' }
  --   )
  -- ),
  --
  -- -- inline math \( \)
  -- s(
  --   {
  --     trig = 'fm',
  --     dscr = 'Inline math',
  --     snippetType = 'autosnippet',
  --   },
  --   fmt('\\(<>\\)', {
  --     i(1),
  --   }, {
  --     delimiters = '<>',
  --   })
  -- ),
  --
  --   -- Matrix
  --   s(
  --     'mat',
  --     fmt(
  --       [[
  -- % <rows> x <cols> matrix
  -- \begin{<type>matrix}
  -- 	<content>
  -- \end{<type_rep>matrix}
  -- ]],
  --       {
  --         rows = i(1, '2'),
  --         cols = i(2, '2'),
  --         type = i(3, 'p'),
  --         content = d(4, matrix_content, { 1, 2 }),
  --         type_rep = rep(3),
  --       },
  --       { delimiters = '<>' }
  --     )
  --   ),
}
