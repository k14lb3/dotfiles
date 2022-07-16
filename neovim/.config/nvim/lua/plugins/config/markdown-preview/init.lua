local run = 'cd app && npm install'

local ft = { 'markdown' }

local setup = function()
  vim.g.mkdp_filetypes = { 'markdown' }
end

local config = function()
  vim.g.mkdp_markdown_css = vim.fn.expand(vim.fn.stdpath 'config' .. '/lua/plugins/config/markdown-preview/styles.css')
end

return {
  run = run,
  setup = setup,
  config = config,
  ft = ft,
}
