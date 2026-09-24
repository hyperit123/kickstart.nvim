-- Claude Code inside Neovim
-- Opens the `claude` CLI in a split and lets it see your open files and selections.
-- Requires the Claude Code CLI: https://docs.claude.com/en/docs/claude-code
-- https://github.com/coder/claudecode.nvim

---@module 'lazy'
---@type LazySpec
return {
  'coder/claudecode.nvim',
  dependencies = { 'folke/snacks.nvim' },
  opts = {},
  keys = {
    { '<leader>ac', '<cmd>ClaudeCode<CR>', desc = 'Toggle [C]laude' },
    { '<leader>af', '<cmd>ClaudeCodeFocus<CR>', desc = '[F]ocus Claude' },
    { '<leader>ar', '<cmd>ClaudeCode --resume<CR>', desc = '[R]esume Claude' },
    { '<leader>aC', '<cmd>ClaudeCode --continue<CR>', desc = '[C]ontinue Claude' },
    { '<leader>ab', '<cmd>ClaudeCodeAdd %<CR>', desc = 'Add current [B]uffer' },
    { '<leader>as', '<cmd>ClaudeCodeSend<CR>', mode = 'v', desc = '[S]end selection to Claude' },
    { '<leader>aa', '<cmd>ClaudeCodeDiffAccept<CR>', desc = '[A]ccept diff' },
    { '<leader>ad', '<cmd>ClaudeCodeDiffDeny<CR>', desc = '[D]eny diff' },
  },
}
