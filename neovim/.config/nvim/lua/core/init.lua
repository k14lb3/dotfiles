local ok, impatient = pcall(require, 'impatient')

if ok then
  impatient.enable_profile()
end

require 'core.settings'
require 'core.autocmds'
require 'core.mappings'
require 'plugins'
