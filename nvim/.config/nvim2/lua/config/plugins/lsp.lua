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
      { 'jose-elias-alvarez/null-ls.nvim' },
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
        capabilities = capabilities,
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
      function format_on_save(buf, client)
        if client.supports_method('textDocument/formatting') then
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = fmt_group,
            buffer = buf,
            callback = function()
              vim.lsp.buf.format({
                timeout_ms = 3000,
                bufnr = buf,
              })
            end
          })
        end
      end

      -- vim.api.nvim_create_autocmd('LspAttach', {
      --   callback = function(args)
      --     local client = vim.lsp.get_client_by_id(args.data.client_id)
      --     if not client then return end
      --     format_on_save(args.buf, client)
      --   end,
      -- })

      vim.keymap.set("n", "gd", vim.lsp.buf.definition)

      -- Configuring null-ls
      local nls = require('null-ls')
      local fmt = nls.builtins.formatting
      local dgn = nls.builtins.diagnostics

      nls.setup({
        sources = {
          -- # FORMATTING #
          fmt.trim_whitespace.with({
            filetypes = { 'text', 'sh', 'zsh', 'toml', 'make', 'conf', 'tmux', 'py', 'go', 'ts', 'tsx' },
          }),
          fmt.black,
          fmt.isort,
          fmt.gofmt,
          fmt.rustfmt,
          fmt.stylua,
          fmt.shfmt.with({
            extra_args = { '-i', 4, '-ci', '-sr' },
          }),
          -- # DIAGNOSTICS #
          dgn.pylint,
          dgn.mypy,
          dgn.shellcheck,
          dgn.luacheck.with({
            extra_args = { '--globals', 'vim', '--std', 'luajit' },
          }),
        },
        on_attach = function(client, bufnr)
          format_on_save(bufnr, client)
        end,
      })
    end,
  },
}
