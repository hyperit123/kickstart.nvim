-- Extra shortcuts for searching and the file explorer
--
--  Search (Telescope, already set up in init.lua):
--    <leader>sg  Search for a word/text in all files (live grep)
--    <leader>sw  Search for the word under the cursor
--    <leader>sf  Search for files by name
--    <C-p>       Search for files by name (same as <leader>sf)
--
--  File explorer (Neo-tree):
--    <leader>e   Toggle the file explorer
--    \           Reveal the current file in the explorer

vim.keymap.set('n', '<C-p>', function() require('telescope.builtin').find_files() end, { desc = 'Find files' })
vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<CR>', { desc = 'File [E]xplorer' })

---@module 'lazy'
---@type LazySpec
return {}
