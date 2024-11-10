-- ┏━━━━━━━┓
-- ┃ utils ┃
-- ┗━━━━━━━┛

local M = {}

-- ━ Checkers ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

---Checks if the given value is a number.
---@param value any
---@return boolean
M.is_number = function(value)
  if type(value) ~= 'number' then return false end

  return true
end

---Checks if the given value is a string.
---@param value any
---@return boolean
M.is_string = function(value)
  if type(value) ~= 'string' then return false end

  return true
end

---Checks if the given value is a table.
---@param value any
---@return boolean
M.is_table = function(value)
  if type(value) ~= 'table' then return false end

  return true
end

---Checks if the given value is an array.
---@param value any
---@return boolean
M.is_array = function(value)
  if not M.is_table(value) then return false end

  if #value == 0 then return false end

  for key, _ in pairs(value) do
    if not M.is_number(key) then return false end
  end

  return true
end

---Checks if the given value is a function.
---@param value any
---@return boolean
M.is_function = function(value)
  if type(value) ~= 'function' then return false end

  return true
end

---Checks if the given string exists within the given array.
---@param array string[]
---@param string string
---@return boolean
M.is_string_in_array = function(array, string)
  for _, value in ipairs(array) do
    if value == string then return true end
  end

  return false
end

---Checks if the current mode is visual mode.
---@return boolean
M.is_in_visual_mode = function()
  local mode = vim.fn.mode()

  if mode == 'v' then return true end

  if mode == 'V' then return true end

  if mode == '' then return true end

  return false
end

---Checks if every element in a table is a table.
---@param table_ table
---@return boolean
M.is_every_table_element_table = function(table_)
  if type(table_) ~= 'table' then return false end

  for _, value in pairs(table_) do
    if type(value) ~= 'table' then return false end
  end

  return true
end

---Checks if a macro is currently being recorded.
---@return boolean
M.is_recording_macro = function()
  if vim.fn.reg_recording() == '' then return false end

  return true
end

---Checks if a macro is currently being executed.
---@return boolean
M.is_executing_macro = function()
  if vim.fn.reg_executing() == '' then return false end

  return true
end

---Checks if the given filepath exists.
---@param filepath string
---@return boolean
M.is_file_existing = function(filepath)
  local file_stat = vim.uv.fs_stat(filepath)

  if not file_stat then return false end

  return true
end

---Checks if the given string matches any pattern from a list of patterns.
---@param patterns string[]
---@param string string
---@return boolean
M.is_matching_any_pattern = function(patterns, string)
  for _, pattern in ipairs(patterns) do
    repeat
      if not string.match(string, pattern) then break end

      return true
    until true
  end

  return false
end

-- ━ Getters ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

---Gets the value of a global variable.
---@param name string
---@return any
M.get_global = function(name) return vim.g[name] end

---Gets the value of an option.
---@param name string
---@return any
M.get_option = function(name) return vim.opt[name] end

---Gets table keys.
---@param table_ table
---@return string[]
M.get_table_keys = function(table_)
  local keys = {}

  for k, _ in pairs(table_) do
    table.insert(keys, k)
  end

  return keys
end

---Gets the unsaved buffers.
---@return string[]
M.get_unsaved_buffers = function()
  local buffers = vim.api.nvim_list_bufs()
  local unsaved_buffers = {}

  for _, buffer in ipairs(buffers) do
    if vim.api.nvim_buf_get_option(buffer, 'modified') then table.insert(unsaved_buffers, buffer) end
  end

  return unsaved_buffers
end

---Gets the LSP clients attached to the current buffer.
---@return string[]
M.get_current_buffer_lsp_clients = function()
  local clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
  local client_names = {}

  for _, client in ipairs(clients) do
    table.insert(client_names, client.name)
  end

  return client_names
end

---Creates an autocommand event handler, defined by callback or command.
---https://neovim.io/doc/user/api.html#nvim_create_autocmd()
---@param event string|string[]
---@param options table
M.create_autocmd = function(event, options) vim.api.nvim_create_autocmd(event, options) end

---Creates multiple autocommand event handler, defined by callback or command.
---@param ... [string|string[], table]
M.create_autocmds = function(...)
  if not M.is_every_table_element_table({ ... }) then
    error('Each element must be a table containing valid options.', 2)
  end

  for _, autocmd in ipairs({ ... }) do
    M.create_autocmd(M.unpack(autocmd))
  end
