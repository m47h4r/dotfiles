-- auto format on save
local augroup = vim.api.nvim_create_augroup('fmt', {clear = true})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  group = augroup,
  command = 'Neoformat'
})

