-- import conditions
local cond, opts = dofile(vim.fn.stdpath 'config' .. '/luasnippets/tex/util.lua')

local not_math_opts = { condition = cond.combine { cond.is_not_math, cond.not_preceded_by_backslash } }
local math_opts = { condition = cond.combine { cond.is_math, cond.not_preceded_by_backslash } }
local math_auto = { condition = cond.combine { cond.is_math, cond.not_preceded_by_backslash }, auto = true }
local not_math_auto = { condition = cond.combine { cond.is_not_math, cond.not_preceded_by_backslash }, auto = true }

local command_specs = {
  --============================================================================
  -- GREEK LETTERS (lowercase)
  --============================================================================
  { ';a', '\\alpha', {}, math_auto, 'wrap' },
  { ';b', '\\beta', {}, math_auto, 'wrap' },
  { ';g', '\\gamma', {}, math_auto, 'wrap' },
  { ';d', '\\delta', {}, math_auto, 'wrap' },
  { ';e', '\\varepsilon', {}, math_auto, 'wrap' },
  { ';z', '\\zeta', {}, math_auto, 'wrap' },
  { ';h', '\\eta', {}, math_auto, 'wrap' },
  { ';q', '\\theta', {}, math_auto, 'wrap' },
  { ';i', '\\iota', {}, math_auto, 'wrap' },
  { ';k', '\\kappa', {}, math_auto, 'wrap' },
  { ';l', '\\lambda', {}, math_auto, 'wrap' },
  { ';m', '\\mu', {}, math_auto, 'wrap' },
  { ';n', '\\nu', {}, math_auto, 'wrap' },
  { ';x', '\\xi', {}, math_auto, 'wrap' },
  { ';p', '\\pi', {}, math_auto, 'wrap' },
  { ';r', '\\rho', {}, math_auto, 'wrap' },
  { ';s', '\\sigma', {}, math_auto, 'wrap' },
  { ';t', '\\tau', {}, math_auto, 'wrap' },
  { ';u', '\\upsilon', {}, math_auto, 'wrap' },
  { ';f', '\\varphi', {}, math_auto, 'wrap' },
  { ';c', '\\chi', {}, math_auto, 'wrap' },
  { ';y', '\\psi', {}, math_auto, 'wrap' },
  { ';w', '\\omega', {}, math_auto, 'wrap' },

  -- Variant forms
  { ';ve', '\\epsilon', {}, math_auto, 'wrap' },
  { ';vq', '\\vartheta', {}, math_auto, 'wrap' },
  { ';vp', '\\varpi', {}, math_auto, 'wrap' },
  { ';vr', '\\varrho', {}, math_auto, 'wrap' },
  { ';vs', '\\varsigma', {}, math_auto, 'wrap' },
  { ';vf', '\\phi', {}, math_auto, 'wrap' },

  --============================================================================
  -- GREEK LETTERS (uppercase)
  --============================================================================
  { ';G', '\\Gamma', {}, math_auto, 'wrap' },
  { ';D', '\\Delta', {}, math_auto, 'wrap' },
  { ';Q', '\\Theta', {}, math_auto, 'wrap' },
  { ';L', '\\Lambda', {}, math_auto, 'wrap' },
  { ';X', '\\Xi', {}, math_auto, 'wrap' },
  { ';P', '\\Pi', {}, math_auto, 'wrap' },
  { ';S', '\\Sigma', {}, math_auto, 'wrap' },
  { ';U', '\\Upsilon', {}, math_auto, 'wrap' },
  { ';F', '\\Phi', {}, math_auto, 'wrap' },
  { ';Y', '\\Psi', {}, math_auto, 'wrap' },
  { ';W', '\\Omega', {}, math_auto, 'wrap' },

  --============================================================================
  -- OBSTMATH.STY COMMANDS
  --============================================================================

  -- Operators (no args)
  { 'Ex', '\\Ex', {}, math_opts },
  { 'Pr', '\\Pr', {}, math_opts },
  { 'Var', '\\Var', {}, math_opts },

  -- Simple symbols
  { 'comp', '\\complement', {}, math_auto },
  { 'tp', '\\transpose', {}, math_auto },
  { 'id', '\\id', {}, math_auto },
  { 'cd', '\\dotempty', {}, math_auto },
  { 'mvert', '\\midvert', {}, math_auto },

  -- Differential (optional superscript)
  { 'diff', '\\diff', { 'o' }, math_auto },

  -- Delimiters (1 arg, starred versions auto-size)
  { 'ceil', '\\ceil', { 'm' }, math_opts },
  { 'Ceil', '\\ceil*', { 'm' }, math_opts },
  { 'floor', '\\floor', { 'm' }, math_opts },
  { 'Floor', '\\floor*', { 'm' }, math_opts },
  { 'norm', '\\norm', { 'm' }, math_opts },
  { 'Norm', '\\Norm', { 'm' }, math_opts },
  { 'abs', '\\abs', { 'm' }, math_opts },
  { 'Abs', '\\abs*', { 'm' }, math_opts },

  -- Quantum mechanics
  { 'ket', '\\ket', { 'm' }, math_opts },
  { 'Ket', '\\Ket', { 'm' }, math_opts },
  { 'bra', '\\bra', { 'm' }, math_opts },
  { 'Bra', '\\Bra', { 'm' }, math_opts },
  { 'expval', '\\expval', { 'm' }, math_opts },
  { 'Expval', '\\expval*', { 'm' }, math_opts },
  { 'braket', '\\braket', { 'm', 'm' }, math_opts },
  { 'Braket', '\\Braket', { 'm', 'm' }, math_opts },
  { 'ketbra', '\\ketbra', { 'm', 'm' }, math_opts },
  { 'proj', '\\proj', { 'm' }, math_opts },
  { 'mel', '\\mel', { 'm', 'm', 'm' }, math_opts },
  { 'Mel', '\\Mel', { 'm', 'm', 'm' }, math_opts },

  -- Set notation
  { 'Set', '\\Set', { 'm' }, math_opts },

  -- lr shortcuts (these are special, might need custom handling)
  { 'lr', '\\lr', {}, math_opts },

  --============================================================================
  -- COMMON OPERATORS
  --============================================================================
  { 'int', '\\int', {}, math_opts },
  { 'iint', '\\iint', {}, math_opts },
  { 'iiint', '\\iiint', {}, math_opts },
  { 'oint', '\\oint', {}, math_opts },
  { 'sum', '\\sum', {}, math_opts },
  { 'prod', '\\prod', {}, math_opts },
  { 'lim', '\\lim', {}, math_opts },
  { 'sup', '\\sup', {}, math_opts },
  { 'inf', '\\inf', {}, math_opts },
  { 'max', '\\max', {}, math_opts },
  { 'min', '\\min', {}, math_opts },
  { 'arg', '\\arg', {}, math_opts },
  { 'det', '\\det', {}, math_opts },
  { 'dim', '\\dim', {}, math_opts },
  { 'ker', '\\ker', {}, math_opts },
  { 'im', '\\operatorname{im}', {}, math_opts },
  { 'rank', '\\operatorname{rank}', {}, math_opts },
  { 'tr', '\\operatorname{tr}', {}, math_opts },
  { 'Tr', '\\operatorname{Tr}', {}, math_opts },
  { 'diag', '\\operatorname{diag}', {}, math_opts },
  { 'span', '\\operatorname{span}', {}, math_opts },
  { 'supp', '\\operatorname{supp}', {}, math_opts },
  { 'sgn', '\\operatorname{sgn}', {}, math_opts },

  --============================================================================
  -- TRIG / HYPERBOLIC
  --============================================================================
  { 'sin', '\\sin', {}, math_opts },
  { 'cos', '\\cos', {}, math_opts },
  { 'tan', '\\tan', {}, math_opts },
  { 'cot', '\\cot', {}, math_opts },
  { 'sec', '\\sec', {}, math_opts },
  { 'csc', '\\csc', {}, math_opts },
  { 'arcsin', '\\arcsin', {}, math_opts },
  { 'arccos', '\\arccos', {}, math_opts },
  { 'arctan', '\\arctan', {}, math_opts },
  { 'sinh', '\\sinh', {}, math_opts },
  { 'cosh', '\\cosh', {}, math_opts },
  { 'tanh', '\\tanh', {}, math_opts },
  { 'coth', '\\coth', {}, math_opts },
  { 'exp', '\\exp', {}, math_opts },
  { 'log', '\\log', {}, math_opts },
  { 'ln', '\\ln', {}, math_opts },
  { 'lg', '\\lg', {}, math_opts },

  --============================================================================
  -- RELATIONS
  --============================================================================
  { 'leq', '\\leq', {}, math_auto },
  { 'geq', '\\geq', {}, math_auto },
  { 'neq', '\\neq', {}, math_auto },
  { 'approx', '\\approx', {}, math_auto },
  { 'equiv', '\\equiv', {}, math_auto },
  { 'sim', '\\sim', {}, math_auto },
  { 'simeq', '\\simeq', {}, math_auto },
  { 'cong', '\\cong', {}, math_auto },
  { 'propto', '\\propto', {}, math_auto },
  { 'll', '\\ll', {}, math_auto },
  { 'gg', '\\gg', {}, math_auto },
  { 'prec', '\\prec', {}, math_auto },
  { 'succ', '\\succ', {}, math_auto },
  { 'preceq', '\\preceq', {}, math_auto },
  { 'succeq', '\\succeq', {}, math_auto },

  --============================================================================
  -- SET RELATIONS
  --============================================================================
  { 'in', '\\in', {}, math_auto },
  { 'nin', '\\notin', {}, math_auto },
  { 'ni', '\\ni', {}, math_auto },
  { 'subset', '\\subset', {}, math_auto },
  { 'supset', '\\supset', {}, math_auto },
  { 'subseteq', '\\subseteq', {}, math_auto },
  { 'supseteq', '\\supseteq', {}, math_auto },
  { 'subsetneq', '\\subsetneq', {}, math_auto },
  { 'supsetneq', '\\supsetneq', {}, math_auto },
  { 'cap', '\\cap', {}, math_auto },
  { 'cup', '\\cup', {}, math_auto },
  { 'sqcap', '\\sqcap', {}, math_auto },
  { 'sqcup', '\\sqcup', {}, math_auto },
  { 'setminus', '\\setminus', {}, math_auto },
  { 'emptyset', '\\emptyset', {}, math_auto },

  --============================================================================
  -- ARROWS
  --============================================================================
  { 'to', '\\to', {}, math_auto },
  { 'mapsto', '\\mapsto', {}, math_auto },
  { 'gets', '\\gets', {}, math_auto },
  { 'iff', '\\iff', {}, math_auto },
  { 'implies', '\\implies', {}, math_auto },
  { 'impliedby', '\\impliedby', {}, math_auto },
  { '->', '\\rightarrow', {}, math_auto },
  { '<-', '\\leftarrow', {}, math_auto },
  { '=>', '\\Rightarrow', {}, math_auto },
  { '<=', '\\Leftarrow', {}, math_auto },
  { '<->', '\\leftrightarrow', {}, math_auto },
  { '<=>', '\\Leftrightarrow', {}, math_auto },
  { 'h->', '\\hookrightarrow', {}, math_auto },
  { 'h<-', '\\hookleftarrow', {}, math_auto },
  { 'x->', '\\xrightarrow', { 'o', 'm' }, math_opts },
  { 'x<-', '\\xleftarrow', { 'o', 'm' }, math_opts },

  --============================================================================
  -- MISC SYMBOLS
  --============================================================================
  { 'infty', '\\infty', {}, math_auto },
  { 'oo', '\\infty', {}, math_auto },
  { 'pm', '\\pm', {}, math_auto },
  { 'mp', '\\mp', {}, math_auto },
  { 'xx', '\\times', {}, math_auto },
  { 'cdot', '\\cdot', {}, math_auto },
  { 'circ', '\\circ', {}, math_auto },
  { 'ox', '\\otimes', {}, math_auto },
  { 'oplus', '\\oplus', {}, math_auto },
  { 'odot', '\\odot', {}, math_auto },
  { 'dagger', '\\dagger', {}, math_auto },
  { 'ddagger', '\\ddagger', {}, math_auto },
  { 'star', '\\star', {}, math_auto },
  { 'ast', '\\ast', {}, math_auto },
  { 'perp', '\\perp', {}, math_auto },
  { 'parallel', '\\parallel', {}, math_auto },

  -- Calculus
  { 'nabla', '\\nabla', {}, math_auto },
  { 'partial', '\\partial', {}, math_auto },
  { 'grad', '\\nabla', {}, math_auto },
  { 'ell', '\\ell', {}, math_auto },
  { 'hbar', '\\hbar', {}, math_auto },
  { 'Re', '\\Re', {}, math_opts },
  { 'Im', '\\Im', {}, math_opts },

  -- Dots
  { 'ldots', '\\ldots', {}, math_auto },
  { 'cdots', '\\cdots', {}, math_auto },
  { 'vdots', '\\vdots', {}, math_auto },
  { 'ddots', '\\ddots', {}, math_auto },

  -- Logic
  { 'forall', '\\forall', {}, math_auto },
  { 'exists', '\\exists', {}, math_auto },
  { 'nexists', '\\nexists', {}, math_auto },
  { 'land', '\\land', {}, math_auto },
  { 'lor', '\\lor', {}, math_auto },
  { 'lnot', '\\lnot', {}, math_auto },
  { 'neg', '\\neg', {}, math_auto },

  --============================================================================
  -- FONT COMMANDS (1 arg)
  --============================================================================
  { 'mcal', '\\mathcal', { 'm' }, math_auto, 'wrap' },
  { 'mbb', '\\mathbb', { 'm' }, math_auto, 'wrap' },
  { 'mbf', '\\mathbf', { 'm' }, math_auto, 'wrap' },
  { 'mrm', '\\mathrm', { 'm' }, math_auto, 'wrap' },
  { 'msf', '\\mathsf', { 'm' }, math_auto, 'wrap' },
  { 'mtt', '\\mathtt', { 'm' }, math_auto, 'wrap' },
  { 'mfrak', '\\mathfrak', { 'm' }, math_auto, 'wrap' },
  { 'mscr', '\\mathscr', { 'm' }, math_auto, 'wrap' },
  { 'bm', '\\bm', { 'm' }, math_auto },
  { 'text', '\\text', { 'm' }, math_auto },

  { 'tbf', '\\textbf', { 'm' }, not_math_auto },
  { 'tit', '\\textit', { 'm' }, not_math_auto },
  { 'tsl', '\\textsl', { 'm' }, not_math_auto },
  { 'tsc', '\\textsc', { 'm' }, not_math_auto },
  { 'trm', '\\textrm', { 'm' }, not_math_auto },
  { 'tsf', '\\textsf', { 'm' }, not_math_auto },
  { 'ttt', '\\texttt', { 'm' }, not_math_auto },
  { 'tup', '\\textup', { 'm' }, not_math_auto },
  { 'emph', '\\emph', { 'm' }, not_math_auto },
  { 'uline', '\\underline', { 'm' }, not_math_auto },

  -- Common blackboard bold
  { 'RR', '\\mathbb{R}', {}, math_auto, 'wrap' },
  { 'CC', '\\mathbb{C}', {}, math_auto, 'wrap' },
  { 'NN', '\\mathbb{N}', {}, math_auto, 'wrap' },
  { 'ZZ', '\\mathbb{Z}', {}, math_auto, 'wrap' },
  { 'QQ', '\\mathbb{Q}', {}, math_auto, 'wrap' },
  { 'HH', '\\mathbb{H}', {}, math_auto, 'wrap' },
  { 'FF', '\\mathbb{F}', {}, math_auto, 'wrap' },
  { 'OO', '\\mathbb{O}', {}, math_auto, 'wrap' },
  { 'AA', '\\mathbb{A}', {}, math_auto, 'wrap' },

  --============================================================================
  -- ACCENTS (1 arg)
  --============================================================================
  { 'hat', '\\hat', { 'm' }, math_opts },
  { 'widehat', '\\widehat', { 'm' }, math_opts },
  { 'bar', '\\bar', { 'm' }, math_opts },
  { 'overline', '\\overline', { 'm' }, math_opts },
  { 'tilde', '\\tilde', { 'm' }, math_opts },
  { 'widetilde', '\\widetilde', { 'm' }, math_opts },
  { 'vec', '\\vec', { 'm' }, math_opts },
  { 'dot', '\\dot', { 'm' }, math_opts },
  { 'ddot', '\\ddot', { 'm' }, math_opts },
  { 'acute', '\\acute', { 'm' }, math_opts },
  { 'grave', '\\grave', { 'm' }, math_opts },
  { 'breve', '\\breve', { 'm' }, math_opts },
  { 'check', '\\check', { 'm' }, math_opts },

  --============================================================================
  -- TWO-ARG COMMANDS
  --============================================================================
  { 'frac', '\\frac', { 'm', 'm' }, math_opts },
  { 'dfrac', '\\dfrac', { 'm', 'm' }, math_opts },
  { 'tfrac', '\\tfrac', { 'm', 'm' }, math_opts },
  { 'nfrac', '\\nicefrac', { 'm', 'm' }, math_opts },
  { 'binom', '\\binom', { 'm', 'm' }, math_opts },
  { 'dbinom', '\\dbinom', { 'm', 'm' }, math_opts },
  { 'tbinom', '\\tbinom', { 'm', 'm' }, math_opts },
  { 'overset', '\\overset', { 'm', 'm' }, math_opts },
  { 'underset', '\\underset', { 'm', 'm' }, math_opts },
  { 'stackrel', '\\stackrel', { 'm', 'm' }, math_opts },

  --============================================================================
  -- ROOTS
  --============================================================================
  { 'sqrt', '\\sqrt', { 'o', 'm' }, math_opts },

  --============================================================================
  -- DELIMITERS (manual)
  --============================================================================
  { 'langle', '\\langle', {}, math_auto },
  { 'rangle', '\\rangle', {}, math_auto },
  { 'lvert', '\\lvert', {}, math_auto },
  { 'rvert', '\\rvert', {}, math_auto },
  { 'lVert', '\\lVert', {}, math_auto },
  { 'rVert', '\\rVert', {}, math_auto },
  { 'lceil', '\\lceil', {}, math_auto },
  { 'rceil', '\\rceil', {}, math_auto },
  { 'lfloor', '\\lfloor', {}, math_auto },
  { 'rfloor', '\\rfloor', {}, math_auto },
}