end

---Creates an autocmd group.
---https://neovim.io/doc/user/api.html#nvim_create_augroup()
---@param name string
M.create_augroup = function(name) vim.api.nvim_create_augroup(name, {}) end

-- ━ Setters ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

---Sets the value of a global variable.
---@param name string
---@param value any
M.set_global = function(name, value) vim.g[name] = value end

---Sets the value of an option.
---@param name string
---@param value any
M.set_option = function(name, value) vim.opt[name] = value end

---Sets the value of an option.
---@param ... [string, any]
M.set_options = function(...)
  for _, array in ipairs({ ... }) do
    vim.opt[array[1]] = array[2]
  end
end

---Defines a mapping of keycodes to a function or keycodes.
---https://neovim.io/doc/user/lua.html#vim.keymap.set()
---@param modes string|string[]
---@param left_hand_side string
---@param right_hand_side string|function
---@param options table?
M.set_keymap = function(modes, left_hand_side, right_hand_side, options)
  vim.keymap.set(modes, left_hand_side, right_hand_side, M.merge({ noremap = true, silent = true }, options or {}))
end

---Defines multiple mappings of keycodes to a function or keycodes.
---@param ... [string|string[], string, string|function, table?]
M.set_keymaps = function(...)
  if not M.is_every_table_element_table({ ... }) then
    error('Each element must be a table containing valid options.', 2)
  end

  for _, keymap in ipairs({ ... }) do
    M.set_keymap(M.unpack(keymap))
  end
end

---Defines multiple mappings of keycodes to a function or keycodes to a buffer.
---@param buffer integer|boolean
---@param ... [string|string[], string, string|function, table?]
M.set_buffer_keymaps = function(buffer, ...)
  if not M.is_every_table_element_table({ ... }) then
    error('Each element must be a table containing valid options.', 2)
  end

  for _, keymap in ipairs({ ... }) do
    local modes, left_hand_side, right_hand_side, options = M.unpack(keymap)

    M.set_keymap(modes, left_hand_side, right_hand_side, M.merge({ buffer = buffer }, options or {}))
  end
end

---Sets a highlight group.
---https://neovim.io/doc/user/api.html#nvim_set_hl()
---@param namespace_id number
---@param highlight_group_name string
---@param highlight_definition table
M.set_highlight_group = function(namespace_id, highlight_group_name, highlight_definition)
  vim.api.nvim_set_hl(namespace_id, highlight_group_name, highlight_definition)
end

---Sets multiple highlight group.
---@param ... [number, string, table]
M.set_highlight_groups = function(...)
  if not M.is_every_table_element_table({ ... }) then
    error('Each element must be a table containing valid options.', 2)
  end

  for _, highlight_group in ipairs({ ... }) do
    M.set_highlight_group(M.unpack(highlight_group))
  end
end

-- ━ Misc ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

---@see table.unpack
M.unpack = unpack or table.unpack

---Executes a command.
---@param command string
M.execute = function(command) vim.fn.jobstart(command) end

---Concatenates multiple arrays into a single array.
---@param ... string[]
---@return string[]
M.concat = function(...)
  local concatenated_array = {}

  for _, table_ in pairs({ ... }) do
    for _, value in pairs(table_) do
      table.insert(concatenated_array, value)
    end
  end

  return concatenated_array
end

---Merges multiple tables into a single table.
---@param ... table<string, any>
---@return table<string, any>
M.merge = function(...) return vim.tbl_extend('force', ...) end

---Deep merges multiple tables into a single table.
---@param ... table<string, any>
---@return table<string, any>
M.deep_merge = function(...) return vim.tbl_deep_extend('force', ...) end

---Closes the window if there are multiple windows, otherwise, closes neovim.
M.close = function()
  if #vim.api.nvim_tabpage_list_wins(0) > 1 then
    vim.cmd('silent! q')
    return
  end

  local unsaved_buffers = M.get_unsaved_buffers()

  if #unsaved_buffers == 0 then
    vim.cmd('silent! q')
    return
  end

  vim.notify('Resolve unsaved buffers.', vim.log.levels.ERROR)
  vim.api.nvim_set_current_buf(unsaved_buffers[1])
end

---Closes all the windows.
M.close_all = function()
  vim.cmd('silent! qa')
  vim.notify('Resolve unsaved buffers.', vim.log.levels.ERROR)
end

return M
