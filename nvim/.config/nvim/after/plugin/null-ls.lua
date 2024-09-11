local nls = require('null-ls')

local fmt = nls.builtins.formatting
local dgn = nls.builtins.diagnostics

function fmt_on_save(client, buf)
    if client.supports_method('textDocument/formatting') then
        vim.api.nvim_create_autocmd('BufWritePre', {
            group = fmt_group,
            buffer = buf,
            callback = function()
                vim.lsp.buf.format({
                    timeout_ms = 3000,
                    buffer = buf,
                })
            end,
        })
    end
end

-- Configuring null-ls
nls.setup({
    sources = {
        -- # FORMATTING #
        fmt.trim_whitespace.with({
            filetypes = { 'text', 'sh', 'zsh', 'toml', 'make', 'conf', 'tmux', 'py', 'go' },
        }),
        fmt.black,
        fmt.isort,
        fmt.gofmt,
        fmt.rustfmt,
        fmt.gofmt,
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
        fmt_on_save(client, bufnr)
    end,
})

