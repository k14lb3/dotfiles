local config = function()
  local indentline = require 'indent_blankline'

  indentline.setup {
    show_current_context = true,
    show_current_context_start = true,
    context_patterns = {
      'class',
      'return',
      'function',
      'method',
      '^if',
      '^while',
      'jsx_element',
      '^for',
      '^object',
      '^table',
      'block',
      'arguments',
      'if_statement',
      'else_clause',
      'jsx_element',
      'jsx_self_closing_element',
      'try_statement',
      'catch_clause',
      'import_statement',
      'operation_type',
    },
  }
end

return {
  config = config,
}