----------------------------------------
--
--  Generic command snippet generator
--
----------------------------------------

--[[
-- Generic LaTeX command snippet generator
--
-- Usage: make_generic_snippet(trigger, command, arg_spec, opts)
--
-- arg_spec is a list where each element is:
--   'o'              -> optional arg [], hidden by default
--   'm'              -> mandatory arg {}
--   { 'o', 'default' } -> optional arg with default, shown by default
--   { 'm', 'default' } -> mandatory arg with default placeholder
--
-- opts:
--   condition = func  -> expansion condition
--   auto = bool       -> autosnippet
--   dscr = string     -> description
--
-- For optional args, use <C-j>/<C-k> (or your choice_node keys) to toggle
-- between showing [content] and hiding the optional argument entirely.
--]]

local function make_generic_snippet(trig, cmd, arg_spec, opts)
  arg_spec = arg_spec or {}
  opts = opts or {}

  -- No arguments: simple text node
  if #arg_spec == 0 then
    return s({
      trig = trig,
      dscr = opts.dscr or cmd,
      condition = opts.condition,
      snippetType = opts.auto and 'autosnippet' or 'snippet',
    }, { t(cmd) })
  end

  -- Normalize arg specs
  local args = {}
  for _, spec in ipairs(arg_spec) do
    if type(spec) == 'string' then
      table.insert(args, { type = spec, default = '' })
    else
      table.insert(args, { type = spec[1], default = spec[2] or '' })
    end
  end

  -- local c = ls.choice_node
  local nodes = { t(cmd) }
  local idx = 1

  for _, arg in ipairs(args) do
    if arg.type == 'o' then
      -- Optional: choice between showing and hiding
      local shown = sn(nil, { t '[', i(1, arg.default), t ']' })
      local hidden = t ''

      if arg.default ~= '' then
        -- Has default: show by default
        table.insert(nodes, c(idx, { shown, hidden }))
      else
        -- No default: hide by default
        table.insert(nodes, c(idx, { hidden, shown }))
      end
    else
      -- Mandatory: always show
      table.insert(nodes, t '{')
      table.insert(nodes, i(idx, arg.default))
      table.insert(nodes, t '}')
    end
    idx = idx + 1
  end

  return s({
    trig = trig,
    dscr = opts.dscr or cmd,
    condition = opts.condition,
    snippetType = opts.auto and 'autosnippet' or 'snippet',
  }, nodes)
end

-- Generate and return
local snippets = {}
for _, spec in ipairs(command_specs) do
  table.insert(snippets, make_generic_snippet(spec[1], spec[2], spec[3], spec[4]))

  -- Generate \(...\) wrapped variant for non-math contexts
  if spec[5] == 'wrap' then
    table.insert(snippets, make_generic_snippet(spec[1], '\\(' .. spec[2] .. '\\)', spec[3], not_math_auto))
  end
end

return snippets
