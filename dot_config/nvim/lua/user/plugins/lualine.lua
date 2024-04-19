local separator = { '"▏"', color = 'StatusLineNonText' }

require('lualine').setup({
  options = {
    section_separators = '',
    component_separators = '',
    globalstatus = true,
    icons_enabled = true,
    theme = 'tokyonight',
    -- theme = {
    --   normal = {
    --     a = 'StatusLine',
    --     b = 'StatusLine',
    --     c = 'StatusLine',
    --   },
    -- },
  },
  sections = {
    lualine_a = {
      'mode',
      separator,
    },
    lualine_b = {
      'branch', 'diff', 'diagnostics', separator
    },
    -- lualine_b = {
    --   'branch',
    --   'diff',
    --   separator,
    --   '"🖧  " .. tostring(#vim.tbl_keys(vim.lsp.buf_get_clients()))',
    --   { 'diagnostics', sources = { 'nvim_diagnostic' } },
    --   separator,
    -- },
    lualine_c = {
      'filename'
    },
    lualine_x = {
      'copilot',
      separator,
      'filetype',
      'encoding',
      'fileformat',
    },
    lualine_y = {
      separator,
      '(vim.bo.expandtab and "␠ " or "⇥ ") .. " " .. vim.bo.shiftwidth',
      separator,
    },
    lualine_z = {
      'location',
      'progress',
    },
  },
})
