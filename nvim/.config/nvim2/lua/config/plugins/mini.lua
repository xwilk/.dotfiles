return {
  {
    'echasnovski/mini.nvim',
    enabled = true,
    config = function()
      require('mini.statusline').setup { use_icons = true }
      require("mini.comment").setup()
      require("mini.pairs").setup()
      require("mini.splitjoin").setup()
      require("mini.surround").setup()
      require("mini.tabline").setup()
    end
  }
}
