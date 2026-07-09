-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move left!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move right!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move up!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move down!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- NOTE: QoL keymaps
-- Inspired by from: https://btj93.github.io/nvim-keymap-essentials
--
-- Center after jump:
vim.keymap.set('n', 'G', 'Gzz', { noremap = true, desc = 'Go to bottom and center' })
vim.keymap.set('n', 'n', 'nzz', { noremap = true })
vim.keymap.set('n', 'N', 'Nzz', { noremap = true })
vim.keymap.set('n', '*', '*zz', { noremap = true })
vim.keymap.set('n', '#', '#zz', { noremap = true })
vim.keymap.set('n', 'g*', 'g*zz', { noremap = true })
vim.keymap.set('n', 'g#', 'g#zz', { noremap = true })

-- ENTER for blank line in normal mode
vim.keymap.set('n', '<CR>', 'o<Esc>', { noremap = true, desc = 'Add blank line below' })
vim.keymap.set('n', '<S-CR>', 'O<Esc>', { noremap = true, desc = 'Add blank line above' })

-- Duplicate and comment original
--
-- Duplicate and comment LINE in NORMAL mode
vim.keymap.set('n', 'yc', 'yy<cmd>normal gcc<CR>p', { noremap = true, desc = 'Duplicate line and comment original' })

--
-- Duplicate and comment SELECTION in VISUAL mode
local function duplicate_and_comment()
  -- Exit visual mode
  local esc = vim.api.nvim_replace_termcodes('<Esc>', true, false, true)
  vim.api.nvim_feedkeys(esc, 'x', false)

  -- Get selection range
  local start_line = vim.fn.line "'<"
  local end_line = vim.fn.line "'>"

  -- Yank and paste below
  vim.cmd(start_line .. ',' .. end_line .. 'yank')
  vim.cmd((end_line + 1) .. 'put')

  -- Reselect pasted block
  vim.api.nvim_feedkeys('gv', 'n', false)

  -- Comment the original selection
  vim.api.nvim_feedkeys('gc', 'v', false)
end

vim.keymap.set('v', 'yc', duplicate_and_comment, { noremap = true, desc = 'Duplicate selection and comment original' })

--
-- SELECT to START/END_OF_LINE:
vim.keymap.set('n', '<leader>vl', 'vj_', { noremap = true, desc = 'Select to beginning of next line' })
vim.keymap.set('n', '<leader>vh', 'vk$', { noremap = true, desc = 'Select to end of last line' })

--
-- Go to START / END of line
vim.keymap.set({ 'n', 'v' }, 'gh', '_', { noremap = true, desc = 'Go to start of line' })
vim.keymap.set({ 'n', 'v' }, 'gl', '$', { noremap = true, desc = 'Go to end of line' })

--
-- Easier ESCAPE in INSERT mode [jk] OR [JK]
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true, desc = 'Exit insert mode with jk' })
vim.keymap.set('i', 'JK', '<Esc>', { noremap = true, desc = 'Exit insert mode with JK' })

--
-- MOVE in INSERT mode
--
-- Move by character
-- vim.keymap.set('i', '<C-j>', '<Down>', { noremap = true })
-- vim.keymap.set('i', '<C-k>', '<Up>', { noremap = true })
vim.keymap.set('i', '<C-h>', '<Left>', { noremap = true })
vim.keymap.set('i', '<C-l>', '<Right>', { noremap = true })
vim.keymap.set('i', '<C-e>', '<C-o>$', { noremap = true })
--
-- Move by word
vim.keymap.set({ 'i', 'x' }, '<M-l>', '<C-o>w', { noremap = true })
vim.keymap.set({ 'i', 'x' }, '<M-h>', '<C-o>b', { noremap = true })

--
-- YANK (cut) / YANK (copy) / REPLACE to next QUOTE (\", ', `)
vim.keymap.set('n', 'dq', 'v/["\'`]<CR><Left>d<cmd>nohlsearch<CR>', { noremap = true, desc = 'Delete up to next quote' })
vim.keymap.set('n', 'yq', 'v/["\'`]<CR><Left>y<cmd>nohlsearch<CR>', { noremap = true, desc = 'Yank up to next quote' })
vim.keymap.set('n', 'cq', 'v/["\'`]<CR><Left>di<cmd>nohlsearch<CR>', { noremap = true, desc = 'Change up to next quote' })

-- Easy buffer switching
vim.keymap.set('n', '<leader>bn', '<cmd>bn<CR>', { noremap = true, desc = 'Switch to next buffer' })
vim.keymap.set('n', '<leader>bN', '<cmd>bN<CR>', { noremap = true, desc = 'Switch to previous buffer' })

vim.keymap.set('n', '<leader>bb', function()
  require('telescope.builtin').buffers {
    sort_mru = true, -- Sort by most recently used
    ignore_current_buffer = true, -- Don't show current buffer in list
  }
end, { desc = 'List buffers with Telescope' })

for i = 1, 9 do
  vim.keymap.set('n', '<leader>b' .. i, function()
    require('bufferline').go_to(i, true)
  end, { desc = 'Go to buffer ' .. i })
end

--
-- NOTE: END of QoL keymaps.

--
--
-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
