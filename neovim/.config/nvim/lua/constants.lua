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
  'toml',
  'tsx',
  'typescript',
  'vim',
  'vimdoc',
  'xml',
  'yaml',
}

---https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
M.LANGUAGE_SERVERS = {
  bashls = {
    ---https://github.com/bash-lsp/bash-language-server/blob/4353aaba4e0117c0f35965a003343ebaa43ccbd6/server/src/config.ts
    settings = {
      bashide = {
        shellcheckpath = '',
      },
    },
  },
  'clangd',
  'cssls',
  'css_variables',
  'html',
  'jsonls',
  lua_ls = {
    -- https://luals.github.io/wiki/settings/
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
  'mdx_analyzer',
  pyright = {
    -- https://microsoft.github.io/pyright/#/configuration?id=main-configuration-options
    settings = {
      python = {
        analysis = {
          typecheckingmode = 'off',
        },
      },
    },
  },
  'taplo',
  ts_ls = {
    -- https://github.com/typescript-language-server/typescript-language-server?tab=readme-ov-file#configuration
    commands = {
      OrganizeImports = {
        function()
          vim.lsp.buf.execute_command({
            command = '_typescript.organizeImports',
            arguments = { vim.api.nvim_buf_get_name(0) },
          })
        end,
      },
    },
  },
  'yamlls',
}

---https://mason-registry.dev/registry/list
M.FORMATTERS = {
  'clang-format',
  'isort',
  'prettierd',
  'shfmt',
  'stylua',
  'yapf',
}

---https://mason-registry.dev/registry/list
M.LINTERS = {
  'cpplint',
  'eslint',
  'eslint_d',
  'ruff',
  'selene',
  'shellcheck',
}

return M
