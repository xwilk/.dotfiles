return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      require("telescope").setup({
        pickers = {
          find_files = {
            theme = "ivy",
          },
          lsp_definitions = {
            theme = "ivy",
          },
          lsp_references = {
            theme = "ivy",
          },
          -- vim.keymap.set("n", "gd", builtin.lsp_definitions, { buffer = 0 })
          -- vim.keymap.set("n", "gr", builtin.lsp_references, { buffer = 0 })
        },
        extensions = {
          fzf = {},
        },
      })

      require("telescope").load_extension("fzf")

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", builtin.git_files)
      vim.keymap.set("n", "<space>ff", builtin.find_files)
      vim.keymap.set("n", "<space>fg", require("config.telescope.multigrep"))
      vim.keymap.set("n", "<space>fh", builtin.help_tags)
      vim.keymap.set("n", "<space>fb", builtin.buffers)

      -- edit nvim files
      vim.keymap.set("n", "<space>en", function()
        builtin.find_files({
          cwd = vim.fn.stdpath("config"),
          follow = true,
        })
      end)

      -- edit installed packages
      vim.keymap.set("n", "<leader>ep", function()
        builtin.find_files({
          cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
        })
      end)
    end,
  },
}
