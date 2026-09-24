-- Git commit / branch / push from inside Neovim
--
--  <leader>gs  Git status (fugitive)
--  <leader>gc  Commit ALL changes (prompts for a message)
--  <leader>gb  Create and switch to a new branch (prompts for a name)
--  <leader>gB  Switch to an existing branch (Telescope picker)
--  <leader>gp  Push the current branch to origin (sets upstream)
--  <leader>gl  Pull
--
-- https://github.com/tpope/vim-fugitive

---@param args string[]
---@param on_success? fun()
local function git(args, on_success)
  vim.system(vim.list_extend({ 'git' }, args), { text = true }, function(result)
    vim.schedule(function()
      local output = vim.trim((result.stdout or '') .. '\n' .. (result.stderr or ''))
      if result.code == 0 then
        vim.notify(output ~= '' and output or ('git ' .. args[1] .. ' done'), vim.log.levels.INFO, { title = 'git' })
        if on_success then on_success() end
      else
        vim.notify(output, vim.log.levels.ERROR, { title = 'git ' .. args[1] .. ' failed' })
      end
    end)
  end)
end

---@module 'lazy'
---@type LazySpec
return {
  'tpope/vim-fugitive',
  cmd = { 'Git', 'G' },
  keys = {
    { '<leader>gs', '<cmd>Git<CR>', desc = '[G]it [S]tatus' },
    {
      '<leader>gc',
      function()
        vim.ui.input({ prompt = 'Commit message: ' }, function(msg)
          if not msg or msg == '' then return end
          git({ 'add', '-A' }, function() git { 'commit', '-m', msg } end)
        end)
      end,
      desc = '[G]it [C]ommit all changes',
    },
    {
      '<leader>gb',
      function()
        vim.ui.input({ prompt = 'New branch name: ' }, function(name)
          if not name or name == '' then return end
          git { 'switch', '-c', name }
        end)
      end,
      desc = '[G]it new [B]ranch',
    },
    { '<leader>gB', function() require('telescope.builtin').git_branches() end, desc = '[G]it switch [B]ranch' },
    { '<leader>gp', function() git { 'push', '-u', 'origin', 'HEAD' } end, desc = '[G]it [P]ush' },
    { '<leader>gl', function() git { 'pull' } end, desc = '[G]it pu[L]l' },
  },
}
