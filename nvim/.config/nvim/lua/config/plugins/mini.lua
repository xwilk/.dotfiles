return {
  {
    "echasnovski/mini.nvim",
    enabled = true,
    config = function()
      require("mini.statusline").setup({ use_icons = true })
      require("mini.comment").setup()
      require("mini.pairs").setup()
      require("mini.splitjoin").setup()
      require("mini.surround").setup({
        mappings = {
          add = "<leader>sa",
          delete = "<leader>sd",
          find = "<leader>sf",
          find_left = "<leader>sF",
          highlight = "<leader>sh",
          replace = "<leader>sr",
          update_n_lines = "<leader>sn",
        },
      })
      require("mini.tabline").setup()
    end,
  },
}
