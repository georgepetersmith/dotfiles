return {
  'lewis6991/gitsigns.nvim',
  tag = 'release',
  event = 'BufEnter',
  opts = {
    current_line_blame = true,
    current_line_blame_opts = {
      ignore_whitespace = true,
    },
  }
}
