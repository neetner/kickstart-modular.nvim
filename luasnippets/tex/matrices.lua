-- import conditions
local cond, opts = dofile(vim.fn.stdpath 'config' .. '/luasnippets/tex/util.lua')

----------------------------------------
--
--  Generic Matrix generator
--
----------------------------------------

local matrix_content = function(args)
  local rows = tonumber(args[1][1]) or 2
  local cols = tonumber(args[2][1]) or 2

  local nodes = {}
  local idx = 1

  for r = 1, rows do
    for c = 1, cols do
      table.insert(nodes, i(idx))
      idx = idx + 1
      if c < cols then
        table.insert(nodes, t ' & ')
      end
    end
    if r < rows then
      table.insert(nodes, t { ' \\\\', '\t' })
    end
  end

  return sn(nil, nodes)
end

return {

  -- Matrix
  s(
    'mat',
    fmt(
      [[
% <rows> x <cols> matrix
\begin{<type>matrix}
	<content>
\end{<type_rep>matrix}
]],
      {
        rows = i(1, '2'),
        cols = i(2, '2'),
        type = i(3, 'p'),
        content = d(4, matrix_content, { 1, 2 }),
        type_rep = rep(3),
      },
      { delimiters = '<>' }
    ),
    {
      priority = 2000,
      conditions = cond.is_math,
      show_condition = cond.is_math,
    }
  ),
}
