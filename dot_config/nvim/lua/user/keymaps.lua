-- Space is my leader.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided.
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Reselect visual selection after indenting.
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Maintain the cursor position when yanking a visual selection.
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
vim.keymap.set('v', 'y', 'myy`y')

-- Disable annoying command line typo.
vim.keymap.set('n', 'q:', ':q')

-- Paste replace visual selection without copying it.
vim.keymap.set('v', 'p', '"_dP')

-- Easy insertion of a trailing ; or , from insert mode.
vim.keymap.set('i', ';;', '<Esc>A;')
vim.keymap.set('i', ',,', '<Esc>A,')

-- Quickly clear search highlighting.
vim.keymap.set('n', '<Leader>k', ':nohlsearch<CR>')

-- Open the current file in the default program (on Mac this should just be just `open`).
vim.keymap.set('n', '<Leader>x', ':!xdg-open %<CR><CR>')

-- Move lines up and down.
vim.keymap.set('i', '<A-j>', '<Esc>:move .+1<CR>==gi')
vim.keymap.set('i', '<A-k>', '<Esc>:move .-2<CR>==gi')
vim.keymap.set('n', '<A-j>', ':move .+1<CR>==')
vim.keymap.set('n', '<A-k>', ':move .-2<CR>==')
vim.keymap.set('v', '<A-j>', ":move '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-k>', ":move '<-2<CR>gv=gv")

-- Buffer switching
vim.keymap.set('n', '<C-t>', ':b#<CR>')
vim.keymap.set('i', '<C-t>', '<Esc>:b#<CR>')


--- Harpoon
-- vim.keymap.set('n', '<C-e>l', ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
-- vim.keymap.set('n', '<C-e>m', ':lua require("harpoon.mark").add_file()<CR>')
-- vim.keymap.set('n', '<C-e>l', ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
-- vim.keymap.set('n', '<C-e>1', ':lua require("harpoon.ui").nav_file(1)<CR>')
-- vim.keymap.set('n', '<C-e>2', ':lua require("harpoon.ui").nav_file(2)<CR>')
-- vim.keymap.set('n', '<C-e>3', ':lua require("harpoon.ui").nav_file(3)<CR>')
-- vim.keymap.set('n', '<C-e>4', ':lua require("harpoon.ui").nav_file(4)<CR>')
-- vim.keymap.set('i', '<C-e>1', '<Esc>:lua require("harpoon.ui").nav_file(1)<CR>')
-- vim.keymap.set('i', '<C-e>2', '<Esc>:lua require("harpoon.ui").nav_file(2)<CR>')
-- vim.keymap.set('i', '<C-e>3', '<Esc>:lua require("harpoon.ui").nav_file(3)<CR>')
-- vim.keymap.set('i', '<C-e>4', '<Esc>:lua require("harpoon.ui").nav_file(4)<CR>')
-- vim.keymap.set('n', '<C-e>n', ':lua require("harpoon.ui").nav_next()<CR>')
-- vim.keymap.set('n', '<C-e>p', ':lua require("harpoon.ui").nav_prev()<CR>')
-- vim.keymap.set('i', '<C-e>n', '<Esc>:lua require("harpoon.ui").nav_next()<CR>')
-- vim.keymap.set('i', '<C-e>p', '<Esc>:lua require("harpoon.ui").nav_prev()<CR>')

-- Tabline
vim.keymap.set('n', '<C-e>n', ':TablineBufferNext<CR>')
vim.keymap.set('n', '<C-e>p', ':TablineBufferPrevious<CR>')
vim.keymap.set('i', '<C-e>n', ':TablineBufferNext<CR>')
vim.keymap.set('i', '<C-e>p', ':TablineBufferPrevious<CR>')
vim.keymap.set('n', '<C-e>c', ':TablineTabNew<CR>')
vim.keymap.set('i', '<C-e>c', ':TablineTabNew<CR>')
vim.keymap.set('n', '<C-e>r', ':TablineTabRename ')
vim.keymap.set('i', '<C-e>r', ':TablineTabRename ')
vim.keymap.set('n', '<C-e>&', ':tabn 1<CR>')
vim.keymap.set('i', '<C-e>&', ':tabn 1<CR>')
vim.keymap.set('n', '<C-e>é', ':tabn 2<CR>')
vim.keymap.set('i', '<C-e>é', ':tabn 2<CR>')
vim.keymap.set('n', '<C-e>"', ':tabn 3<CR>')
vim.keymap.set('i', '<C-e>"', ':tabn 3<CR>')
vim.keymap.set('n', "<C-e>'", ':tabn 4<CR>')
vim.keymap.set('i', "<C-e>'", ':tabn 4<CR>')
vim.keymap.set('n', '<C-e>(', ':tabn 5<CR>')
vim.keymap.set('i', '<C-e>(', ':tabn 5<CR>')
vim.keymap.set('n', '<C-e>-', ':tabn 6<CR>')
vim.keymap.set('i', '<C-e>-', ':tabn 6<CR>')
vim.keymap.set('n', '<C-e>è', ':tabn 7<CR>')
vim.keymap.set('i', '<C-e>è', ':tabn 7<CR>')
vim.keymap.set('n', '<Leader>&', ':tabn 1<CR>')
vim.keymap.set('n', '<Leader>é', ':tabn 2<CR>')
vim.keymap.set('n', '<Leader>"', ':tabn 3<CR>')
vim.keymap.set('n', "<Leader>'", ':tabn 4<CR>')
vim.keymap.set('n', '<Leader>(', ':tabn 5<CR>')
vim.keymap.set('n', '<Leader>-', ':tabn 6<CR>')
vim.keymap.set('n', '<Leader>è', ':tabn 7<CR>')
