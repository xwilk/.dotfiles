return {
  {
    'echasnovski/mini.nvim',
    enabled = true,
    config = function()
      require('mini.statusline').setup { use_icons = true }
      require("mini.comment").setup()
    end
  }
}
