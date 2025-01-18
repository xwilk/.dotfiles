return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      {
        "folke/lazydev.nvim",
        ft = "lua", -- onlu load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        automatic_installation = true,
      })

      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.pylsp.setup({
        settings = {
          pylsp = {
            plugins = {
              -- formatter options
              black = { enabled = false },
              autopep8 = { enabled = false },
              flake8 = { enabled = false },
              yapf = { enabled = false },
              -- linter options
              pylint = { enabled = true },
              mypy = { enabled = true },
              ruff = { enabled = false },
              mccabe = { enabled = false },
              pyflakes = { enabled = false },
              pycodestyle = { enabled = false },
              -- auto-completion options
              jedi_completion = { fuzzy = true },
              -- import sorting
              isort = { enabled = true },
              -- refactor
              rope_autoimport = { enables = false },
            }
          }
        }
      })

      -- auto-format on save
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          ---@diagnostic disable-next-line: missing-parameter
          if client.supports_method('textDocument/formatting') then
            -- Format the current buffer on save
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufrn = args.buf, id = client.id })
              end,
            })
          end
        end,
      })

      vim.keymap.set("n", "gd", vim.lsp.buf.definition)
    end,
  },
}
