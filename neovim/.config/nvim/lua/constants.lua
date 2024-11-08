-- ┏━━━━━━━━━━━┓
-- ┃ constants ┃
-- ┗━━━━━━━━━━━┛

local M = {}

M.GLOBALS = {
  IS_LAZY_LOADED = 'IS_LAZY_LOADED',
  IS_LINTING = 'IS_LINTING',
}

M.APPLICATION = {
  IMAGE_VIEWER = 'imv',
  VIDEO_PLAYER = 'mpv',
}

M.PATH = {
  NVIM_CONFIG_DIRECTORY = os.getenv('XDG_CONFIG_HOME') .. '/nvim',
  SCREENSHOTS_DIRECTORY = os.getenv('HOME') .. '/pictures/screenshots',
}

M.PATTERNS = {
  IMAGE = {
    '%.png$',
    '%.jpg$',
    '%.jpeg$',
    '%.bmp$',
    '%.gif$',
    '%.svg$',
    '%.webp$',
    '%.tiff?$',
  },
  AUDIO = {
    '%.mp3$',
    '%.wav$',
    '%.flac$',
    '%.aac$',
    '%.ogg$',
    '%.m4a$',
    '%.wma$',
    '%.aiff$',
    '%.alac$',
  },
  VIDEO = {
    '%.mp4$',
    '%.mkv$',
    '%.avi$',
    '%.mov$',
    '%.wmv$',
    '%.flv$',
    '%.webm$',
    '%.mpeg$',
    '%.mpg$',
  },
  COMPRESSED = {
    '%.zip$',
    '%.tar$',
    '%.gz$',
    '%.bz2$',
    '%.xz$',
    '%.7z$',
    '%.rar$',
    '%.tar.gz$',
    '%.tar.bz2$',
    '%.tar.xz$',
  },
}

M.ICONS = {
  ERROR = '',
  WARN = '',
  HINT = '',
  INFO = '',
  ANCHOR = '󰀱',
  FILE = '',
  FILE_CODE = '',
  FILE_DOCUMENT = '󰧮',
  GO_TO_FILE = '',
  FOLDER = '',
  RECORD = '',
  PLUS = '',
  MINUS = '',
  ASTERISK = '',
  FONT = '',
  NEWLINE = '',
  TEXT = '',
  ARROW_UP_DOWN = '󰹹',
  PIN = '',
  KEY = '',
  METHOD = '',
  FIELD = '',
  VARIABLE = '',
  CLASS = '',
  INTERFACE = '',
  NAMESPACE = '',
  PROPERTY = '',
  RULER = '',
  KEYWORD = '',
  SNIPPET = '',
  COLOR = '',
  ENUM = '',
  CONSTANT = '',
  STRUCTURE = '',
  EVENT = '',
  OPERATOR = '',
  PARAMETER = '',
  CHECK = '',
  X = '',
  PENDING = '⟳',
  SHADE = '░',
}

---https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
M.TREESITTER_PARSERS = {
  'bash',
  'c',
  'cpp',
  'css',
  'go',
  'html',
  'javascript',
  'jsdoc',
  'json',
  'lua',
  'luadoc',
  'markdown',
  'markdown_inline',
  'query',
  'regex',
  'scss',
  'swift',
  'toml',
  'tsx',
  'typescript',
  'vim',
  'vimdoc',
  'xml',
  'yaml',
}

---https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
M.LANGUAGE_SERVERS = {
  bashls = {
    settings = {
      bashIde = {
        shellcheckPath = '',
      },
    },
  },
  clangd = {},
  cssls = {},
  css_variables = {},
  denols = function(lspconfig)
    return {
      root_dir = lspconfig.util.root_pattern('deno.json', 'deno.jsonc'),
    }
  end,
  eslint = {},
  html = {},
  jsonls = {},
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = {
            'vim',
          },
        },
      },
    },
  },
  mdx_analyzer = {},
  pyright = {
    settings = {
      python = {
        analysis = {
          typecheckingmode = 'off',
        },
      },
    },
  },
  taplo = {},
  ts_ls = function(lspconfig)
    return {
      commands = {
        OrganizeImports = {
          function()
            vim.lsp.buf.execute_command({
              command = '_typescript.organizeImports',
              arguments = {
                vim.api.nvim_buf_get_name(0),
              },
            })
          end,
        },
      },
      root_dir = lspconfig.util.root_pattern('package.json'),
      single_file_support = false,
    }
  end,
  yamlls = {},
}

---https://mason-registry.dev/registry/list
M.FORMATTERS = {
  'clang-format',
  'isort',
  'prettierd',
  'shfmt',
  'swift_format',
  'stylua',
  'yapf',
}

---https://mason-registry.dev/registry/list
M.LINTERS = {
  'eslint_d',
  'ruff',
}

return M
