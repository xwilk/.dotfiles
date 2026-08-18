-- move block up/down and reindent
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- repalce text but do not override the clipboard
vim.keymap.set("x", "<leader>p", '"_dP')

-- make next yank copy to clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- delete to void registry
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- open project in herdr session
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local function herdr_sessionizer()
  local locations_file = vim.fn.expand("~/.tmux-sessionizer-locations")
  local locations = vim.fn.readfile(locations_file)
  local projects = {}

  for _, location in ipairs(locations) do
    location = vim.fn.expand(vim.fn.expandcmd(location))

    for _, path in ipairs(vim.fn.glob(location .. "/*", false, true)) do
      if vim.fn.isdirectory(path) == 1 then
        table.insert(projects, vim.fn.fnamemodify(path, ":p"))
      end
    end
  end

  require("telescope.pickers")
    .new({}, {
      prompt_title = "Herdr projects",

      finder = require("telescope.finders").new_table({
        results = projects,
      }),

      sorter = require("telescope.config").values.generic_sorter({}),

      attach_mappings = function(prompt_bufnr, map)
        local function select_project()
          local selection = action_state.get_selected_entry()

          actions.close(prompt_bufnr)

          if selection then
            vim.fn.jobstart({
              "herdr-sessionizer",
              selection[1],
            })
          end
        end

        actions.select_default:replace(select_project)

        return true
      end,
    })
    :find()
end

vim.keymap.set("n", "<C-f>", herdr_sessionizer, {
  desc = "Herdr project sessionizer",
})

-- vim.keymap.set("n", "<C-f>", "<cmd>!herdr workspace create herdr-sessionizer<CR>", { silent = true })
-- vim.keymap.set("n", "<C-f>", "<cmd>!tmux-sessionizer<CR>", { silent = true })
-- vim.keymap.set("n", "<C-f>", function()
--   vim.fn.jobstart({ "herdr-sessionizer" }, {
--     term = true,
--   })
-- end)

-- source current file
-- run current line
-- run current visual block
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
vim.keymap.set("v", "<leader>x", ":lua<CR>")

-- navigate quickfix
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")
vim.keymap.set("n", "<leader>q", "<cmd>copen<CR>")
vim.keymap.set("n", "<leader>Q", "<cmd>cclose<CR>")

-- navigate buffers
vim.keymap.set("n", "bn", ":bnext<CR>")
vim.keymap.set("n", "bp", ":bprev<CR>")

-- copy path to clipboard
vim.keymap.set("n", "<leader>cfp", ":let @+ = expand('%:p')<CR>")
vim.keymap.set("n", "<leader>cp", ":let @+ = expand('%')<CR>")

-- plugins
vim.keymap.set("n", "-", "<cmd>Oil<CR>")
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
