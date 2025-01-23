vim.api.nvim_create_user_command(
    'ReplaceAll', 
    function(opts)
        local search_term = opts.fargs[1]
        local replace_term = opts.fargs[2]
        vim.api.nvim_command('cfdo %s/' .. search_term .. '/' .. replace_term .. '/g | update | bd')
    end,
    { nargs = "*" }
)
