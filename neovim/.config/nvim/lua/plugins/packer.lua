local fn = vim.fn
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

local packer_bootstrap

if fn.empty(fn.glob(install_path)) > 0 then
  vim.notify 'Installing packer...'
  packer_bootstrap = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
  vim.api.nvim_command 'packadd packer.nvim'
end

local ok, packer = pcall(require, 'packer')

if not ok then
  error 'Could not install packer'
end

packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'single' }
    end,
    prompt_border = 'single',
  },
}

local load = function(fname)
  local ok, res = pcall(require, 'plugins.config.' .. fname)
  if ok then
    return res
  else
    vim.notify('Could not load ' .. fname)
    return {}
  end
end

local use = function(spec)
  if spec.ext then
    spec = vim.tbl_deep_extend('force', spec, load(spec.ext))
    spec.ext = nil
  end
  packer.use(spec)
end

return { packer_bootstrap, packer, use }
