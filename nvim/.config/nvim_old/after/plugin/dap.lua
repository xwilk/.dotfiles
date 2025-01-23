vim.keymap.set("n", "<F1>", ":lua require'dap'.step_into()<CR>")  
vim.keymap.set("n", "<F2>", ":lua require'dap'.step_over()<CR>")  
vim.keymap.set("n", "<F3>", ":lua require'dap'.step_out()<CR>")  
vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")  
vim.keymap.set("n", "<F6>", ":lua require'dap-python'.test_method()<CR>")  
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")  
vim.keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")  
vim.keymap.set("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")  

require('nvim-dap-virtual-text').setup()



local dap, dap_python, dapui = require("dap"), require("dap-python"), require("dapui")
dap_python.setup('/Users/pwilk/.pyenv/versions/debugpy/bin/python')
dap_python.test_runner = 'pytest'
dapui.setup()

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

-- dap.adapters.python = function(cb, config)
--   if config.request == 'attach' then
--     ---@diagnostic disable-next-line: undefined-field
--     local port = (config.connect or config).port
--     ---@diagnostic disable-next-line: undefined-field
--     local host = (config.connect or config).host or '127.0.0.1'
--     cb({
--       type = 'server',
--       port = assert(port, '`connect.port` is required for a python `attach` configuration'),
--       host = host,
--       options = {
--         source_filetype = 'python',
--       },
--     })
--   else
--     cb({
--       type = 'executable',
--       command = '/Users/pwilk/.pyenv/versions/debugpy/bin/python',
--       args = { '-m', 'debugpy.adapter' },
--       options = {
--         source_filetype = 'python',
--       },
--     })
--   end
-- end
-- 
-- dap.configurations.python = {
--   {
--     -- The first three options are required by nvim-dap
--     type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
--     request = 'launch',
--     name = "Chimp UTs",
--     -- -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
--     program = "${file}",
--     args = {},
--     env = {
--       -- SYNC_ENV = "DEVELOPMENT",
--       PYTHONPATH = "/Users/pwilk/projects/chimp",
--       PYTHONDONTWRITEBYTECODE = "1",
--     }
--   },
-- }
